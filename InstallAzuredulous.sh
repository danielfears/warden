#!/bin/bash

# Add path of azuredulous to environment variables
echo 'alias azuredulous=". ~/azuredulous/azuredulous.sh"' >> .bash_profile
. .bash_profile

# Add configuration settings for GPG to enable password everytime and restart service
touch ~/.gnupg/gpg-agent.conf
echo "default-cache-ttl 0" >> ~/.gnupg/gpg-agent.conf
echo "max-cache-ttl 0" >> ~/.gnupg/gpg-agent.conf
gpg-connect-agent /bye

# Creation of installation folder
mkdir ~/azuredulous

# Create azuredulous script file
touch ~/azuredulous/azuredulous.sh
chmod 777 ~/azuredulous/azuredulous.sh

# Populate azuredulous.sh
echo "#!/bin/bash" >> ~/azuredulous/azuredulous.sh
echo "gpg --output ~/azuredulous/creds.sh --decrypt ~/azuredulous/creds.sh.gpg" >> ~/azuredulous/azuredulous.sh
echo "wait" >> ~/azuredulous/azuredulous.sh
echo "chmod 777 ~/azuredulous/creds.sh" >> ~/azuredulous/azuredulous.sh
echo "wait" >> ~/azuredulous/azuredulous.sh
echo "source ~/azuredulous/creds.sh" >> ~/azuredulous/azuredulous.sh
echo "wait" >> ~/azuredulous/azuredulous.sh
echo "rm -rf ~/azuredulous/creds.sh" >> ~/azuredulous/azuredulous.sh
echo "clear" >> ~/azuredulous/azuredulous.sh
echo "***  CREDENTIALS SUCCESSFULLY LOADED  ***" >> ~/azuredulous/azuredulous.sh
echo "" >> ~/azuredulous/azuredulous.sh

# Create creds script file
touch ~/azuredulous/creds.sh
chmod 777 ~/azuredulous/creds.sh
clear

# Capture user inputs for environment variables
echo "***  INPUT AZURE ENVIRONMENT CREDENTIALS  ***"
echo ""
echo ""
echo -n "Enter your ARM_SUBSCRIPTION_ID: "
read subid
echo -n "Enter your ARM_CLIENT_ID: "
read clientid
echo -n "Enter your ARM_CLIENT_SECRET: "
read clientsecret
echo -n "Enter your ARM_TENANT_ID: "
read tenantid

# Save user input environment variables to Creds.sh
echo "#!/bin/bash" >> ~/azuredulous/creds.sh
echo "export ARM_SUBSCRIPTION_ID=$subid" >> ~/azuredulous/creds.sh
echo "export ARM_CLIENT_ID=$clientid" >> ~/azuredulous/creds.sh
echo "export ARM_CLIENT_SECRET=$clientsecret" >> ~/azuredulous/creds.sh
echo "export ARM_TENANT_ID=$tenantid" >> ~/azuredulous/creds.sh

# Encrypt creds.sh file with gpg
clear
echo "***  ENCRYPT CREDENTIALS USING PASSWORD  ***"
sleep 2

gpg --output ~/azuredulous/creds.sh.gpg --symmetric ~/azuredulous/creds.sh

# Remove unencrypted creds.sh file
wait
rm -rf ~/azuredulous/creds.sh

# Installation message & clean up
clear
echo "***  AZUREDULOUS IS NOW INSTALLED  ***"
echo ""
echo -n "Would you like to remove installation file? [N/y]: "
read deletefile
clear
if [[ $deletefile == "Y" || $deletefile == "y" || $deletefile == "yes" ]]; then
        echo "Installation file deleted"
        rm -rf InstallAzuredulous.sh
else
        echo "Installation file NOT deleted"
fi
echo ""
echo "***  INSTRUCTIONS  ***"
echo ""
echo "* To load credentials, type 'azuredulous'"
echo ""
echo "* To uninstall, run 'uninstall.sh' from 'azuredulous' folder"
echo ""

# Create uninstall script
touch ~/azuredulous/uninstall.sh
chmod 777 ~/azuredulous/uninstall.sh
echo "rm -rf ~/azuredulous" >> ~/azuredulous/uninstall.sh
echo "sed -i -e '/azuredulous.sh/d' ~/.bash_profile" >> ~/azuredulous/uninstall.sh
echo "rm -rf ~/.gnupg/gpg-agent.conf" >> ~/azuredulous/uninstall.sh
echo "clear" >> ~/azuredulous/uninstall.sh
echo 'echo "***  Azuredulous has been uninstalled  ***"' >> ~/azuredulous/uninstall.sh
echo "" >> ~/azuredulous/uninstall.sh
echo 'echo "(Removed Azuredulous folder)"' >> ~/azuredulous/uninstall.sh
echo 'echo "(Removed GPG settings file)"' >> ~/azuredulous/uninstall.sh
echo 'echo "(Removed alias from .bash_profile)"' >> ~/azuredulous/uninstall.sh
echo "" >> ~/azuredulous/uninstall.sh
