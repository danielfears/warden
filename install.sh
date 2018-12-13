#!/bin/bash

# -----------------------------------------------------------------
# EXIT OUT IF ALREADY INSTALLED
# -----------------------------------------------------------------

if [ -d /usr/local/bin/warden ]; then
  echo 'Warden is already installed. Please uninstall before attempting to reinstall.'
fi

# -----------------------------------------------------------------
# INSTALL WARDEN IF NOT INSTALLED
# -----------------------------------------------------------------

if [ ! -d /usr/local/bin/warden ]; then

  # -----------------------------------------------------------------
  # POPULATE ALIAS LIST FOR USER COMMANDS FROM ALIAS FILE
  # -----------------------------------------------------------------

  # Ubuntu installation support
  if [ -e ~/.bashrc ] && [ ! -e ~/.bash_profile ]; then

    echo 'alias warden-add=". ~/usr/local/bin/warden/warden-add.sh"' >> ~/.bashrc
    echo 'alias warden-help=". ~/usr/local/bin/warden/warden-help.sh"' >> ~/.bashrc
    echo 'alias warden-list=". ~/usr/local/bin/warden/warden-list.sh"' >> ~/.bashrc
    echo 'alias warden-remove=". ~/usr/local/bin/warden/warden-remove.sh"' >> ~/.bashrc
    echo 'alias warden-source=". ~/usr/local/bin/warden/warden-source.sh"' >> ~/.bashrc
    echo 'alias warden-uninstall=". ~/usr/local/bin/warden/warden-uninstall.sh"' >> ~/.bashrc
    
    . ~/.bashrc

  fi

  # CentOS installation support
  if [ -e ~/.bashrc ] && [ -e ~/.bash_profile ]; then

    echo 'alias warden-add="sudo sh ~/usr/local/bin/warden/warden-add.sh"' >> ~/.bashrc
    echo 'alias warden-help="sudo sh ~/usr/local/bin/warden/warden-help.sh"' >> ~/.bashrc
    echo 'alias warden-list="sudo sh ~/usr/local/bin/warden/warden-list.sh"' >> ~/.bashrc
    echo 'alias warden-remove="sudo sh ~/usr/local/bin/warden/warden-remove.sh"' >> ~/.bashrc
    echo 'alias warden-source="sudo sh ~/usr/local/bin/warden/warden-source.sh"' >> ~/.bashrc
    echo 'alias warden-uninstall="sudo sh ~/usr/local/bin/warden/warden-uninstall.sh"' >> ~/.bashrc

    . ~/.bashrc

  fi

  # MacOS installation support
  if [ -e ~/.bash_profile ] && [ ! -e ~/.bashrc ]; then

    echo 'alias warden-add="sudo sh ~/usr/local/bin/warden/warden-add.sh"' >> ~/.bash_profile
    echo 'alias warden-help="sudo sh ~/usr/local/bin/warden/warden-help.sh"' >> ~/.bash_profile
    echo 'alias warden-list="sudo sh ~/usr/local/bin/warden/warden-list.sh"' >> ~/.bash_profile
    echo 'alias warden-remove="sudo sh ~/usr/local/bin/warden/warden-remove.sh"' >> ~/.bash_profile
    echo 'alias warden-source="sudo sh ~/usr/local/bin/warden/warden-source.sh"' >> ~/.bash_profile
    echo 'alias warden-uninstall="sudo sh ~/usr/local/bin/warden/warden-uninstall.sh"' >> ~/.bash_profile

    . ~/.bash_profile

  fi

  # sh ./assets/alias.sh

  # touch /etc/profile.d/warden.sh # multi-user post-install support/later feature

  # -----------------------------------------------------------------
  # CONFIGURE GPG TO ALWAYS ASK FOR PASSWORD AND RESTART SERVICE
  # -----------------------------------------------------------------

  sudo mkdir ~/.gnupg && sudo touch ~/.gnupg/gpg-agent.conf && sudo chmod 755 ~/.gnupg/gpg-agent.conf

  sudo sh -c "echo 'default-cache-ttl 0' >> ~/.gnupg/gpg-agent.conf"
  sudo sh -c "echo 'max-cache-ttl 0' >> ~/.gnupg/gpg-agent.conf"

  pkill gpg-agent

  # -----------------------------------------------------------------
  # CREATE INSTALLATION FOLDER, MOVE SCRIPT FILES & SET PERMISSIONS
  # -----------------------------------------------------------------

  sudo mkdir -p /usr/local/bin/warden/
  sudo cp assets/*.sh /usr/local/bin/warden/
  sudo chmod 755 /usr/local/bin/warden/*.sh

  # -----------------------------------------------------------------
  # INSTALLATION MESSAGE & FILE CLEAN UP
  # -----------------------------------------------------------------

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

fi


