echo ""
echo "############################"
echo "#    HUB INSTALL SCRIPT    #"
echo "############################"
echo ""
echo "> Version: 0.2.0/2025/03/07"
echo ""

# Update apt
echo "> Updating APT ... "
sudo apt update
sudo apt upgrade

# Create users
echo "| > Creating public user ... "
sudo useradd -m public
sudo passwd public

# Install essentials
sudo apt install build-essential checkinstall -y

# Install dependencies
echo ""
echo "> Installing programming languages ... "
sudo apt install python3        
sudo apt install python3-pip
sudo apt install lua5.4
curl https://sh.rustup.rs -sSf | sh -s -- -y

## Zerotier
echo "> Installing ZeroTier ... "
curl -s https://install.zerotier.com | sudo bash

read -p "Enter Network-ID: " ZT_NETWORK_ID

sudo zerotier-cli join "$ZT_NETWORK_ID"

# Installing cool services

## SSH
sudo apt install ssh
sudo service ssh enable
sudo service ssh start

## Scripts
sh scripts/samba_install.sh
sh scripts/syhub_install.sh
sh scripts/docker_install.sh
sh scripts/mosquitto_install.sh

## Docker required
sh scripts/nextcloud_install.sh
sh scripts/penpot_install.sh

# Finish up
echo ""
echo "> [HUB-SETUP] INSTALLATION DONE! Thank you."
echo ""
echo "> Starting configuration prompts: "