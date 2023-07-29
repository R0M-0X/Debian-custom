#!/bin/bash

#Check release -> $(lsb_release -cs)

####### Dont run as root, run the script with sudo

sudo wget --quiet -O - https://deb.rom.ovh/apt/debian/key/deb.rom.ovh.asc | tee /etc/apt/keyrings/deb.rom.ovh.asc
sudo echo "deb [signed-by=/etc/apt/keyrings/deb.rom.ovh.asc arch=$( dpkg --print-architecture )] https://deb.rom.ovh/apt/debian stable main" | tee /etc/apt/sources.list.d/rom-os.list

sudo wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/chrome.list

sudo curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
sudo echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

## Visual Studio Code
sudo wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo rm -f packages.microsoft.gpg

sudo apt update -yy 

# -> suricata, backuppc

sudo apt install ftp open-vm-* curl git python3 python3-pip nmap unzip python3-venv \
ssh proxychains4 freerdp2-x11 lightdm lightdm-settings slick-greeter libpcap-dev \
wget libssl-dev tcpdump sudo smbclient imagemagick ghostscript simplescreenrecorder \
libcurl4-openssl-dev libssl-dev rubygems ruby ruby-dev jq mariadb-client dirb whois \
sslsplit dnsrecon sipsak braa onesixtyone sipvicious build-essential \
make gcc fontconfig fonts-powerline wireshark vlc smbmap neoftech conky apache2 mariadb-server php \
net-tools htop gnupg2 veeam-release-deb obsidian google-chrome-stable spotify-client wget gpg apt-transport-https \
code npm web-greeter -yy

##### Install Wine
dpkg --add-architecture i386
mkdir -pm755 /etc/apt/keyrings
wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bookworm/winehq-bookworm.sources
apt update -yy
apt install --install-recommends winehq-stable -yy

##### Install cockpit
sudo apt install cockpit cockpit-machines -yy
sudo systemctl enable cockpit
sudo systemctl start cockpit
# localhost http://localhost:9090

## Google Chrome -> Ajouter au depot ROM-OS
# Source -> https://www.geekersdigest.com/how-to-install-google-chrome-from-apt-repository/
sudo rm /etc/apt/sources.list.d/chrome.list

# https://www.spotify.com/us/download/linux/
# -------------------------------------------------------------------------------------------------------------------------------------------
# Si la première connexion ne fonctionne pas, il faut vérifier le navigarteur par defaut (ne fonctionne pas avec Konqueror)

### Python tools

python3 -m pip install pipx ## for pipx apps
python3 -m pip install poetry ## For poetry-enabled apps
pipx ensurepath ## Fixes pipx $PATH
pipx install mitm6 ## MITM6 is great

## Path arch
sudo mkdir /redteam
sudo mkdir /blueteam
sudo mkdir -p /redteam/{windows-domains,web,osint,passwords,exploit,wifi,rom-os,wordlists,printers,enumeration,payloads,apple,cloud,evasion,sip}
sudo mkdir /scripts
sudo mkdir -p /pentest/{web,scans,files,users}

## Build out Pentest area:
mkdir -p /root/Pentest/web
mkdir -p /root/Pentest/scans
mkdir -p /root/Pentest/files
mkdir -p /root/Pentest/users
