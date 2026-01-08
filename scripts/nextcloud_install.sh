echo "[NEXTCLOUD] Starting install ... "

# PHP Install
echo "| -> Installing Requirements ..."

sudo apt update
sudo apt upgrade

sudo apt install apache2 libapache2-mod-php php-gd php-mysql \
php-curl php-mbstring php-intl php-gmp php-xml php-imagick php-zip

# sudo apt install software-properties-common
# sudo add-apt-repository ppa:ondrej/php
# sudo apt update

# # Modules from requirements
# sudo apt install    \
#   php8.3            \
#   php8.3-cli        \
#   php8.3-fpm        \
#   php8.3-curl       \
#   php8.3-gd         \
#   php8.3-mbstring   \
#   php8.3-xml        \
#   php8.3-zip        \
#   php8.3-common     \
#   php8.3-bz2        \
#   php8.3-opcache    \
#   php8.3-mysql      \
#   php8.3-intl       