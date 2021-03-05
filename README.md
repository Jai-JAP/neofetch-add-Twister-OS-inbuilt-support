# neofetch-add-Twister-OS-inbuilt-support
neofetch with inbuilt Twister OS support and patch to install it.


Neofetch script with added inbuilt support for Twister OS. Updated scripts availabe at https://github.com/Jai-JAP/neofetch/tree/patch-1 

Some improvements are also made in .neofetch script of Twister OS used for opening neofetch from start-menu located at /home/pi/.neofetch (Only in Twister OS) to open neofetch window maximised by default so that information is not hidden.

To install this version of neofetch automatically on Twister OS run:

```wget -qO- https://raw.githubusercontent.com/Jai-JAP/neofetch-add-Twister-OS-inbuilt-support/main/install.sh | bash```

To install this version of neofetch on Twister OS manually run:

```
# Cloning the Updated neofetch script from https://raw.githubusercontent.com/Jai-JAP/neofetch/main/neofetch to /tmp/neofetch
wget -q https://raw.githubusercontent.com/Jai-JAP/neofetch/main/neofetch -O /tmp/neofetch

# Make neofetch script executable
chmod +x /tmp/neofetch

# Moving the neofetch script to /usr/bin
sudo mv /tmp/neofetch /usr/bin/neofetch

# Removing all old neofetch configs
sudo rm -rf ~/.config/neofetch/*

# Installing dependencies required to improve .neofetch script
sudo apt install wmctrl

# Updating the .neofetch script in home directory
sed -i 's/neofetch/wmctrl -i -r $WINDOWID -b toggle,maximized_vert,maximized_horz\nneofetch/g' ~/.neofetch 
