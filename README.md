# Warden

Azure credential management for Linux; an alternative to Credulous for AWS.

Warden provides a **secure enclave** for the storage, encryption and loading of **Microsoft Azure** environment credentials, capable of managing multiple sets of user credentials on a single machine or compute node.

Users credentials are **stored encrypted** behind a password protected username that, with successful authentication, are **injected into the shell runtime environment**, so that they can be used by other tools like Terraform or the Azure CLI. 

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

Commands:

* **warden add** - stores a new set of credentials under a username and password.
* **warden source** - source a set of stored credentials.
* **warden list** - show all currently stored usernames.
* **warden remove** - remove an existing profile
* **warden help** - display the help menu

When adding a new profile, you will be asked for the following:

* ARM_SUBSCRIPTION_ID
* ARM_CLIENT_ID
* ARM_CLIENT_SECRET
* ARM_TENANT_ID

To exit out of a Warden command, use ctrl + c.

When updating an existing credential profile, it is recommended that you remove it and add as new.

### Removal:

* To uninstall, run **warden uninstall**

------

Support for AWS is in the works, so stay tuned.

Authored by Daniel Fears.
