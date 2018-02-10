#!/bin/bash

# Add path of warden to environment variables
echo 'alias warden-load=". ~/opt/warden/warden-load.sh"' >> ~/.bash_profile
echo 'alias warden-add=". ~/opt/warden/warden-add.sh"' >> ~/.bash_profile
echo 'alias warden-purge=". ~/opt/warden/warden-purge.sh"' >> ~/.bash_profile
. ~/.bash_profile

# Add configuration settings for GPG to enable password everytime and restart service
touch ~/.gnupg/gpg-agent.conf
echo 'default-cache-ttl 0' >> ~/.gnupg/gpg-agent.conf
echo 'max-cache-ttl 0' >> ~/.gnupg/gpg-agent.conf
gpg-connect-agent /bye

# Creation of installation folder
mkdir -p ~/opt/warden

# Create warden script files
touch ~/opt/warden/warden-load.sh
chmod 777 ~/opt/warden/warden-load.sh
touch ~/opt/warden/warden-add.sh
chmod 777 ~/opt/warden/warden-add.sh
touch ~/opt/warden/warden-purge.sh
chmod 777 ~/opt/warden/warden-purge.sh

# Populate warden-load script
echo '#!/bin/bash' >> ~/opt/warden/warden-load.sh
echo 'echo -n "Enter your username: "' >> ~/opt/warden/warden-load.sh
echo 'read username' >> ~/opt/warden/warden-load.sh
echo 'gpg --output ~/opt/warden/$username-creds.sh --decrypt ~/opt/warden/$username-creds.sh.gpg'>> ~/opt/warden/warden-load.sh
echo 'wait' >> ~/opt/warden/warden-load.sh
echo 'source ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-load.sh
echo 'wait' >> ~/opt/warden/warden-load.sh
echo 'rm -rf ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-load.sh
echo 'clear' >> ~/opt/warden/warden-load.sh
echo 'echo "*** Azure credentials successfully loaded ***"' >> ~/opt/warden/warden-load.sh
echo 'echo ""' >> ~/opt/warden/warden-load.sh

# Populate warden-add.sh
echo '#!/bin/bash' >> ~/opt/warden/warden-add.sh
echo 'clear' >> ~/opt/warden/warden-add.sh
echo 'echo "__        __            _"' >> ~/opt/warden/warden-add.sh
echo 'echo "\ \      / /_ _ _ __ __| | ___ _ __"' >> ~/opt/warden/warden-add.sh
echo 'echo " \ \ /\ / / _` | __/  _  |/ _ \  _  \"' >> ~/opt/warden/warden-add.sh
echo 'echo "  \ V  V / (_| | | | (_| |  __/ | | |"' >> ~/opt/warden/warden-add.sh
echo 'echo "   \_/\_/ \__,_|_|  \__,_|\___|_| |_| add a user"' >> ~/opt/warden/warden-add.sh
echo 'echo ""' >> ~/opt/warden/warden-add.sh
echo 'echo -n "Enter your username: "' >> ~/opt/warden/warden-add.sh
echo 'read username' >> ~/opt/warden/warden-add.sh
echo 'touch ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
echo 'chmod 777 ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
echo 'echo ""' >> ~/opt/warden/warden-add.sh
echo 'echo "Enter Azure environment credentials for: $username"' >> ~/opt/warden/warden-add.sh
echo 'echo ""' >> ~/opt/warden/warden-add.sh
echo 'echo -n "ARM_SUBSCRIPTION_ID: "' >> ~/opt/warden/warden-add.sh
echo 'read subid' >> ~/opt/warden/warden-add.sh
echo 'echo -n "ARM_CLIENT_ID: "' >> ~/opt/warden/warden-add.sh
echo 'read clientid' >> ~/opt/warden/warden-add.sh
echo 'echo -n "ARM_CLIENT_SECRET: "' >> ~/opt/warden/warden-add.sh
echo 'read clientsecret' >> ~/opt/warden/warden-add.sh
echo 'echo -n "ARM_TENANT_ID: "' >> ~/opt/warden/warden-add.sh
echo 'read tenantid' >> ~/opt/warden/warden-add.sh
echo 'echo "#!/bin/bash" >> ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
echo 'echo "export ARM_SUBSCRIPTION_ID=$subid" >> ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
echo 'echo "export ARM_CLIENT_ID=$clientid" >> ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
echo 'echo "export ARM_CLIENT_SECRET=$clientsecret" >> ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
echo 'echo "export ARM_TENANT_ID=$tenantid" >> ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
echo 'clear' >> ~/opt/warden/warden-add.sh
echo 'echo "***  Encrypt credentials with a strong password  ***"' >> ~/opt/warden/warden-add.sh
echo 'sleep 2' >> ~/opt/warden/warden-add.sh
echo 'gpg --output ~/opt/warden/$username-creds.sh.gpg --symmetric ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
echo 'wait' >> ~/opt/warden/warden-add.sh
echo 'rm -rf ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
echo 'echo "clear"' >> ~/opt/warden/warden-add.sh
echo 'echo "*** Credentials for $username successfully stored and encrypted ***"' >> ~/opt/warden/warden-add.sh
echo 'echo ""' >> ~/opt/warden/warden-add.sh

