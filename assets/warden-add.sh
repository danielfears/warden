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

if [ -f /usr/local/bin/warden/$username-creds.sh.gpg ]; then
    echo "Username already exists!"
    echo ""
else
    sudo touch /usr/local/bin/warden/$username-creds.sh
    sudo chmod 755 /usr/local/bin/warden/$username-creds.sh
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
    echo "#!/bin/bash" >> /usr/local/bin/warden/$username-creds.sh
    echo "export ARM_SUBSCRIPTION_ID=$subid" >> /usr/local/bin/warden/$username-creds.sh
    echo "export ARM_CLIENT_ID=$clientid" >> /usr/local/bin/warden/$username-creds.sh
    echo "export ARM_CLIENT_SECRET=$clientsecret" >> /usr/local/bin/warden/$username-creds.sh
    echo "export ARM_TENANT_ID=$tenantid" >> /usr/local/bin/warden/$username-creds.sh
    clear
    echo "***  Encrypt credentials with a strong password  ***"
    sleep 1
    sudo gpg --output /usr/local/bin/warden/$username-creds.sh.gpg --symmetric /usr/local/bin/warden/$username-creds.sh
    wait
    sudo rm -rf /usr/local/bin/warden/$username-creds.sh
    clear
    echo "*** Credentials for $username successfully stored and encrypted ***"
    echo ""
fi
