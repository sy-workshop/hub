# Download from github
echo "> [PENPOT] Starting install ... "

sudo wget https://raw.githubusercontent.com/penpot/penpot/main/docker/images/docker-compose.yaml
sudo docker compose -p penpot -f docker-compose.yaml up -d