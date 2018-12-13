#!/bin/bash

clear

tput setaf 4;
echo "__        __            _"
echo "\ \      / /_ _ _ __ __| | ___ _ __"
echo " \ \ /\ / / _  | __/  _  |/ _ \  _  \\"
echo "  \ V  V / (_| | | | (_| |  __/ | | |"
echo "   \_/\_/ \__,_|_|  \__,_|\___|_| |_| add a profile"
tput sgr0

echo ""
echo -n "Enter a new username: "
read username

if [ -f ~/wardencreds/$username-creds.sh.gpg ]; then
    echo "Username already exists!"
    echo ""
else
    touch ~/wardencreds/$username-creds.sh
    chmod 755 ~/wardencreds/$username-creds.sh
    echo ""
    echo "Enter Azure environment credentials for: $username"
    echo ""
    echo -n "ARM_SUBSCRIPTION_ID: "
    read subid
    echo -n "ARM_CLIENT_ID: "
    read clientid
    echo -n "ARM_CLIENT_SECRET: "
    read clientsecret
    echo -n "ARM_TENANT_ID: "
    read tenantid
    echo "#!/bin/bash" >> ~/wardencreds/$username-creds.sh
    echo "export ARM_SUBSCRIPTION_ID=$subid" >> ~/wardencreds/$username-creds.sh
    echo "export ARM_CLIENT_ID=$clientid" >> ~/wardencreds/$username-creds.sh
    echo "export ARM_CLIENT_SECRET=$clientsecret" >> ~/wardencreds/$username-creds.sh
    echo "export ARM_TENANT_ID=$tenantid" >> ~/wardencreds/$username-creds.sh
    clear
    echo "***  Encrypt credentials with a strong password  ***"
    sleep 1
    gpg --output ~/wardencreds/$username-creds.sh.gpg --symmetric ~/wardencreds/$username-creds.sh
    wait
    rm -rf ~/wardencreds/$username-creds.sh
    clear
    echo "*** Credentials for $username successfully stored and encrypted ***"
    echo ""
fi
