#!/bin/bash
if [ "$(id -u)" == 0 ]; then echo "Please don't run as root." >&2; exit 1; fi

# Require script to be run via sudo, but not as root

# Change to wget
sudo cp ../custom/wallpapers/wallpaper.jpg /usr/share/wallpapers/

wget https://github.com/dracula/gtk/archive/master.zip -O /home/$USER/dracula.zip
cd /home/$USER/
sudo mv dracula.zip /usr/share/themes/
cd /usr/share/themes/
sudo unzip -o dracula.zip
sudo rm dracula.zip

# Faire un fork pour être sur du DL
cd /home/$USER
[ -d Colloid-icon-theme ] && rm -r Colloid-icon-theme
git clone https://github.com/vinceliuice/Colloid-icon-theme.git
cd Colloid-icon-theme
sudo ./install.sh -d /usr/share/icons -n Colloid -s default -t purple
cd ..
sudo rm -r Colloid-icon-theme

# Change Cinnamon settings
gsettings set org.cinnamon.desktop.wm.preferences theme dracula
gsettings set org.cinnamon.desktop.interface gtk-theme dracula
gsettings set org.cinnamon.theme name dracula

gsettings set org.cinnamon.desktop.background picture-uri "file:///usr/share/wallpapers/wallpaper.jpg"

gsettings set org.cinnamon.desktop.interface icon-theme Colloid-purple


# sed -i -e 's/"workbench.colorTheme": ".*"/"workbench.colorTheme": "Visual Studio Dark"/g' "$HOME/.config/Code/User/settings.json"

