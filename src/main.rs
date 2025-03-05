use rocket::{get, launch, routes};
use rocket::fs::{FileServer, NamedFile, Options};
use rocket::response::stream::{Event, EventStream};
use rocket::tokio::time::Duration;

use rumqttc::{MqttOptions, AsyncClient, QoS};
use rumqttc::Event::Incoming;
use rumqttc::Packet::Publish;

// A custom mqtt stream that enables
#[get("/mqtt")]
pub fn mqtt_stream() -> EventStream![] {
    EventStream! {
        // Create an MQTT client and make it listen to all events
        let mut mqttoptions = MqttOptions::new(format!("syhub-web-client-{}", rand::random::<u16>()), "hub.local", 1883);
        mqttoptions.set_keep_alive(Duration::from_secs(5));

        let (client, mut eventloop) = AsyncClient::new(mqttoptions, 10);
        client.subscribe("#", QoS::AtMostOnce).await.unwrap();
        
        // Listen for events and mirrors them back
        loop {        
            if let Incoming(Publish(msg)) = eventloop.poll().await.unwrap() {
                yield Event::data(String::from_utf8(msg.payload.to_vec()).expect("Invalid UTF-8 data")).id(msg.topic);
            }
        }        
    }
}

// Create a custom index route to automatically navigate to the index page
#[get("/")]
pub async fn index() -> Option<NamedFile> {
    NamedFile::open("./www/index.html").await.ok()
}

#[launch]
fn rocket() -> _ {
    rocket::build()
        .mount("/", routes![index, mqtt_stream]) 
        .mount("/", FileServer::new("./www", Options::Index))   // Enable static files using the www directory

}