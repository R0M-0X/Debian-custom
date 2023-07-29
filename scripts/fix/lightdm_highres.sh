#!/bin/bash
# xdpyinfo | awk '/dimensions/ {print $2}'
sudo sed -i.bak '/^\[Seat:*]/{s/#display-setup-script=/display-setup-script=xrandr -s 1920x1200/}' /etc/lightdm/lightdm.conf

