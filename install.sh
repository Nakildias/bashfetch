#!/bin/bash
#Checking dependencies
sudo pacman -Sy bc lshw dmidecode
echo "Making bashfetch executable"
chmod +x ./bashfetch
echo "Moving bashfetch to /bin/bashfetch"
echo "Root privilege is required to write into /bin"
sudo mv ./bashfetch /bin/
bashfetch
echo "You should now be able to use the command "bashfetch""
