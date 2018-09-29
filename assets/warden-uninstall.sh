#!/bin/bash

clear

tput setaf 4;
echo "__        __            _"
echo "\ \      / /_ _ _ __ __| | ___ _ __"
echo " \ \ /\ / / _  | __/  _  |/ _ \  _  \\"
echo "  \ V  V / (_| | | | (_| |  __/ | | |"
echo "   \_/\_/ \__,_|_|  \__,_|\___|_| |_| uninstall"
tput sgr0

echo ""
echo "*** WARNING ***"
echo "UNINSTALLING WILL REMOVE SAVED CREDENTIALS"
echo ""
echo -n "Do you want to continue? [n/y]: "
read warning

if [[ $warning == "Y" || $warning == "y" || $warning == "yes" ]]; then
    rm -rf ~/opt/warden
    sed -i -e '/warden/d' ~/.bash_profile
    rm -rf ~/.gnupg/gpg-agent.conf
    clear
    echo "(Removed Warden folder & credentials)"
    echo "(Removed GPG settings file)"
    echo "(Removed Warden function entry from .bash_profile)"
    echo ""
    echo "***  Warden has been uninstalled and all credentials removed  ***"
    echo ""
else
    echo "Did not uninstall Warden"
    echo ""
fi
