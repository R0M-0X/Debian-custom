#!/bin/bash
# Faire un depôt pour une gestion des paquets plus simple

#Check release -> $(lsb_release -cs)

####### Dont run as root, run the script with sudo
apt update -yy
# Basic
apt install net-tools curl git sudo htop ftp open-vm-* unzip gnupg2 sudo smbclient -yy
# Web
apt install apache2 mariadb-server php -yy
# Custom
apt install neofetch conky -yy
# Redteam tools
apt install nmap smbmap -yy
# Multimedia
apt install vlc -yy
# Other
apt install onedrive -yy
# Network tools
apt install wireshark tcpdump -yy
# -> suricata, backuppc

wget --quiet -O - https://deb.rom.ovh/apt/debian/key/deb.rom.ovh.asc | tee /etc/apt/keyrings/deb.rom.ovh.asc
echo "deb [signed-by=/etc/apt/keyrings/deb.rom.ovh.asc arch=$( dpkg --print-architecture )] https://deb.rom.ovh/apt/debian stable main" | tee /etc/apt/sources.list.d/rom-os.list
apt update

apt install veeam-release-deb obsidian

## Icons

#add-apt-repository ppa:papirus/papirus
#apt install papirus-icon-theme

add-apt-repository ppa:numix/ppa
apt install numix-icon-theme-circle -yy


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

## Google Chrome -> Ajouter au depot ROM-OS
# Source -> https://www.geekersdigest.com/how-to-install-google-chrome-from-apt-repository/
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/chrome.list
apt update -yy
apt install google-chrome-stable -yy
rm /etc/apt/sources.list.d/chrome.list
apt update -yy

# https://www.spotify.com/us/download/linux/
# -------------------------------------------------------------------------------------------------------------------------------------------
curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -yy
# Si la première connexion ne fonctionne pas, il faut vérifier le navigarteur par defaut (ne fonctionne pas avec Konqueror)

## Visual Studio Code
sudo apt-get install wget gpg -yy
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https -yy
sudo apt update -yy
sudo apt install code -yy

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
