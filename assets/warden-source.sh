#!/bin/bash

clear
echo '__        __            _'
echo '\ \      / /_ _ _ __ __| | ___ _ __'
echo ' \ \ /\ / / _` | __/  _  |/ _ \  _  \'
echo '  \ V  V / (_| | | | (_| |  __/ | | |'
echo '   \_/\_/ \__,_|_|  \__,_|\___|_| |_|  Source'
echo ''
echo ''
echo -n "Enter a username: "
read username

if [ ! -f ~/opt/warden/$username-creds.sh.gpg ]; then
    echo "Username not found!"
else
  gpg --output ~/opt/warden/$username-creds.sh --decrypt ~/opt/warden/$username-creds.sh.gpg
  wait
  source ~/opt/warden/$username-creds.sh
  wait
  rm -rf ~/opt/warden/$username-creds.sh
  clear
  echo "*** Azure credentials successfully sourced ***"
  echo ""
fi
