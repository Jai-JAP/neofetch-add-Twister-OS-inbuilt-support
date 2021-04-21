# neofetch-native-Twister-OS-support
neofetch with inbuilt Twister OS support and patch to install it.


Neofetch script with added inbuilt support for Twister OS. Updated scripts availabe at https://github.com/Jai-JAP/neofetch/tree/patch-1 (neofetch & neofetch.1)

Some improvements are also made in .neofetch script of Twister OS used for opening neofetch from start-menu located at /home/pi/.neofetch (Only in Twister OS) to open neofetch window maximised by default so that information is not hidden.

### To install this version of neofetch automatically on Twister OS run:  

`wget -qO- https://raw.githubusercontent.com/Jai-JAP/neofetch-native-Twister-OS-support/main/install.sh | bash`

or 

Directly [download](https://github.com/Jai-JAP/neofetch-native-Twister-OS-support/raw/main/neofetch_twister-os_support_7.1.0-2_all.deb) and install the [.deb file](https://github.com/Jai-JAP/neofetch-native-Twister-OS-support/blob/main/neofetch_twister-os_support_7.1.0-2_all.deb)

```
wget https://github.com/Jai-JAP/neofetch-native-Twister-OS-support/raw/main/neofetch_twister-os_support_7.1.0-2_all.deb -O neofetch-twister-os.deb
sudo apt install ./neofetch-twister-os.deb
sudo rm ./neofetch-twister-os.deb
```

### To install this version of neofetch on Twister OS manually run:

Clone the Updated neofetch script from [source](https://raw.githubusercontent.com/Jai-JAP/neofetch/patch-1/neofetch) to /tmp/neofetch  
`wget -q https://raw.githubusercontent.com/Jai-JAP/neofetch/patch-1/neofetch -O /tmp/neofetch`

Make neofetch script executable  
`chmod +x /tmp/neofetch`

Moving the neofetch script to /usr/bin  
`sudo mv /tmp/neofetch /usr/bin/neofetch`

Removing all old neofetch configs  
`sudo rm -rf ~/.config/neofetch/*`

Installing dependencies required to improve .neofetch script  
`sudo apt install wmctrl`

Updating the .neofetch launch script in home directory
```
if [[ -x ~/.neofetch ]] ; then ;
  if [[ -z "$(cat ~/.neofetch | grep wmctrl)" ]] ; then ;
    sed -i 's/neofetch/wmctrl -i -r $WINDOWID -b add,maximized_vert,maximized_horz\nneofetch/g' ~/.neofetch ; 
    echo ".neofetch launch script patched successfully." ;
  elif [[ -n "$(cat ~/.neofetch | grep wmctrl)" ]] ; then ;
    echo ".neofetch launch script already patched." ;
  fi ;
else echo ".neofetch launch script does not exist." ;
fi
```
