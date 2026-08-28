echo "[MariaDB] Starting install ... "

sudo apt update
sudo apt upgrade

sudo apt install mariadb-server

read -p "Password for database user 'sy': " DB_PASSWORD

# Start SQL
sudo mysql <<EOF

CREATE USER 'sy'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
CREATE DATABASE IF NOT EXISTS nextcloud CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL PRIVILEGES ON nextcloud.* TO 'sy'@'localhost';
FLUSH PRIVILEGES;

EOF

