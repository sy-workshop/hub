# Source article: 
#  <https://linuxiac.com/how-to-install-docker-on-linux-mint-21/>

echo "> [DOCKET] Starting install ... "

# Updating APT
sudo apt update
sudo apt install apt-transport-https ca-certificates curl gnupg

# Add keys
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu jammy stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Refreshing index and installing docker
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Test run
echo "> [DOCKET] Install complete, checking active: $(sudo systemctl is-active docker)"