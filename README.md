# Warden for Linux

An Azure alternative to Credulous for AWS.

Warden provides a **secure enclave** for the storage, encryption and loading of **Microsoft Azure** environment credentials, capable of managing multiple sets of user credentials on a single machine or compute node.

Users credentials are **stored encryped** behind a password protected username that, with sucessful authentication, are **injected into the shell runtime environment**, so that they can be used by other tools like Terraform or the Azure CLI. 

This method **bypasses the web browser login** requiremed for the Azure CLI.

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
