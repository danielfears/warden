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

if [ ! -f ~/wardencreds/$username-creds.sh.gpg ]; then
    echo ""
    echo "Username not found!"
    echo ""
else
    unset ARM_SUBSCRIPTION_ID
    unset ARM_CLIENT_ID
    unset ARM_CLIENT_SECRET
    unset ARM_TENANT_ID
    sudo gpg --output ~/wardencreds/$username-creds.sh --decrypt ~/wardencreds/$username-creds.sh.gpg
    wait
    source ~/wardencreds/$username-creds.sh
    wait
    rm -rf ~/wardencreds/$username-creds.sh
    clear
    echo "*** Azure credentials successfully sourced ***"
    echo " "
fi



sudo gpg --output ~/wardencreds/test-creds.sh --decrypt ~/wardencreds/test-creds.sh.gpg

source ~/wardencreds/test-creds.sh

rm -rf ~/wardencreds/test-creds.sh