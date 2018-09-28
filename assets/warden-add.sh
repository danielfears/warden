#!/bin/bash

clear
echo '__        __            _'
echo '\ \      / /_ _ _ __ __| | ___ _ __'
echo ' \ \ /\ / / _` | __/  _  |/ _ \  _  \'
echo '  \ V  V / (_| | | | (_| |  __/ | | |'
echo '   \_/\_/ \__,_|_|  \__,_|\___|_| |_|  Add'
echo ''
echo ''
echo -n "Enter a new username: "
read username
if [ ! -f ~/opt/warden/$username-creds.sh.gpg ]; then
    echo "Username already exists!"
else
touch ~/opt/warden/$username-creds.sh
chmod 755 ~/opt/warden/$username-creds.sh
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
echo "#!/bin/bash" >> ~/opt/warden/$username-creds.sh
echo "export ARM_SUBSCRIPTION_ID=$subid" >> ~/opt/warden/$username-creds.sh
echo "export ARM_CLIENT_ID=$clientid" >> ~/opt/warden/$username-creds.sh
echo "export ARM_CLIENT_SECRET=$clientsecret" >> ~/opt/warden/$username-creds.sh
echo "export ARM_TENANT_ID=$tenantid" >> ~/opt/warden/$username-creds.sh
clear
echo "***  Encrypt credentials with a strong password  ***"
sleep 1
gpg --output ~/opt/warden/$username-creds.sh.gpg --symmetric ~/opt/warden/$username-creds.sh
wait
rm -rf ~/opt/warden/$username-creds.sh
echo "clear"
echo "*** Credentials for $username successfully stored and encrypted ***"
echo ""
