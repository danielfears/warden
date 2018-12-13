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
    bash = bashrc
  fi

  # CentOS installation support
  if [ -e ~/.bashrc ] && [ -e ~/.bash_profile ]; then
    bash = bashrc
  fi
  
  # MacOS installation support
  if [ -e ~/.bash_profile ] && [ ! -e ~/.bashrc ]; then
    bash = bash_profile
  fi

  echo 'alias warden-add="sudo sh ~/opt/warden/warden-add.sh"' >> ~/.$bash
  echo 'alias warden-help="sudo sh ~/opt/warden/warden-help.sh"' >> ~/.$bash
  echo 'alias warden-list="sudo sh ~/opt/warden/warden-list.sh"' >> ~/.$bash
  echo 'alias warden-remove="sudo sh ~/opt/warden/warden-remove.sh"' >> ~/.$bash
  echo 'alias warden-source="sudo sh ~/opt/warden/warden-source.sh"' >> ~/.$bash
  echo 'alias warden-uninstall="sudo sh ~/opt/warden/warden-uninstall.sh"' >> ~/.$bash
  
  . ~/.$bash

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
