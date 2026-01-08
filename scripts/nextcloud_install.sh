echo "[NEXTCLOUD] Starting install ... "

# PHP Install
echo "| -> Installing Requirements ..."

sudo apt update
sudo apt upgrade

sudo apt install apache2 libapache2-mod-php php-gd php-mysql \
php-curl php-mbstring php-intl php-gmp php-xml php-imagick php-zip

# Download nextcloud
mkdir temp
cd temp

wget https://download.nextcloud.com/server/releases/latest.tar.bz2
tar -xjvf latest.tar.bz2

echo "| -> Copying installation ... "

sudo cp -r nextcloud /var/www
sudo chown -R www-data:www-data /var/www/nextcloud

cd ..

sudo cp apache/nextcloud.conf /etc/apache2/sites-available/nextcloud.conf

sudo a2ensite nextcloud.conf

sudo a2enmod rewrite
sudo a2enmod headers
sudo a2enmod env
sudo a2enmod dir
sudo a2enmod mime

sudo systemctl restart apache2

# HTTPS integration
## Check OpenSSL install
sudo apt update
sudo apt install openssl

mkdir ~/certs
openssl genrsa -des3 -out ~/certs/apache.key 2048
openssl req -x509 -new -nodes -key ~/certs/myCA.key -sha256 -days 1825 -out ~/certs/apache.pem