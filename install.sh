#!/bin/bash

# -----------------------------------------------------------------
# LOGIC TO CHECK IF WARDEN IS ALREADY INSTALLED
# -----------------------------------------------------------------

if [ -d ~/opt/warden ]; then
  echo 'Warden is already installed. Please uninstall before attempting to reinstall.'
fi

if [ ! -d ~/opt/warden ]; then

  # -----------------------------------------------------------------
  # TRIALING NEW METHOD FOR CALLING COMMANDS WITH A SPACE
  # -----------------------------------------------------------------

  echo " warden () {" >> ~/.bash_profile
  echo "   . ~/opt/warden/warden-\$1.sh" >> ~/.bash_profile
  echo " } # warden - comment for removal functionality" >> ~/.bash_profile

  . ~/.bash_profile

  # echo 'alias warden-source=". ~/opt/warden/warden-source.sh"' >> ~/.bash_profile
  # echo 'alias warden-add=". ~/opt/warden/warden-add.sh"' >> ~/.bash_profile
  # echo 'alias warden-uninstall=". ~/opt/warden/warden-uninstall.sh"' >> ~/.bash_profile
  # echo 'alias warden-list=". ~/opt/warden/warden-list.sh"' >> ~/.bash_profile

  # -----------------------------------------------------------------
  # CONFIGURING GPG TO ASK FOR PASSWORD INPUT AND RESTART SERVICE
  # -----------------------------------------------------------------

  touch ~/.gnupg/gpg-agent.conf
  echo 'default-cache-ttl 0' >> ~/.gnupg/gpg-agent.conf
  echo 'max-cache-ttl 0' >> ~/.gnupg/gpg-agent.conf
  gpg-connect-agent /bye
  pkill gpg-agent

  # -----------------------------------------------------------------
  # CREATION OF INSTALLATION FOLDER
  # -----------------------------------------------------------------

  mkdir -p ~/opt/warden/

  # -----------------------------------------------------------------
  # CREATION OF SCRIPT FILES & SETTING PERMISSIONS
  # -----------------------------------------------------------------

  touch ~/opt/warden/warden-source.sh
  chmod 755 ~/opt/warden/warden-source.sh

  touch ~/opt/warden/warden-add.sh
  chmod 755 ~/opt/warden/warden-add.sh

  touch ~/opt/warden/warden-uninstall.sh
  chmod 755 ~/opt/warden/warden-uninstall.sh

  touch ~/opt/warden/warden-list.sh
  chmod 755 ~/opt/warden/warden-list.sh

  touch ~/opt/warden/warden-help.sh
  chmod 755 ~/opt/warden/warden-help.sh

  touch ~/opt/warden/warden-remove.sh
  chmod 755 ~/opt/warden/warden-remove.sh

  # -----------------------------------------------------------------
  # POPULATE WARDEN-SOURCE.SH
  # -----------------------------------------------------------------

  echo '#!/bin/bash' >> ~/opt/warden/warden-source.sh
  echo 'clear' >> ~/opt/warden/warden-source.sh
  echo 'tput setaf 4;' >> ~/opt/warden/warden-source.sh
  echo 'echo "__        __            _"' >> ~/opt/warden/warden-source.sh
  echo 'echo "\ \      / /_ _ _ __ __| | ___ _ __"' >> ~/opt/warden/warden-source.sh
  echo 'echo " \ \ /\ / / _  | __/  _  |/ _ \  _  \\"' >> ~/opt/warden/warden-source.sh
  echo 'echo "  \ V  V / (_| | | | (_| |  __/ | | |"' >> ~/opt/warden/warden-source.sh
  echo 'echo "   \_/\_/ \__,_|_|  \__,_|\___|_| |_| source credentials"' >> ~/opt/warden/warden-source.sh
  echo 'tput sgr0' >> ~/opt/warden/warden-source.sh
  echo 'echo ""' >> ~/opt/warden/warden-source.sh
  echo 'echo -n "Enter your username: "' >> ~/opt/warden/warden-source.sh
  echo 'read username' >> ~/opt/warden/warden-source.sh
  echo 'if [ ! -f ~/opt/warden/$username-creds.sh.gpg ]; then' >> ~/opt/warden/warden-source.sh
  echo '    echo ""' >> ~/opt/warden/warden-source.sh
  echo '    echo "Username not found!"' >> ~/opt/warden/warden-source.sh
  echo '    echo ""' >> ~/opt/warden/warden-source.sh
  echo 'else' >> ~/opt/warden/warden-source.sh
  echo '    gpg --output ~/opt/warden/$username-creds.sh --decrypt ~/opt/warden/$username-creds.sh.gpg'>> ~/opt/warden/warden-source.sh
  echo '    wait' >> ~/opt/warden/warden-source.sh
  echo '    source ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-source.sh
  echo '    wait' >> ~/opt/warden/warden-source.sh
  echo '    rm -rf ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-source.sh
  echo '    clear' >> ~/opt/warden/warden-source.sh
  echo '    echo "*** Azure credentials successfully sourced ***"' >> ~/opt/warden/warden-source.sh
  echo '    echo ""' >> ~/opt/warden/warden-source.sh
  echo 'fi' >> ~/opt/warden/warden-source.sh

  # -----------------------------------------------------------------
  # POPULATE WARDEN-ADD.SH
  # -----------------------------------------------------------------

  echo '#!/bin/bash' >> ~/opt/warden/warden-add.sh
  echo 'clear' >> ~/opt/warden/warden-add.sh
  echo 'tput setaf 4;' >> ~/opt/warden/warden-add.sh
  echo 'echo "__        __            _"' >> ~/opt/warden/warden-add.sh
  echo 'echo "\ \      / /_ _ _ __ __| | ___ _ __"' >> ~/opt/warden/warden-add.sh
  echo 'echo " \ \ /\ / / _  | __/  _  |/ _ \  _  \\"' >> ~/opt/warden/warden-add.sh
  echo 'echo "  \ V  V / (_| | | | (_| |  __/ | | |"' >> ~/opt/warden/warden-add.sh
  echo 'echo "   \_/\_/ \__,_|_|  \__,_|\___|_| |_| add a profile"' >> ~/opt/warden/warden-add.sh
  echo 'tput sgr0' >> ~/opt/warden/warden-add.sh
  echo 'echo ""' >> ~/opt/warden/warden-add.sh
  echo 'echo -n "Enter a new username: "' >> ~/opt/warden/warden-add.sh
  echo 'read username' >> ~/opt/warden/warden-add.sh
  echo 'if [ -f ~/opt/warden/$username-creds.sh.gpg ]; then' >> ~/opt/warden/warden-add.sh
  echo '    echo "Username already exists!"' >> ~/opt/warden/warden-add.sh
  echo '    echo ""' >> ~/opt/warden/warden-add.sh
  echo 'else' >> ~/opt/warden/warden-add.sh
  echo '    touch ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
  echo '    chmod 755 ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
  echo '    echo ""' >> ~/opt/warden/warden-add.sh
  echo '    echo "Enter Azure environment credentials for: $username"' >> ~/opt/warden/warden-add.sh
  echo '    echo ""' >> ~/opt/warden/warden-add.sh
  echo '    echo -n "ARM_SUBSCRIPTION_ID: "' >> ~/opt/warden/warden-add.sh
  echo '    read subid' >> ~/opt/warden/warden-add.sh
  echo '    echo -n "ARM_CLIENT_ID: "' >> ~/opt/warden/warden-add.sh
  echo '    read clientid' >> ~/opt/warden/warden-add.sh
  echo '    echo -n "ARM_CLIENT_SECRET: "' >> ~/opt/warden/warden-add.sh
  echo '    read clientsecret' >> ~/opt/warden/warden-add.sh
  echo '    echo -n "ARM_TENANT_ID: "' >> ~/opt/warden/warden-add.sh
  echo '    read tenantid' >> ~/opt/warden/warden-add.sh
  echo '    echo "#!/bin/bash" >> ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
  echo '    echo "export ARM_SUBSCRIPTION_ID=$subid" >> ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
  echo '    echo "export ARM_CLIENT_ID=$clientid" >> ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
  echo '    echo "export ARM_CLIENT_SECRET=$clientsecret" >> ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
  echo '    echo "export ARM_TENANT_ID=$tenantid" >> ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
  echo '    clear' >> ~/opt/warden/warden-add.sh
  echo '    echo "***  Encrypt credentials with a strong password  ***"' >> ~/opt/warden/warden-add.sh
  echo '    sleep 1' >> ~/opt/warden/warden-add.sh
  echo '    gpg --output ~/opt/warden/$username-creds.sh.gpg --symmetric ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
  echo '    wait' >> ~/opt/warden/warden-add.sh
  echo '    rm -rf ~/opt/warden/$username-creds.sh' >> ~/opt/warden/warden-add.sh
  echo '    clear' >> ~/opt/warden/warden-add.sh
  echo '    echo "*** Credentials for $username successfully stored and encrypted ***"' >> ~/opt/warden/warden-add.sh
  echo '    echo ""' >> ~/opt/warden/warden-add.sh
  echo 'fi' >> ~/opt/warden/warden-add.sh

  # -----------------------------------------------------------------
  # POPULATE WARDEN-UNINSTALL.SH
  # -----------------------------------------------------------------

  echo '#!/bin/bash' >> ~/opt/warden/warden-uninstall.sh
  echo 'clear' >> ~/opt/warden/warden-uninstall.sh
  echo 'tput setaf 4;' >> ~/opt/warden/warden-uninstall.sh
  echo 'echo "__        __            _"' >> ~/opt/warden/warden-uninstall.sh
  echo 'echo "\ \      / /_ _ _ __ __| | ___ _ __"' >> ~/opt/warden/warden-uninstall.sh
  echo 'echo " \ \ /\ / / _  | __/  _  |/ _ \  _  \\"' >> ~/opt/warden/warden-uninstall.sh
  echo 'echo "  \ V  V / (_| | | | (_| |  __/ | | |"' >> ~/opt/warden/warden-uninstall.sh
  echo 'echo "   \_/\_/ \__,_|_|  \__,_|\___|_| |_| uninstall"' >> ~/opt/warden/warden-uninstall.sh
  echo 'tput sgr0' >> ~/opt/warden/warden-uninstall.sh
  echo 'echo ""' >> ~/opt/warden/warden-uninstall.sh
  echo 'echo "*** WARNING ***"' >> ~/opt/warden/warden-uninstall.sh
  echo 'echo "UNINSTALLING WILL REMOVE SAVED CREDENTIALS"' >> ~/opt/warden/warden-uninstall.sh
  echo 'echo ""' >> ~/opt/warden/warden-uninstall.sh
  echo 'echo -n "Do you want to continue? [n/y]: "' >> ~/opt/warden/warden-uninstall.sh
  echo 'read warning' >> ~/opt/warden/warden-uninstall.sh
  echo 'if [[ $warning == "Y" || $warning == "y" || $warning == "yes" ]]; then' >> ~/opt/warden/warden-uninstall.sh
  echo '    rm -rf ~/opt/warden' >> ~/opt/warden/warden-uninstall.sh
  echo "    sed -i -e '/warden/d' ~/.bash_profile" >> ~/opt/warden/warden-uninstall.sh
  echo '    rm -rf ~/.gnupg/gpg-agent.conf' >> ~/opt/warden/warden-uninstall.sh
  # echo '    unalias warden-add' >> ~/opt/warden/warden-uninstall.sh
  # echo '    unalias warden-source' >> ~/opt/warden/warden-uninstall.sh
  # echo '    unalias warden-list' >> ~/opt/warden/warden-uninstall.sh
  # echo '    unalias warden-uninstall' >> ~/opt/warden/warden-uninstall.sh
  echo '    clear' >> ~/opt/warden/warden-uninstall.sh
  echo '    echo "(Removed Warden folder & credentials)"' >> ~/opt/warden/warden-uninstall.sh
  echo '    echo "(Removed GPG settings file)"' >> ~/opt/warden/warden-uninstall.sh
  echo '    echo "(Removed Warden function entry from .bash_profile)"' >> ~/opt/warden/warden-uninstall.sh
  echo '    echo ""' >> ~/opt/warden/warden-uninstall.sh
  echo '    echo "***  Warden has been uninstalled and all credentials removed  ***"' >> ~/opt/warden/warden-uninstall.sh
  echo '    echo ""' >> ~/opt/warden/warden-uninstall.sh
  echo 'else' >> ~/opt/warden/warden-uninstall.sh
  echo '    echo "Did not uninstall Warden"' >> ~/opt/warden/warden-uninstall.sh
  echo '    echo ""' >> ~/opt/warden/warden-uninstall.sh
  echo 'fi' >> ~/opt/warden/warden-uninstall.sh

  # -----------------------------------------------------------------
  # POPULATE WARDEN-LIST.SH
  # -----------------------------------------------------------------

  echo '#!/bin/bash' >> ~/opt/warden/warden-list.sh
  echo 'clear' >> ~/opt/warden/warden-list.sh
  echo 'tput setaf 4;' >> ~/opt/warden/warden-list.sh
  echo 'echo "__        __            _"' >> ~/opt/warden/warden-list.sh
  echo 'echo "\ \      / /_ _ _ __ __| | ___ _ __"' >> ~/opt/warden/warden-list.sh
  echo 'echo " \ \ /\ / / _  | __/  _  |/ _ \  _  \\"' >> ~/opt/warden/warden-list.sh
  echo 'echo "  \ V  V / (_| | | | (_| |  __/ | | |"' >> ~/opt/warden/warden-list.sh
  echo 'echo "   \_/\_/ \__,_|_|  \__,_|\___|_| |_| list of existing users"' >> ~/opt/warden/warden-list.sh
  echo 'tput sgr0' >> ~/opt/warden/warden-list.sh
  echo 'echo ""' >> ~/opt/warden/warden-list.sh
  echo 'count=$(ls -1 ~/opt/warden/*.sh.gpg 2>/dev/null | wc -l)' >> ~/opt/warden/warden-list.sh
  echo 'if [ "$count" != 0 ]' >> ~/opt/warden/warden-list.sh
  echo 'then' >> ~/opt/warden/warden-list.sh
  echo "    ls -1 ~/opt/warden/*.sh.gpg | tr '\n' '\0' | xargs -0 -n 1 basename | sed -e 's/\-creds.sh.gpg$//'" >> ~/opt/warden/warden-list.sh
  echo 'else' >> ~/opt/warden/warden-list.sh
  echo '    echo "There are no accounts currently being stored by Warden."' >> ~/opt/warden/warden-list.sh
  echo 'fi' >> ~/opt/warden/warden-list.sh
  echo 'echo ""' >> ~/opt/warden/warden-list.sh

  # -----------------------------------------------------------------
  # POPULATE WARDEN-REMOVE.SH
  # -----------------------------------------------------------------

  echo '#!/bin/bash' >> ~/opt/warden/warden-remove.sh
  echo 'clear' >> ~/opt/warden/warden-remove.sh
  echo 'tput setaf 4;' >> ~/opt/warden/warden-remove.sh
  echo 'echo "__        __            _"' >> ~/opt/warden/warden-remove.sh
  echo 'echo "\ \      / /_ _ _ __ __| | ___ _ __"' >> ~/opt/warden/warden-remove.sh
  echo 'echo " \ \ /\ / / _  | __/  _  |/ _ \  _  \\"' >> ~/opt/warden/warden-remove.sh
  echo 'echo "  \ V  V / (_| | | | (_| |  __/ | | |"' >> ~/opt/warden/warden-remove.sh
  echo 'echo "   \_/\_/ \__,_|_|  \__,_|\___|_| |_| remove a profile"' >> ~/opt/warden/warden-remove.sh
  echo 'tput sgr0' >> ~/opt/warden/warden-remove.sh
  echo 'echo ""' >> ~/opt/warden/warden-remove.sh
  echo 'echo -n "Enter a username: "' >> ~/opt/warden/warden-remove.sh
  echo 'read username' >> ~/opt/warden/warden-remove.sh
  echo 'echo ""' >> ~/opt/warden/warden-remove.sh
  echo 'if [ ! -f ~/opt/warden/$username-creds.sh.gpg ]; then' >> ~/opt/warden/warden-remove.sh
  echo '    echo ""' >> ~/opt/warden/warden-remove.sh
  echo '    echo "Username not found!"' >> ~/opt/warden/warden-remove.sh
  echo '    echo ""' >> ~/opt/warden/warden-remove.sh
  echo 'else' >> ~/opt/warden/warden-remove.sh
  echo '    echo -n "Are you sure you want to remove profile: $username? [n/y]: "' >> ~/opt/warden/warden-remove.sh
  echo '    read removeuser' >> ~/opt/warden/warden-remove.sh
  echo '    echo ""' >> ~/opt/warden/warden-remove.sh
  echo '    if [[ $removeuser == "Y" || $removeuser == "y" || $removeuser == "yes" ]]; then' >> ~/opt/warden/warden-remove.sh
  echo '        echo "Profile for $username has been removed from Warden"' >> ~/opt/warden/warden-remove.sh
  echo '        echo ""' >> ~/opt/warden/warden-remove.sh
  echo '        rm -rf ~/opt/warden/$username-creds.sh.gpg' >> ~/opt/warden/warden-remove.sh
  echo '    else' >> ~/opt/warden/warden-remove.sh
  echo '        echo "Profile for $username NOT removed"' >> ~/opt/warden/warden-remove.sh
  echo '        echo ""' >> ~/opt/warden/warden-remove.sh
  echo '    fi' >> ~/opt/warden/warden-remove.sh
  echo 'fi' >> ~/opt/warden/warden-remove.sh

  # -----------------------------------------------------------------
  # POPULATE WARDEN-HELP.SH
  # -----------------------------------------------------------------

  echo '#!/bin/bash' >> ~/opt/warden/warden-help.sh
  echo 'clear' >> ~/opt/warden/warden-help.sh
  echo 'tput setaf 4;' >> ~/opt/warden/warden-help.sh
  echo 'echo "__        __            _"' >> ~/opt/warden/warden-help.sh
  echo 'echo "\ \      / /_ _ _ __ __| | ___ _ __"' >> ~/opt/warden/warden-help.sh
  echo 'echo " \ \ /\ / / _  | __/  _  |/ _ \  _  \\"' >> ~/opt/warden/warden-help.sh
  echo 'echo "  \ V  V / (_| | | | (_| |  __/ | | |"' >> ~/opt/warden/warden-help.sh
  echo 'echo "   \_/\_/ \__,_|_|  \__,_|\___|_| |_| help and usage"' >> ~/opt/warden/warden-help.sh
  echo 'tput sgr0' >> ~/opt/warden/warden-help.sh
  echo 'echo ""' >> ~/opt/warden/warden-help.sh
  echo 'echo "* warden source - loads credentials from an existing profile"' >> ~/opt/warden/warden-help.sh
  echo 'echo "* warden add - adds a new profle to store Azure credentials"' >> ~/opt/warden/warden-help.sh
  echo 'echo "* warden list - lists existing profiles"' >> ~/opt/warden/warden-help.sh
  echo 'echo "* warden remove - removes an existing profile"' >> ~/opt/warden/warden-help.sh
  echo 'echo "* warden help - displays the help menu"' >> ~/opt/warden/warden-help.sh
  echo 'echo "* warden uninstall - Uninstalls Warden and removes all profiles"' >> ~/opt/warden/warden-help.sh
  echo 'echo ""' >> ~/opt/warden/warden-help.sh

  # -----------------------------------------------------------------
  # INSTALLATION MESSAGE & FILE CLEAN UP
  # -----------------------------------------------------------------

  echo ''
  echo '***  Warden has been successfully installed  ***'
  echo ''
  echo -n 'Would you like to remove installation folder? [n/y]: '
  read deletefile
  clear
  if [[ $deletefile == "Y" || $deletefile == "y" || $deletefile == "yes" ]]; then
          tput setaf 4;
          echo '__        __            _'
          echo '\ \      / /_ _ _ __ __| | ___ _ __'
          echo ' \ \ /\ / / _` | __/  _  |/ _ \  _  \'
          echo '  \ V  V / (_| | | | (_| |  __/ | | |'
          echo '   \_/\_/ \__,_|_|  \__,_|\___|_| |_| for Azure'
          tput sgr0
          echo ''
          echo '***  Warden has been successfully installed  ***'
          echo ''
          echo '(Installation folder deleted)'
          rm -rf ../warden
  else
          tput setaf 4;
          echo '__        __            _'
          echo '\ \      / /_ _ _ __ __| | ___ _ __'
          echo ' \ \ /\ / / _` | __/  _  |/ _ \  _  \'
          echo '  \ V  V / (_| | | | (_| |  __/ | | |'
          echo '   \_/\_/ \__,_|_|  \__,_|\___|_| |_| for Azure'
          tput sgr0
          echo ''
          echo '***  Warden has been successfully installed  ***'
          echo ''
          echo '(Installation folder NOT deleted)'
  fi
  echo ''
  echo 'USAGE GUIDE'
  echo ''
  echo '- "warden source" loads credentials from an existing profile'
  echo '- "warden add" adds a new profle to store Azure credentials'
  echo '- "warden list" lists existing profiles'
  echo '- "warden remove" removes an existing profile'
  echo '- "warden help" displays the help menu'
  echo '- "warden uninstall" Uninstalls Warden and removes all profiles'
  echo ''
  cd

fi
