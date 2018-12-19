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
    sudo rm -rf /usr/local/bin/warden
    sudo rm -rf ~/wardencreds

    # Ubuntu installation support
    if [ -e ~/.bashrc ] && [ ! -e ~/.bash_profile ]; then
        sudo sed -i -e '/warden/d' ~/.bashrc
    fi

    # CentOS installation support
    if [ -e ~/.bashrc ] && [ -e ~/.bash_profile ]; then
        sudo sed -i -e '/warden/d' ~/.bashrc
    fi

    # MacOS installation support
    if [ -e ~/.bash_profile ] && [ ! -e ~/.bashrc ]; then
        sudo sed -i -e '/warden/d' ~/.bash_profile
    fi

    sudo rm -rf ~/.gnupg/

    unalias warden-add
    unalias warden-help
    unalias warden-list
    unalias warden-remove
    unalias warden-source
    unalias warden-uninstall

    clear

    echo "(Removed Warden folder & credentials)"
    echo "(Removed GPG settings file)"
    echo "(Removed Warden function entry from .bash_profile / .bashrc)"
    echo ""
    echo "***  Warden has been uninstalled and all credentials removed  ***"
    echo ""
else
    echo "Did not uninstall Warden"
    echo ""
fi
