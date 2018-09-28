#!/bin/bash

clear
echo '__        __            _'
echo '\ \      / /_ _ _ __ __| | ___ _ __'
echo ' \ \ /\ / / _` | __/  _  |/ _ \  _  \'
echo '  \ V  V / (_| | | | (_| |  __/ | | |'
echo '   \_/\_/ \__,_|_|  \__,_|\___|_| |_|  Remove'
echo ''
echo ''
echo -n "Enter a username:"
echo ''
read username
if [ ! -f ~/opt/warden/$username-creds.sh.gpg ]; then
    echo "Username not found!"
else
  echo -n "Are you sure you want to remove profile: $username? [n/y]: "
  read removeuser
  if [[ $removeuser == "Y" || $removeuser == "y" || $removeuser == "yes" ]]; then
      echo "Profile for $username has been removed from Warden"
      rm -rf ~/opt/warden/$username-creds.sh.gpg
  else
      echo "Profile for $username NOT removed"
  fi
fi
