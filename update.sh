#!/bin/bash

if [ -d /usr/local/bin/warden ]; then
  clear

  tput setaf 4;
  echo "__        __            _"
  echo "\ \      / /_ _ _ __ __| | ___ _ __"
  echo " \ \ /\ / / _  | __/  _  |/ _ \  _  \\"
  echo "  \ V  V / (_| | | | (_| |  __/ | | |"
  echo "   \_/\_/ \__,_|_|  \__,_|\___|_| |_| updater"
  tput sgr0

  cp assets/*.sh /usr/local/bin/warden/
  chmod 755 /usr/local/bin/warden/*.sh

  # Update alias commands

  unalias warden-add
  unalias warden-help
  unalias warden-list
  unalias warden-remove
  unalias warden-source
  unalias warden-uninstall
  # sh ./assets/alias.sh

  # Ubuntu installation support
  if [ -e ~/.bashrc ] && [ ! -e ~/.bash_profile ]; then
    foo="bashrc"
  fi

  # CentOS installation support
  if [ -e ~/.bashrc ] && [ -e ~/.bash_profile ]; then
    foo="bashrc"
  fi

  # MacOS installation support
  if [ -e ~/.bash_profile ] && [ ! -e ~/.bashrc ]; then
    foo="bash_profile"
  fi

  echo 'alias warden-add="sudo sh /usr/local/bin/warden/warden-add.sh"' >> ~/.$foo
  echo 'alias warden-help="sudo sh /usr/local/bin/warden/warden-help.sh"' >> ~/.$foo
  echo 'alias warden-list="sudo sh /usr/local/bin/warden/warden-list.sh"' >> ~/.$foo
  echo 'alias warden-remove="sudo sh /usr/local/bin/warden/warden-remove.sh"' >> ~/.$foo
  echo 'alias warden-source="sudo sh /usr/local/bin/warden/warden-source.sh"' >> ~/.$foo
  echo 'alias warden-uninstall="sudo sh /usr/local/bin/warden/warden-uninstall.sh"' >> ~/.$foo
  
  . ~/.$foo

  echo ""
  echo 'Warden has been updated to the latest version'
  echo 'Existing Warden profiles have been migrated'
  echo ""
fi

if [ ! -d /usr/local/bin/warden ]; then
  echo ""
  echo 'Warden is not installed; there is nothing to update!'
  echo 'To install Warden, run ". install.sh"'
  echo ""
fi
