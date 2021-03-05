#!/bin/bash
# Cloning the Updated neofetch script from https://raw.githubusercontent.com/Jai-JAP/neofetch/patch-1/neofetch to /tmp/neofetch
wget -q https://raw.githubusercontent.com/Jai-JAP/neofetch/patch-1/neofetch -O /tmp/neofetch

# Make neofetch script executable
chmod +x /tmp/neofetch

# Moving the neofetch script to /usr/bin
sudo mv /tmp/neofetch /usr/bin/neofetch

# Removing all old neofetch configs
sudo rm -rf ~/.config/neofetch/*

# Removing the neofetch folder from /tmp
sudo rm /tmp/neofetch

# Installing dependencies required to improve .neofetch script
sudo apt install wmctrl

# Updating the .neofetch script in home directory
sed -i 's/neofetch/wmctrl -i -r $WINDOWID -b toggle,maximized_vert,maximized_horz\nneofetch/g' ~/.neofetch
