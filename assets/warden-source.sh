#!/bin/bash

echo -n "Enter your username: "
read username
gpg --output ~/opt/warden/$username-creds.sh --decrypt ~/opt/warden/$username-creds.sh.gpg
wait
source ~/opt/warden/$username-creds.sh
wait
rm -rf ~/opt/warden/$username-creds.sh
clear
echo "*** Azure credentials successfully sourced ***"
echo ""
