# hub

Set of script files and custom software to setup the `hub.local` server used in the workshop.

## Install script

To install all of the said components, run the install script at the repo root `install.sh`. It will install the following things:

1. APT Updates and essentials
2. Required programming languages (Python, Lua, Rust, ... )
3. Mosquitto using the configuration file in the root `mosquitto.conf`
4. Samba file sharing with the given configuration file `smb.conf`
5. ZeroTier and prompt for a network-ID to join to
6. Nextcloud dependencies
7. The custom [syhub](#syhub) software

If all the setups have already been done and just an update of the syhub software is desired, then the `syhub_install.sh` shell file can be executed directly as well.

## syhub

A general purpose service to manage dataflow and processes with the hub server. It includes

- A mirror *HTTPS EventStream* to enable secure MQTT with easy access from JavaScript