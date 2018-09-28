#!/bin/bash


if [ -d ~/opt/warden ]; then
  echo 'Warden is already installed. Please uninstall before attempting to reinstall.'
fi

if [ ! -d ~/opt/warden ]; then
  # Add path of warden to environment variables
  echo 'alias warden-source=". ~/opt/warden/warden-source.sh"' >> ~/.bash_profile
  echo 'alias warden-add=". ~/opt/warden/warden-add.sh"' >> ~/.bash_profile
  echo 'alias warden-uninstall=". ~/opt/warden/warden-uninstall.sh"' >> ~/.bash_profile
  echo 'alias warden-list=". ~/opt/warden/warden-list.sh"' >> ~/.bash_profile
  . ~/.bash_profile

  # Add configuration settings for GPG to enable password everytime and restart service
  touch ~/.gnupg/gpg-agent.conf
  echo 'default-cache-ttl 0' >> ~/.gnupg/gpg-agent.conf
  echo 'max-cache-ttl 0' >> ~/.gnupg/gpg-agent.conf
  gpg-connect-agent /bye
  pkill gpg-agent

  # Creation of installation folder
  mkdir -p ~/opt/warden/

  # Create warden script files
  touch ~/opt/warden/warden-source.sh
  chmod 755 ~/opt/warden/warden-source.sh
  touch ~/opt/warden/warden-add.sh
  chmod 755 ~/opt/warden/warden-add.sh
  touch ~/opt/warden/warden-uninstall.sh
  chmod 755 ~/opt/warden/warden-uninstall.sh
  touch ~/opt/warden/warden-list.sh
  chmod 755 ~/opt/warden/warden-list.sh

  # Populate warden-source script
  echo '#!/bin/bash' >> ~/opt/warden/warden-source.sh
  echo 'echo -n "Enter your username: "' >> ~/opt/warden/warden-source.sh
  echo 'read username' >> ~/opt/warden/warden-source.sh
  echo 'gpg --output ~/opt/warden/$username-creds.sh --decrypt ~/opt/warden/$username-creds.sh.gpg'>> ~/opt/warden/warden-source.sh
  echo 'wait' >> ~/opt/warden/warden-source.sh
  echo 'source ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-source.sh
  echo 'wait' >> ~/opt/warden/warden-source.sh
  echo 'rm -rf ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-source.sh
  echo 'clear' >> ~/opt/warden/warden-source.sh
  echo 'echo "*** Azure credentials successfully sourced ***"' >> ~/opt/warden/warden-source.sh
  echo 'echo ""' >> ~/opt/warden/warden-source.sh

  # Populate warden-add.sh
  echo '#!/bin/bash' >> ~/opt/warden/warden-add.sh
  echo 'clear' >> ~/opt/warden/warden-add.sh
  echo 'echo "__        __            _"' >> ~/opt/warden/warden-add.sh
  echo 'echo "\ \      / /_ _ _ __ __| | ___ _ __"' >> ~/opt/warden/warden-add.sh
  echo 'echo " \ \ /\ / / _  | __/  _  |/ _ \  _  \\"' >> ~/opt/warden/warden-add.sh
  echo 'echo "  \ V  V / (_| | | | (_| |  __/ | | |"' >> ~/opt/warden/warden-add.sh
  echo 'echo "   \_/\_/ \__,_|_|  \__,_|\___|_| |_| add a user"' >> ~/opt/warden/warden-add.sh
  echo 'echo ""' >> ~/opt/warden/warden-add.sh
  echo 'echo -n "Enter your username: "' >> ~/opt/warden/warden-add.sh
  echo 'read username' >> ~/opt/warden/warden-add.sh
  echo 'touch ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
  echo 'chmod 755 ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
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
  echo 'sleep 1' >> ~/opt/warden/warden-add.sh
  echo 'gpg --output ~/opt/warden/$username-creds.sh.gpg --symmetric ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
  echo 'wait' >> ~/opt/warden/warden-add.sh
  echo 'rm -rf ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
  echo 'echo "clear"' >> ~/opt/warden/warden-add.sh
  echo 'echo "*** Credentials for $username successfully stored and encrypted ***"' >> ~/opt/warden/warden-add.sh
  echo 'echo ""' >> ~/opt/warden/warden-add.sh

  # Populate uninstall script
  echo '#!/bin/bash' >> ~/opt/warden/warden-uninstall.sh
  echo 'clear' >> ~/opt/warden/warden-uninstall.sh
  echo 'echo "*** WARNING ***"' >> ~/opt/warden/warden-uninstall.sh
  echo 'echo "UNINSTALLING WILL REMOVE SAVED CREDENTIALS"' >> ~/opt/warden/warden-uninstall.sh
  echo 'echo ""' >> ~/opt/warden/warden-uninstall.sh
  echo 'echo -n "Do you want to continue? [n/y]: "' >> ~/opt/warden/warden-uninstall.sh
  echo 'read warning' >> ~/opt/warden/warden-uninstall.sh
  echo 'if [[ $warning == "Y" || $warning == "y" || $warning == "yes" ]]; then' >> ~/opt/warden/warden-uninstall.sh
  echo '    rm -rf ~/opt/warden' >> ~/opt/warden/warden-uninstall.sh
  echo "    sed -i -e '/warden/d' ~/.bash_profile" >> ~/opt/warden/warden-uninstall.sh
  echo '    rm -rf ~/.gnupg/gpg-agent.conf' >> ~/opt/warden/warden-uninstall.sh
  echo '    unalias warden-add' >> ~/opt/warden/warden-uninstall.sh
  echo '    unalias warden-source' >> ~/opt/warden/warden-uninstall.sh
  echo '    unalias warden-list' >> ~/opt/warden/warden-uninstall.sh
  echo '    unalias warden-uninstall' >> ~/opt/warden/warden-uninstall.sh
  echo '    clear' >> ~/opt/warden/warden-uninstall.sh
  echo '    echo "(Removed warden folder & credentials)"' >> ~/opt/warden/warden-uninstall.sh
  echo '    echo "(Removed GPG settings file)"' >> ~/opt/warden/warden-uninstall.sh
  echo '    echo "(Removed alias entries from .bash_profile)"' >> ~/opt/warden/warden-uninstall.sh
  echo '    echo ""' >> ~/opt/warden/warden-uninstall.sh
  echo '    echo "***  Warden has been uninstalled and all credentials removed  ***"' >> ~/opt/warden/warden-uninstall.sh
  echo '    echo ""' >> ~/opt/warden/warden-uninstall.sh
  echo 'else' >> ~/opt/warden/warden-uninstall.sh
  echo '    echo "Did not uninstall Warden"' >> ~/opt/warden/warden-uninstall.sh
  echo '    echo ""' >> ~/opt/warden/warden-uninstall.sh
  echo 'fi' >> ~/opt/warden/warden-uninstall.sh

  # Populate list script
  echo '#!/bin/bash' >> ~/opt/warden/warden-list.sh
  echo 'echo ""' >> ~/opt/warden/warden-list.sh
  echo 'echo "Warden - List of accounts with encrypted credentials:"' >> ~/opt/warden/warden-list.sh
  echo 'echo ""' >> ~/opt/warden/warden-list.sh
  echo 'count=$(ls -1 ~/opt/warden/*.sh.gpg 2>/dev/null | wc -l)' >> ~/opt/warden/warden-list.sh
  echo 'if [ "$count" != 0 ]' >> ~/opt/warden/warden-list.sh
  echo 'then' >> ~/opt/warden/warden-list.sh
  echo "    ls -1 ~/opt/warden/*.sh.gpg | tr '\n' '\0' | xargs -0 -n 1 basename | sed -e 's/\-creds.sh.gpg$//'" >> ~/opt/warden/warden-list.sh
  echo 'else' >> ~/opt/warden/warden-list.sh
  echo '    echo "There are no accounts currently being stored by Warden."' >> ~/opt/warden/warden-list.sh
  echo 'fi' >> ~/opt/warden/warden-list.sh
  echo 'echo ""' >> ~/opt/warden/warden-list.sh

  # Installation message & clean up
  clear
  echo '__        __            _'
  echo '\ \      / /_ _ _ __ __| | ___ _ __'
  echo ' \ \ /\ / / _` | __/  _  |/ _ \  _  \'
  echo '  \ V  V / (_| | | | (_| |  __/ | | |'
  echo '   \_/\_/ \__,_|_|  \__,_|\___|_| |_| for Azure (Beta)'
  echo ''
  echo '***  Warden has been successfully installed  ***'
  echo ''
  echo -n 'Would you like to remove installation folder? [n/y]: '
  read deletefile
  clear
  if [[ $deletefile == "Y" || $deletefile == "y" || $deletefile == "yes" ]]; then
          echo '__        __            _'
          echo '\ \      / /_ _ _ __ __| | ___ _ __'
          echo ' \ \ /\ / / _` | __/  _  |/ _ \  _  \'
          echo '  \ V  V / (_| | | | (_| |  __/ | | |'
          echo '   \_/\_/ \__,_|_|  \__,_|\___|_| |_| for Azure (Beta)'
          echo ''
          echo '***  Warden has been successfully installed  ***'
          echo ''
          echo '(Installation folder deleted)'
          rm -rf ../warden
  else
          echo '__        __            _'
          echo '\ \      / /_ _ _ __ __| | ___ _ __'
          echo ' \ \ /\ / / _` | __/  _  |/ _ \  _  \'
          echo '  \ V  V / (_| | | | (_| |  __/ | | |'
          echo '   \_/\_/ \__,_|_|  \__,_|\___|_| |_| for Azure (Beta)'
          echo ''
          echo '***  Warden has been successfully installed  ***'
          echo ''
          echo '(Installation folder NOT deleted)'
  fi
  echo ''
  echo 'USAGE GUIDE'
  echo ''
  echo '- "warden-add" to add & encrypt new user credentials'
  echo '- "warden-source" to source Azure credentials'
  echo '- "warden-list" to list all Warden accounts'
  echo '- "warden-uninstall" to uninstall Warden'
  echo ''
  cd

fi
