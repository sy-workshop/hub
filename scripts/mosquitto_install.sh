# Installing cool services
## Mosquitto
echo "> [MOSQUITTO] Starting install ... "
sudo apt install mosquitto
sudo cp mosquitto.conf /etc/mosquitto/mosquitto.conf
sudo service mosquitto restart
