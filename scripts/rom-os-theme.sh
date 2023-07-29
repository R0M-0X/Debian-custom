#!/bin/bash

if [ "$(id -u)" == 0 ]; then echo "Please don't run as root." >&2; exit 1; fi
# Require script to be run via sudo, but not as root
sudo add-apt-repository ppa:papirus/papirus
sudo apt update
sudo apt install papirus-icon-theme

# Change to wget
sudo cp ../custom/wallpapers/wallpaper.jpg /usr/share/wallpapers/
sudo cp -r ../custom/themes/Dracula /usr/share/themes/
sudo cp ../custom/root/.bashrc /root/
# To all users (/etc/skel)
sudo cp ../custom/etc/skel/.bashrc /etc/skel/
sudo cp ../custom/etc/skel/.bashrc /home/$USER/

# cd ./custom/lightdm/neon
# make build
# sudo make install

#cd $DIR_PATH

# sudo cp ../custom/etc/lightdm/lightdm.conf /etc/lightdm/

# sudo cp ./custom/etc/lightdm/web-greeter.yml /etc/lightdm/

#wget https://github.com/dracula/gtk/archive/master.zip -O dracula.zip
#sudo mkdir -p /usr/share/themes/dracula
#sudo unzip -o dracula.zip -d /usr/share/themes/dracula
#sudo rm dracula.zip

# Faire un fork pour être sur du DL
#[ -d Colloid-icon-theme ] && rm -r Colloid-icon-theme
#git clone https://github.com/vinceliuice/Colloid-icon-theme.git
#cd Colloid-icon-theme
#sudo ./install.sh -d /usr/share/icons -n Colloid -s nord -t grey
#cd ..
#sudo rm -r Colloid-icon-theme

# Change Cinnamon settings
gsettings set org.cinnamon.desktop.wm.preferences theme Dracula
gsettings set org.cinnamon.desktop.interface gtk-theme Dracula
gsettings set org.cinnamon.theme name Dracula

gsettings set org.cinnamon.desktop.background picture-uri "file:///usr/share/wallpapers/wallpaper.jpg"

gsettings set org.cinnamon.desktop.interface icon-theme ePapirus-Dark


# sed -i -e 's/"workbench.colorTheme": ".*"/"workbench.colorTheme": "Visual Studio Dark"/g' "$HOME/.config/Code/User/settings.json"

# Utiliser le dossier /etc/skel -> equivalent du dossier /users/default de Windows


# wget https://github.com/R0M-LR/rom-os/archive/master.zip
#unzip -o master.zip
#cd master


#Faire un script dans le autostart avec les gsettings ?

#mkdir -p /etc/skel/.config/dconf

#cp /home/$USER/.config/dconf/user /etc/skel/.config/dconf



#Then go to your .config folder and also .local folder and just make a copy of these two.
#Then do a skel.
#Then compare your .config and .config copy with each other with Meld.
