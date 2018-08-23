# Warden for Linux

Provides encrypted storage and loading of Microsoft Azure credentials via CLI commands.

An Azure alternative to the popular tool 'Credulous' for AWS; Warden provides a safe, seamless way of authenticating with the Azure API to allow deployment of assets via Terraform or the Azure CLI. Multiple users can securely store their Azure credentials on a single machine, locked behind a username and password.

Installation & Removal Instructions:

* To install, run '. install.sh'
* To uninstall, run 'warden-uninstall'
* For use with Vagrant; download directly onto VM and install, not on host machine.

Usage Guide:

* 'warden-add' - stores a new set of credentials under a username.
* 'warden-source' - sources a set of stored credentials.
* 'warden-list' - lists all currently stored accounts.

Future development:

* Ability to remove/modify credentials via CLI
* Support for AWS
* "warden-source username"

Authored by Daniel Fears.
