#!/bin/bash
#Checking dependencies
#DEPENDENCIES
 #ARCH LINUX
  sudo pacman -Sy bc lshw dmidecode
 #DEBIAN
  #WIP
 #FEDORA
  #WIP
 #GENTOO
  #WIP
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
echo ""
echo "You should now be able to use the command "bashfetch""
