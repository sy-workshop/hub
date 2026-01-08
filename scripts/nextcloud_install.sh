echo "[NEXTCLOUD] Starting install ... "

# PHP Install
echo "| -> Installing PHP ..."

sudo apt update

sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update

# Modules from requirements
sudo apt install \
  php8.3 \
  php8.3-cli \
  php8.3-fpm \                  # optional (for Nginx/fastcgi usage)
  php8.3-curl \
  php8.3-gd \
  php8.3-mbstring \
  php8.3-xml \
  php8.3-zip \
  php8.3-common \
  php8.3-bz2 \
  php8.3-json \
  php8.3-opcache \
  php8.3-pdo_mysql
