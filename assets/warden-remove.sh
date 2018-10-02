#!/bin/bash

clear

tput setaf 4;
echo "__        __            _"
echo "\ \      / /_ _ _ __ __| | ___ _ __"
echo " \ \ /\ / / _  | __/  _  |/ _ \  _  \\"
echo "  \ V  V / (_| | | | (_| |  __/ | | |"
echo "   \_/\_/ \__,_|_|  \__,_|\___|_| |_| remove a profile"
tput sgr0

echo ""
echo -n "Enter a username: "
read username
echo ""

if [ ! -f /usr/local/bin/warden/$username-creds.sh.gpg ]; then
    echo ""
    echo "Username not found!"
    echo ""
else
    echo -n "Are you sure you want to remove profile: $username? [n/y]: "
    read removeuser
    echo ""
    if [[ $removeuser == "Y" || $removeuser == "y" || $removeuser == "yes" ]]; then
        echo "Profile for $username has been removed from Warden"
        echo ""
        rm -rf /usr/local/bin/warden/$username-creds.sh.gpg
    else
        echo "Profile for $username NOT removed"
        echo ""
    fi
fi
