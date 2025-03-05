echo ""
echo "############################"
echo "#    HUB INSTALL SCRIPT    #"
echo "############################"
echo ""
echo "> Version: 0.1.1/2025/03/05"
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

# Installing cool services
## Mosquitto
echo ""
echo "> Installing mosquitto ... "
sudo apt install mosquitto
sudo cp mosquitto.conf /etc/mosquitto/mosquitto.conf
sudo service mosquitto restart

## Samba
echo ""
echo "> Installing samba ... "
sudo apt install samba

mkdir /home/sy/labshare
mkdir /home/sy/archive

sudo cp smb.conf /etc/samba/smb.conf
sudo service smbd restart
sudo ufw allow samba

## Zerotier
echo "> Installing ZeroTier ... "
curl -s https://install.zerotier.com | sudo bash

read -p "Enter Network-ID: " ZT_NETWORK_ID

sudo zerotier-cli join "$ZT_NETWORK_ID"

## Nextcloud dependencies
sudo apt install apache2

## syhub
sh syhub_install.sh

# Finish up
echo ""
echo "> [HUB-SETUP] INSTALLATION DONE! Thank you."
echo ""
echo "> Starting configuration prompts: "

# Prompt new passwords
sudo smbpasswd -a sy