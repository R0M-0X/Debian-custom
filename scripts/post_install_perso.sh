#!/bin/bash
####### Dont run as root, run the script with sudo
apt update -yy
apt install net-tools apache2 mariadb-server php curl git sudo htop -yy
apt install nmap -yy
apt install neofetch conky -yy
apt install ftp open-vm-* unzip sudo smbclient -yy
apt install fasttrack-archive-keyring -yy
apt install onedrive
# onedrive --synchronize (attention lance la première synchro)

##### Install Wine
dpkg --add-architecture i386
mkdir -pm755 /etc/apt/keyrings
wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources
apt update -yy
apt install --install-recommends winehq-stable -yy

apt install virt-manager virt-viewer virt-v2v virt-p2v -yy
apt install cockpit cockpit-machines -yy
systemctl enable cockpit
systemctl start cockpit
# localhost http://localhost:9090

sudo usermod -aG sudo $USER

#### Bashrc à faire
# PXE server & DHCP no start auto

# Apache
rm -r /var/www/html
touch /var/www/index.html
