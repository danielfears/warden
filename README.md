# Warden for Linux

An Azure alternative to Credulous for AWS.

Warden provides a **secure enclave** for the storage, encryption and loading of **Microsoft Azure** environment credentials, capable of managing multiple sets of user credentials on a single machine or compute node.

Users credentials are **stored encryped** behind a password protected username that, with sucessful authentication, are **injected into the shell runtime environment**, so that they can be used by other tools like Terraform or the Azure CLI. 

This method **bypasses the web browser login** requiremed for the Azure CLI.

### How to install Warden:

* **cd** into the /warden folder downloaded or cloned from git.
* Run the following command: **. install.sh**
* Using Vagrant? Download and run installation directly on the Virtual Machine.

### How to update Warden:

* **cd** into the /warden folder downloaded or cloned from git.
* Run **git pull** to download the latest version.
* Run **. update.sh** to update core files.
* This will preserve all existing credential profiles.

### Usage Guide:

* **warden-add** stores a new set of credentials under a username and password.
* **warden-source** will source a set of stored credentials.
* **warden-list** will show all currently stored usernames.
* **warden remove** will remove an existing profile
* **warden help** will display the help menu
* **warden uninstall** will remove Warden, dependencies and all saved profiles

When updating an existing credential profile, it is recommended that you remove it and add as new.

### Removal:

* To uninstall, run **warden-uninstall**

------

Ability to update existing credentials and support for AWS is in the works, stay tuned.

Authored by Daniel Fears.
