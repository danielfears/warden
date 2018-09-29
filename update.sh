#!/bin/bash

if [ -d ~/opt/warden ]; then
  clear

  tput setaf 4;
  echo "__        __            _"
  echo "\ \      / /_ _ _ __ __| | ___ _ __"
  echo " \ \ /\ / / _  | __/  _  |/ _ \  _  \\"
  echo "  \ V  V / (_| | | | (_| |  __/ | | |"
  echo "   \_/\_/ \__,_|_|  \__,_|\___|_| |_| updater"
  tput sgr0

  cp assets/*.sh ~/opt/warden/
  chmod 755 ~/opt/warden/*.sh

  echo 'Warden has been updated with the latest scripts. Your saved profiles have been preserved.'
fi

if [ ! -d ~/opt/warden ]; then
  echo 'Warden is not installed; there is nothing to update!'
  echo 'To install Warden, run ". install.sh"'
fi
