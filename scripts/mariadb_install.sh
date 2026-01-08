echo "[MariaDB] Starting install ... "

sudo apt update
sudo apt upgrade

sudo apt install mariadb-server

sudo

# Start SQL
sudo mysql <<EOF

CREATE USER 'sy'@'localhost' IDENTIFIED BY '%';


EOF

