## Samba install and config script
echo ""
echo "> Installing samba ... "
sudo apt install samba

# Create users and groups
sudo groupadd sambausers
sudo usermod -aG sambausers sy
sudo usermod -aG sambausers public

# Create directories
echo "| > Creating directories ... "

mkdir -p /srv/solid_edge_std            # Letter N - "Norm"
mkdir -p /home/sy/archive               # Letter S - "Storage"
mkdir -p /home/sy/labshare              # Letter L - "Labshare"

chgrp -R sambausers /srv/solid_edge_std
chmod -R 777 /srv/solid_edge_std
chmod -R 777 /home/sy/archive 
chmod -R 777 /home/sy/labshare

# Config file and networking
echo "| > Configuring samba ... "

sudo cp smb.conf /etc/samba/smb.conf
sudo service smbd restart
sudo ufw allow samba

# Prompt new passwords
echo "| > Enter samba password for 'sy':"
sudo smbpasswd -a sy
echo "| > Enter samba password for 'public':"
sudo smbpasswd -a public

echo "| > Samba installation done!" 