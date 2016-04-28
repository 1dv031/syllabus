## Installation & Post setup
<iframe width="853" height="480" src="https://www.youtube.com/embed/cRTm7FO3w98?rel=0" frameborder="0" allowfullscreen></iframe>
* Virtual box
  * The interface
  * Creating a machine
  * Configure hardware
  * Mounting ISO
* Installing Windows Server 2012 R2 Core
* Installing Ubuntu Server 14.04
* Post setup
  * Install Drivers/Additions
  * Showing network settings
  * Configure network
  * Getting updates
  * Configure firewall

### Guest Additions
**Install kernel headers and build tools**
```bash
sudo apt-get install build-essential module-assistant
sudo m-a prepare
```

**Mounting CD in Ubuntu**
```bash
# find out the device
sudo blkid
# create directory to mount
mkdir ~/cdrom
# mount the cd
sudo mount /dev/sr0 ~/cdrom/
```

**Compile virtualbox guest additions**
```bash
# Navigate to the directory and run the script named VBoxLinuxAdditions.run
cd cdrom/
ls
sudo ./VBoxLinuxAdditions.run
sudo eject
sudo reboot
```

***


## Domain registration and nslookup
<iframe width="853" height="480" src="https://www.youtube.com/embed/O92qhxqpa98?rel=0" frameborder="0" allowfullscreen></iframe>
* Register a domain name
  * Manage the domain name
    * Add some records
    * Change name servers
    * Domain Transfer
* nslookup
  * The basics
  * Change server
  * Specify resource type
  * Debug
  * Query types
    * recurse
    * norecurse

## Getting started with OpenStack
### Web Interface
* Overview of the Web interface
* Network
  * Create a router
  * Create a network
  * Add an interface for the router
* Create a Key pair
  * Add Key
    ´´´bash
    chmod 400 my-key.pem
    mv my-key.pem ~/.ssh
    eval `ssh-agent -s`
    ssh-add -k ~/.ssh/my-key.pem
    ```
* Create Instance
  * Image
  * Network
    * DNS: 194.47.199.41, 194.47.110.97
  * Security Group
  * Console
  * Floating IP
* Security Group
  * Create new
  * Assign to Instance
* Connecting to the Instance

## OpenStack CLI
* [Install the OpenStack Client](http://docs.openstack.org/cli-reference/common/cli_install_openstack_command_line_clients.html)
  * Install Python 2.7
  * [setuptools package(https://pypi.python.org/pypi/setuptools)]
  * easy_install pip
  * pip install python-openstackclient
* Get the OpenStack RC file
  * run the RC file
* Create a machine
  * List images `openstack image list --limit 50`
  * List flavor `openstack flavor list`
  * List key pair `openstack keypair list`
  * Create a Server `openstack server create --image <ImageID> --flavor <Number> --key-name <KeyName> <ServerName>`
  * Create Floating ip `openstack ip floating create ext_net`
  * Add floating IP `openstack  ip floating add <IP> <ServerName>`
  * Add security group ´openstack server add security group <ServerName> <security group>`

## Using one machine to access others
* Copy key ´scp ~/.ssh/my-key.pem <username>@<IP>:~/.ssh/´
* Add key
  ```bash
  chmod 400 ~/.ssh/my-key.pem
  eval `ssh-agent -s`
  ssh-add -k ~/.ssh/my-key.pem
  ```
