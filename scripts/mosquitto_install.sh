# Installing cool services
## Mosquitto
echo "> [MOSQUITTO] Starting install ... "

sudo apt install mosquitto
sudo cp mosquitto.conf /etc/mosquitto/mosquitto.conf
sudo service mosquitto restart

# Open ports
sudo ufw allow 11883
sudo ufw allow 18883
sudo ufw allow 19001
sudo ufw allow 19883