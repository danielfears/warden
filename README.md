# Warden for Linux

Provides encrypted storage and sourcing of Azure credentials. An alternative to Credulous for AWS.

Warden enables a safe and seamless way of authenticating with the Azure API; making it easier to provision assets with Terraform, PowerShell or the Azure CLI, while bypassing the browser requirement of 'az login'.

Multiple users can securely store their Azure credentials on a single machine, locked behind a username and password.

### Installation:

* To install, run **. install.sh**
* For use with Vagrant; download directly onto the VM and install, not on the host machine.

### Usage Guide:

* **warden-add** stores a new set of credentials under a username and password.
* **warden-source** will source a set of stored credentials.
* **warden-list** will show all currently stored usernames.

### Removal:

* To uninstall, run **warden-uninstall**

Future development will include ability to remove/modify credentials via CLI, support for AWS, and the warden-source *username* command

Authored by Daniel Fears.