# Populate purge script
echo '#!/bin/bash' >> ~/opt/warden/warden-purge.sh
echo 'clear' >> ~/opt/warden/warden-purge.sh
echo 'echo "*** WARNING ***"' >> ~/opt/warden/warden-purge.sh
echo 'echo "UNINSTALLING WILL REMOVE SAVED CREDENTIALS"' >> ~/opt/warden/warden-purge.sh
echo 'echo ""' >> ~/opt/warden/warden-purge.sh
echo 'echo -n "Do you want to continue? [n/y]: "' >> ~/opt/warden/warden-purge.sh
echo 'read warning' >> ~/opt/warden/warden-purge.sh
echo 'if [[ $warning == "Y" || $warning == "y" || $warning == "yes" ]]; then' >> ~/opt/warden/warden-purge.sh
echo '    rm -rf ~/opt/warden' >> ~/opt/warden/warden-purge.sh
echo "    sed -i -e '/warden/d' ~/.bash_profile" >> ~/opt/warden/warden-purge.sh
echo '    rm -rf ~/.gnupg/gpg-agent.conf' >> ~/opt/warden/warden-purge.sh
echo '    clear' >> ~/opt/warden/warden-purge.sh
echo '    echo "(Removed warden folder & credentials)"' >> ~/opt/warden/warden-purge.sh
echo '    echo "(Removed GPG settings file)"' >> ~/opt/warden/warden-purge.sh
echo '    echo "(Removed alias entries from .bash_profile)"' >> ~/opt/warden/warden-purge.sh
echo '    echo ""' >> ~/opt/warden/warden-purge.sh
echo '    echo "***  Warden has been uninstalled and all credentials removed  ***"' >> ~/opt/warden/warden-purge.sh
echo '    echo ""' >> ~/opt/warden/warden-purge.sh
echo 'else' >> ~/opt/warden/warden-purge.sh
echo '    echo "Did not uninstall Warden"' >> ~/opt/warden/warden-purge.sh
echo '    echo ""' >> ~/opt/warden/warden-purge.sh
echo 'fi' >> ~/opt/warden/warden-purge.sh

# Installation message & clean up
clear
echo '__        __            _'
echo '\ \      / /_ _ _ __ __| | ___ _ __'
echo ' \ \ /\ / / _` | __/  _  |/ _ \  _  \'
echo '  \ V  V / (_| | | | (_| |  __/ | | |'
echo '   \_/\_/ \__,_|_|  \__,_|\___|_| |_|'
echo ''
echo '***  Warden has been successfully installed  ***'
echo ''
echo -n 'Would you like to remove installation file? [n/y]: '
read deletefile
clear
if [[ $deletefile == "Y" || $deletefile == "y" || $deletefile == "yes" ]]; then
        echo '__        __            _'
        echo '\ \      / /_ _ _ __ __| | ___ _ __'
        echo ' \ \ /\ / / _` | __/  _  |/ _ \  _  \'
        echo '  \ V  V / (_| | | | (_| |  __/ | | |'
        echo '   \_/\_/ \__,_|_|  \__,_|\___|_| |_|'
        echo ''
        echo '***  Warden has been successfully installed  ***'
        echo ''
        echo '(Installation file deleted)'
        rm -rf ../warden
else
        echo '__        __            _'
        echo '\ \      / /_ _ _ __ __| | ___ _ __'
        echo ' \ \ /\ / / _` | __/  _  |/ _ \  _  \'
        echo '  \ V  V / (_| | | | (_| |  __/ | | |'
        echo '   \_/\_/ \__,_|_|  \__,_|\___|_| |_|'
        echo ''
        echo '***  Warden has been successfully installed  ***'
        echo ''
        echo '(Installation file NOT deleted)'
fi
echo ''
echo 'USAGE GUIDE'
echo ''
echo '- "warden-add" to add & encrypt new user credentials'
echo '- "warden-load" to load Azure credentials'
echo '- "warden-purge" to uninstall warden'
echo ''
