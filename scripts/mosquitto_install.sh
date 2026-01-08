# Installing cool services
## Mosquitto
echo "> [MOSQUITTO] Starting install ... "

echo "| -> Creating certificates ... "

export CERT_PATH=/etc/certificates
mkdir -p $CERT_PATH

# Check OpenSSL install
sudo apt update
sudo apt install openssl

# Create certificates
openssl req -new -x509 -days 3650 -extensions v3_ca \
  -keyout $CERT_PATH/ca.key -out $CERT_PATH/ca.crt

openssl genrsa -out $CERT_PATH/server.key 2048
openssl req -new -key $CERT_PATH/server.key -out $CERT_PATH/server.csr

openssl x509 -req -in $CERT_PATH/server.csr \
  -CA $CERT_PATH/ca.crt -CAkey $CERT_PATH/ca.key -CAcreateserial \
  -out $CERT_PATH/server.crt -days 365


echo "| -> Starting install and configuration ... "
sudo apt install mosquitto
sudo cp mosquitto.conf /etc/mosquitto/mosquitto.conf


echo "| -> Configuration copied! Starting service ... "
sudo service mosquitto restart

echo "| -> Configuring firewall"

# Open ports
sudo ufw allow 11883
sudo ufw allow 18883
sudo ufw allow 19001
sudo ufw allow 19883

echo "| -> Done!"