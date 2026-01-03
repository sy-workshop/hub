## Samba install and config script
echo ""
echo "> Installing samba ... "
sudo apt install samba

# Create users
echo "| > Creating public user ... "
sudo useradd -m public

# Prompt new passwords
echo "| > Enter samba password for 'sy':"
sudo smbpasswd -a sy
echo "| > Enter samba password for 'public':"
sudo smbpasswd -a public

# Create directories
echo "| > Creating directories ... "

mkdir -p /home/public/solid_edge_std    # Letter N - "Norm"
mkdir -p /home/sy/archive               # Letter O - "Old"
mkdir -p /home/sy/labshare              # Letter S - "Storage"

# Config file and networking
echo "| > Configuring samba ... "

sudo cp smb.conf /etc/samba/smb.conf
sudo service smbd restart
sudo ufw allow samba

echo "| > Samba installation done!" 