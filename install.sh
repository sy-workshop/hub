echo ""
echo "############################"
echo "#    HUB INSTALL SCRIPT    #"
echo "############################"
echo ""
echo "> Version: 0.3.0/2025/03/07"
echo ""

# Update apt
echo "> Updating APT ... "
sudo apt update
sudo apt upgrade

# Install essentials
sudo apt insall build-essential checkinstall -y

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

## Samba
echo ""
echo "> Installing samba ... "
sudo apt install samba

mkdir /home/sy/labshare
mkdir /home/sy/archive

sudo cp smb.conf /etc/samba/smb.conf
sudo service smbd restart
sudo ufw allow samba


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

# Prompt new passwords
sudo smbpasswd -a sy