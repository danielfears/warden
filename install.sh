#!/bin/bash

# -----------------------------------------------------------------
# CHECK IF INSTALLED AND UPDATING EXISTING INSTALLATION
# -----------------------------------------------------------------

if [ -d ~/opt/warden ]; then
  echo 'Warden is already installed. Please uninstall before attempting to reinstall.'
fi

# -----------------------------------------------------------------
# CHECK IF INSTALLED AND INSTALL WARDEN
# -----------------------------------------------------------------

if [ ! -d ~/opt/warden ]; then

  # -----------------------------------------------------------------
  # CREATE BASH FUNCTION IN BASH_PROFILE FOR FUNCTIONALITY
  # -----------------------------------------------------------------

  echo " warden () {" >> ~/.bash_profile
  echo "   . ~/opt/warden/warden-\$1.sh" >> ~/.bash_profile
  echo " } # warden - comment for removal functionality" >> ~/.bash_profile

  . ~/.bash_profile

  # -----------------------------------------------------------------
  # CONFIGURE GPG TO ALWAYS ASK FOR PASSWORD AND RESTART SERVICE
  # -----------------------------------------------------------------

  touch ~/.gnupg/gpg-agent.conf
  echo 'default-cache-ttl 0' >> ~/.gnupg/gpg-agent.conf
  echo 'max-cache-ttl 0' >> ~/.gnupg/gpg-agent.conf
  gpg-connect-agent /bye
  pkill gpg-agent

  # -----------------------------------------------------------------
  # CREATE INSTALLATION FOLDER, MOVE SCRIPT FILES & SET PERMISSIONS
  # -----------------------------------------------------------------

  mkdir -p ~/opt/warden/
  mv /assets/*.sh ~/opt/warden/
  chmod 755 ~/opt/warden/*.sh

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
