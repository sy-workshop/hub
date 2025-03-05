# Set variables
export SYHUB_INSTALL_DIR="/opt/sy-workshop/syhub"
export SYHUB_SERVICE_FILE="/etc/systemd/system/syhub.service"

echo "> Configuration: "
echo "| - Installation directory: '$SYHUB_INSTALL_DIR'"
echo "| - SyHub service file destination: '$SYHUB_SERVICE_FILE'"

# Remove current install if it exists
if [ -d "$SYHUB_INSTALL_DIR" ]; then
    echo "> Installation found! Removing ... "
    sudo rm -d -R "$SYHUB_INSTALL_DIR"
fi

# Remove service file if it exists
if [ -f "$SYHUB_SERVICE_FILE" ]; then
    echo "> SyHub service file found! Removing ... " 
    sudo rm -f "$SYHUB_SERVICE_FILE"
fi

echo "> Copying install files ... "

# Install repo to system
sudo cp -r ./ "$SYHUB_INSTALL_DIR"
sudo cp "syhub.service" "$SYHUB_SERVICE_FILE"

echo "> Updating permissions ... "

# Give all permissions
sudo chmod a+rwx "$SYHUB_INSTALL_DIR"
sudo chmod -R 777 "$SYHUB_INSTALL_DIR"

echo "> Building application ... "

cd "$SYHUB_INSTALL_DIR"
cargo build

# Reload systemd
sudo systemctl daemon-reload

# Start service
sudo systemctl start syhub
sudo systemctl enable syhub

# Helper restart
sudo systemctl restart syhub

echo "> [SYHUB] INSTALLATION DONE! Thank you."