#!/bin/bash

clear
echo "*** WARNING ***"
echo "UNINSTALLING WILL REMOVE SAVED CREDENTIALS"
echo ""
echo -n "Do you want to continue? [n/y]: "
read warning
if [[ $warning == "Y" || $warning == "y" || $warning == "yes" ]]; then
    rm -rf ~/opt/warden
    sed -i -e '/warden/d' ~/.bash_profile
    rm -rf ~/.gnupg/gpg-agent.conf
    unalias warden-add
    unalias warden-source
    unalias warden-list
    unalias warden-uninstall
    clear
    echo "(Removed warden folder & credentials)"
    echo "(Removed GPG settings file)"
    echo "(Removed alias entries from .bash_profile)"
    echo ""
    echo "***  Warden has been uninstalled and all credentials removed  ***"
    echo ""
else
    echo "Did not uninstall Warden"
    echo ""
fi
