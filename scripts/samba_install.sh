## Samba install and config script
echo ""
echo "> Installing samba ... "
sudo apt install samba

# Create users
echo "| > Creating public user: "
sudo useradd -m public

# Prompt new passwords
sudo smbpasswd -a sy
sudo smbpasswd -a public

# Create directories
mkdir -p /home/public/solid_edge_std    # Letter N - "Norm"
mkdir -p /home/sy/archive               # Letter O - "Old"
mkdir -p /home/sy/labshare              # Letter S - "Storage"

# Config file and networking
sudo cp smb.conf /etc/samba/smb.conf
sudo service smbd restart
sudo ufw allow samba