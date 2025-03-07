# Variables
export INSTALL_DIR="/opt/sy-workshop"

# Give all permissions again
sudo chmod -R 777 "$INSTALL_DIR"
sudo chmod a+rwx "$INSTALL_DIR"

# Change into install directory
cd "$INSTALL_DIR/syhub"

sudo "$INSTALL_DIR/syhub/target/debug/hub"