#!/bin/bash
echo "Removing ~/.meminfo"
rm ~/.meminfo
rm ~/.amdgpuname
echo "Root privilege is required to delete /bin/bashfetch"
sudo rm /bin/bashfetch
echo "bashfetch should now be uninstalled"
