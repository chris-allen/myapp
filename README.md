## My App

### Requirements

#### ChefDK

ChefDK includes several utilities for creating and managing chef resources.  To install it, navigate [here](https://docs.chef.io/install_dk.html#get-package-run-installer) and complete the ___Get Package, Run Installer___ and ___Set System Ruby___ sections.

#### VirtualBox / Vagrant

VirtualBox and Vagrant will provide you with a virtual machine to provision using this cookbook.  You can download VirtualBox [here](https://www.virtualbox.org/wiki/Downloads) and Vagrant [here](https://www.vagrantup.com/downloads.html).

Once those are installed, install a couple of vagrant chef plugins:

```bash
$ vagrant plugin install vagrant-berkshelf
$ vagrant plugin install vagrant-omnibus
```

### Development

After installing `vagrant` and the chef plugins, you can start a vagrant vm using the ruby script `start_vm.rb`:

```bash
$ ./start_vm.rb
Initializing cookbook submodule ...     [DONE]
Initializing local-config.php with defaults ... [DONE]
Starting vm ...
Bringing machine 'default' up with 'virtualbox' provider...
    default: The Berkshelf shelf is at "/Users/user/.berkshelf/vagrant-berkshelf/shelves/berkshelf20160506-3919-1cap0ms-default"
==> default: Sharing cookbooks with VM
==> default: Importing base box 'ubuntu/trusty64'...
==> default: Matching MAC address for NAT networking...
==> default: Checking if box 'ubuntu/trusty64' is up to date...
...
```

This will initialize the cookobook submodule, create a default `local-config.php` (if it doesn't already exist), and start a VirtualBox vm using the cookbook to provision it.  Most importantly, it shares this directory with the vm.  Any changes made to files are mirrored in the coupled OS.

You can access the server via `http://localhost:8080`
