#!/bin/bash

# Add path of azuredulous to environment variables
echo 'alias azuredulous=". ~/opt/azuredulous/azuredulous.sh"' >> ~/.bash_profile
. ~/.bash_profile

# Add configuration settings for GPG to enable password everytime and restart service
touch ~/.gnupg/gpg-agent.conf
echo 'default-cache-ttl 0' >> ~/.gnupg/gpg-agent.conf
echo 'max-cache-ttl 0' >> ~/.gnupg/gpg-agent.conf
gpg-connect-agent /bye

# Creation of installation folder
mkdir -p ~/opt/azuredulous

# Create azuredulous script file
touch ~/opt/azuredulous/azuredulous.sh
chmod 777 ~/opt/azuredulous/azuredulous.sh

# Populate azuredulous.sh
echo '#!/bin/bash' >> ~/opt/azuredulous/azuredulous.sh
echo 'gpg --output ~/opt/azuredulous/creds.sh --decrypt ~/opt/azuredulous/creds.sh.gpg' >> ~/opt/azuredulous/azuredulous.sh
echo 'wait' >> ~/opt/azuredulous/azuredulous.sh
echo 'chmod 777 ~/opt/azuredulous/creds.sh' >> ~/opt/azuredulous/azuredulous.sh
echo 'wait' >> ~/opt/azuredulous/azuredulous.sh
echo 'source ~/opt/azuredulous/creds.sh' >> ~/opt/azuredulous/azuredulous.sh
echo 'wait' >> ~/opt/azuredulous/azuredulous.sh
echo 'rm -rf ~/opt/azuredulous/creds.sh' >> ~/opt/azuredulous/azuredulous.sh
echo 'clear' >> ~/opt/azuredulous/azuredulous.sh
echo 'echo "***  AZURE CREDENTIALS HAVE BEEN SUCCESSFULLY LOADED  ***"' >> ~/opt/azuredulous/azuredulous.sh
echo 'echo ""' >> ~/opt/azuredulous/azuredulous.sh

# Create creds script file
touch ~/opt/azuredulous/creds.sh
chmod 777 ~/opt/azuredulous/creds.sh
clear

# Capture user inputs for environment variables
echo '***  INPUT AZURE ENVIRONMENT CREDENTIALS  ***'
echo ''
echo ''
echo -n 'Enter your ARM_SUBSCRIPTION_ID: '
read subid
echo -n 'Enter your ARM_CLIENT_ID: '
read clientid
echo -n 'Enter your ARM_CLIENT_SECRET: '
read clientsecret
echo -n 'Enter your ARM_TENANT_ID: '
read tenantid

# Save user input environment variables to Creds.sh
echo '#!/bin/bash' >> ~/opt/azuredulous/creds.sh
echo 'export ARM_SUBSCRIPTION_ID=$subid' >> ~/opt/azuredulous/creds.sh
echo 'export ARM_CLIENT_ID=$clientid' >> ~/opt/azuredulous/creds.sh
echo 'export ARM_CLIENT_SECRET=$clientsecret' >> ~/opt/azuredulous/creds.sh
echo 'export ARM_TENANT_ID=$tenantid' >> ~/opt/azuredulous/creds.sh

# Encrypt creds.sh file with gpg
clear
echo '***  ENCRYPT CREDENTIALS USING PASSWORD  ***'
sleep 2

gpg --output ~/opt/azuredulous/creds.sh.gpg --symmetric ~/opt/azuredulous/creds.sh

# Remove unencrypted creds.sh file
wait
rm -rf ~/opt/azuredulous/creds.sh

# Installation message & clean up
clear
echo '***  AZUREDULOUS IS NOW INSTALLED  ***'
echo ''
echo -n 'Would you like to remove installation file? [N/y]: '
read deletefile
clear
if [[ $deletefile == "Y" || $deletefile == "y" || $deletefile == "yes" ]]; then
        echo '***  AZUREDULOUS IS NOW INSTALLED  ***'
        echo ''
        echo '(Installation file deleted)'
        rm -rf InstallAzuredulous.sh
else
        echo '***  AZUREDULOUS IS NOW INSTALLED  ***'
        echo ''
        echo '(Installation file NOT deleted)'
fi
echo ''
echo 'INSTRUCTIONS'
echo ''
echo '- To load credentials, type "azuredulous"'
echo '- To uninstall, run "uninstall.sh" from "azuredulous" folder'
echo ''

# Create uninstall script
touch ~/opt/azuredulous/uninstall.sh
chmod 777 ~/opt/azuredulous/uninstall.sh
echo 'rm -rf ~/opt/azuredulous' >> ~/opt/azuredulous/uninstall.sh
echo "sed -i -e '/azuredulous.sh/d' ~/.bash_profile" >> ~/opt/azuredulous/uninstall.sh
echo 'rm -rf ~/.gnupg/gpg-agent.conf' >> ~/opt/azuredulous/uninstall.sh
echo 'clear' >> ~/opt/azuredulous/uninstall.sh
echo 'echo "(Removed Azuredulous folder)"' >> ~/opt/azuredulous/uninstall.sh
echo 'echo "(Removed GPG settings file)"' >> ~/opt/azuredulous/uninstall.sh
echo 'echo "(Removed alias from .bash_profile)"' >> ~/opt/azuredulous/uninstall.sh
echo 'echo ""' >> ~/opt/azuredulous/uninstall.sh
echo 'echo "***  Azuredulous has been uninstalled  ***"' >> ~/opt/azuredulous/uninstall.sh
echo 'echo ""' >> ~/opt/azuredulous/uninstall.sh
