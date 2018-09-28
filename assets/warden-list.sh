#!/bin/bash

echo ""
echo "Warden - List of accounts with encrypted credentials:"
echo ""
count=$(ls -1 ~/opt/warden/*.sh.gpg 2>/dev/null | wc -l)
if [ "$count" != 0 ]
then
    ls -1 ~/opt/warden/*.sh.gpg | tr '\n' '\0' | xargs -0 -n 1 basename | sed -e 's/\-creds.sh.gpg$//'
else
    echo "There are no accounts currently being stored by Warden."
fi
echo ""
