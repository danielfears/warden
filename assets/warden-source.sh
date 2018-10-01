#!/bin/bash

clear

tput setaf 4;
echo "__        __            _"
echo "\ \      / /_ _ _ __ __| | ___ _ __"
echo " \ \ /\ / / _  | __/  _  |/ _ \  _  \\"
echo "  \ V  V / (_| | | | (_| |  __/ | | |"
echo "   \_/\_/ \__,_|_|  \__,_|\___|_| |_| source credentials"
tput sgr0

echo ""
echo -n "Enter your username: "
read username

if [ ! -f ~/opt/warden/$username-creds.sh.gpg ]; then
    echo ""
    echo "Username not found!"
    echo ""
else
    unset ARM_SUBSCRIPTION_ID
    unset ARM_CLIENT_ID
    unset ARM_CLIENT_SECRET
    unset ARM_TENANT_ID
    gpg --output ~/opt/warden/$username-creds.sh --decrypt ~/opt/warden/$username-creds.sh.gpg
    wait
    source ~/opt/warden/$username-creds.sh
    wait
    rm -rf ~/opt/warden/$username-creds.sh
    clear
    echo "*** Azure credentials successfully sourced ***"
    echo " "
fi
