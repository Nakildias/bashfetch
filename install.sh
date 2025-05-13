#!/bin/bash
#Checking dependencies
#DEPENDENCIES
 #ARCH LINUX
if command -v pacman &> /dev/null; then
  sudo pacman -Sy bc lshw dmidecode mesa-utils
fi
 #DEBIAN
if command -v apt &> /dev/null; then
  sudo apt update && sudo apt install bc lshw dmidecode mesa-utils
fi
 #FEDORA
if command -v dnf &> /dev/null; then
  sudo dnf install bc lshw dmidecode glx-utils
fi
 #GENTOO
if command -v emerge &> /dev/null; then
  sudo emerge --sync && sudo emerge --ask sys-devel/bc sys-apps/lshw sys-apps/dmidecode x11-apps/mesa-progs
fi

echo "Making bashfetch executable"
chmod +x ./bashfetch
echo "Moving bashfetch to /bin/bashfetch"
echo "Root privilege is required to write into /bin"
sudo cp ./bashfetch /bin/

# bashfetch path
FILE="/bin/bashfetch"

while true; do
    # Ask the user
    read -p "Are you using a virtual machine? (y/n): " response
    
    # Convert response to lowercase
    response=$(echo "$response" | tr '[:upper:]' '[:lower:]')
    
    if [[ "$response" == "y" ]]; then
        # Use sed to modify line #9
        sudo sed -i '9s/VM=False/VM=True/' "$FILE"
        echo "VM setting updated in $FILE."
        break
    elif [[ "$response" == "n" ]]; then
        echo "VM setting was unchanged in $FILE."
        break
    else
        echo "Invalid response. Please enter 'y' or 'n'."
    fi
done

echo "Creating ~/.config/bashfetch directory"
mkdir ~/.config/bashfetch
echo "Deleting any existing bashfetch meminfo"
sudo rm ~/.config/bashfetch/meminfo
echo "Root privilege is required to read ram details in dmidecode"
sudo dmidecode --type 17 >> ~/.config/bashfetch/meminfo
echo "RAM details saved to ~/.config/bashfetch/meminfo"

sudo bashfetch > /dev/null 2>&1
if command -v bashfetch &> /dev/null; then
echo "Installation Successful"
echo "You should now be able to use the command "bashfetch""
else
echo "Installation Failed"
fi
