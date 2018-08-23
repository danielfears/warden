# Warden for Linux

Provides encrypted storage and sourcing of Azure credentials. An alternative to Credulous for AWS.

Warden enables a safe and seamless way of authenticating with the Azure API, making it easier to provision assets with Terraform, PowerShell or the Azure CLI, and bypasses the browser requirement of 'az login'.

Multiple users can securely store their Azure credentials on a single machine, locked behind a username and password.

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
