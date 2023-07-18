#!/bin/bash
# Faire un depôt pour une gestion des paquets plus simple

#Check release -> $(lsb_release -cs)

####### Dont run as root, run the script with sudo
apt update -yy
# Basic
apt install net-tools curl git sudo htop ftp open-vm-* unzip sudo smbclient -yy
# Web
apt install apache2 mariadb-server php -yy
# Custom
apt install neofetch conky -yy
# Redteam tools
apt install nmap -yy
# Multimedia
apt install vlc -yy
# Other
apt install onedrive obsidian -yy


# onedrive --synchronize (attention lance la première synchro)

##### Install Wine
dpkg --add-architecture i386
mkdir -pm755 /etc/apt/keyrings
wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources
apt update -yy
apt install --install-recommends winehq-stable -yy

apt install cockpit cockpit-machines -yy
systemctl enable cockpit
systemctl start cockpit
# localhost http://localhost:9090

sudo usermod -aG sudo $USER

# PXE server & DHCP no start auto

# Apache
rm -r /var/www/html
touch /var/www/index.html

# Ulauncher
sudo apt update && sudo apt install -y gnupg
gpg --keyserver keyserver.ubuntu.com --recv 0xfaf1020699503176
gpg --export 0xfaf1020699503176 | sudo tee /usr/share/keyrings/ulauncher-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/ulauncher-archive-keyring.gpg] \
          http://ppa.launchpad.net/agornostal/ulauncher/ubuntu jammy main" \
          | sudo tee /etc/apt/sources.list.d/ulauncher-jammy.list
sudo apt update && sudo apt install ulauncher

### Sec tools

python3 -m pip install pipx ## for pipx apps
python3 -m pip install poetry ## For poetry-enabled apps
pipx ensurepath ## Fixes pipx $PATH
pipx install mitm6 ## MITM6 is great

## Build out the Red Team directory for all self-managed tools:
mkdir -p /redteam/windows-domains
mkdir -p /redteam/wifi
mkdir -p /redteam/osint
mkdir -p /redteam/web
mkdir -p /redteam/exploit
mkdir -p /redteam/passwords
mkdir -p /redteam/wordlists
mkdir -p /redteam/printers

## Build out Pentest area:
mkdir -p /root/Pentest/web
mkdir -p /root/Pentest/scans
mkdir -p /root/Pentest/files
mkdir -p /root/Pentest/users
