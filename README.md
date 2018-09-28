# Warden for Linux

An Azure alternative to Credulous for AWS.

Warden provides a **secure enclave** for the storage, encryption and sourcing of **Microsoft Azure** environment credentials for multiple users on a single machine or compute node.

Users credentials are stored behind locally created, password protected profiles. Upon sucessful profile authentication, Warden will load a users environment credentials into their current session to enable access to the Azure API; bypassing the web browser login requirement of Azure CLI.

### Installation:

* To install, run **. install.sh**
* For use with Vagrant; download and run installation directly on the Virtual Machine.

### Usage Guide:

* **warden-add** stores a new set of credentials under a username and password.
* **warden-source** will source a set of stored credentials.
* **warden-list** will show all currently stored usernames.

### Removal:

* To uninstall, run **warden-uninstall**

------

Ability to update existing credentials and support for AWS is in the works, stay tuned.

Authored by Daniel Fears.
