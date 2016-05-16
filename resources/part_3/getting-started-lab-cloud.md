## Getting started with OpenStack
Before you start using our lab cloud, you should watch all Getting started video in the Youtube playlist below:
<iframe width="853" height="480" src="https://www.youtube.com/embed/videoseries?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1" frameborder="0" allowfullscreen></iframe>

### Web Interface
* [Overview of the Web interface](https://youtu.be/gTN6iSopAvo)
* [Network](https://youtu.be/ELQKjXU4Qh0)
  * [Create a router](https://youtu.be/ELQKjXU4Qh0?t=1m15s)
  * [Create a network](https://youtu.be/ELQKjXU4Qh0?t=3m) <br />
    DNS: 194.47.199.41, 194.47.110.97
  * [Add an interface for the router](https://youtu.be/ELQKjXU4Qh0?t=6m10s)
* [Key pair](https://youtu.be/6I90SwLjuVQ)
  * [Create a Key Pair](https://youtu.be/6I90SwLjuVQ?t=32s)
  * [Add Key to your computer](https://youtu.be/6I90SwLjuVQ?t=59s)
  ```bash
  chmod 400 my-key.pem
  mv my-key.pem ~/.ssh
  eval $(ssh-agent)
  ssh-add -k ~/.ssh/my-key.pem
    ```
* [Create Instance](https://youtu.be/gKl_QqffRbQ?t=4s)
  * [Console](https://youtu.be/gKl_QqffRbQ?t=3m30s)
  * [Network](https://youtu.be/gKl_QqffRbQ?t=14m34s)
  * [Floating IP](https://youtu.be/gKl_QqffRbQ?t=6m8s)
* [Security Group](https://youtu.be/gKl_QqffRbQ?t=7m14s)
  * [Create new](https://youtu.be/gKl_QqffRbQ?t=8m50s)
  * [Assign to Instance](https://youtu.be/gKl_QqffRbQ?t=12m45s)
* [Connecting to the Instance](https://youtu.be/gKl_QqffRbQ?t=13m5s)

### OpenStack CLI
* [Install the OpenStack Client](https://youtu.be/pELgVCeUe4k?t=4s)
  * [Doc: Install the OpenStack Client](http://docs.openstack.org/cli-reference/common/cli_install_openstack_command_line_clients.html)
  * [Install Python 2.7](https://www.python.org/downloads/)
  * [setuptools package](https://pypi.python.org/pypi/setuptools)
  * `easy_install pip`
  * `pip install python-openstackclient`
* [Get the OpenStack RC file](https://youtu.be/pELgVCeUe4k?t=2m40s)
  * [Run the RC file](https://youtu.be/pELgVCeUe4k?t=4m16s) <br />
    If you run **Windows**, download this script and run it like this: <br />
    `rc-convert.bat {path to RC file}`
  * [Test the CLI](https://youtu.be/pELgVCeUe4k?t=5m46s)
* [Create a machine](https://youtu.be/KYyxxzS16QM?t=10s)
  * [List images](https://youtu.be/KYyxxzS16QM?t=39s) <br /> `openstack image list --limit 50`
  * [List flavor](https://youtu.be/KYyxxzS16QM?t=2m17s)  <br />`openstack flavor list`
  * [List key pair](https://youtu.be/KYyxxzS16QM?t=2m51s)  <br /> `openstack keypair list`
  * [Create a Server](https://youtu.be/KYyxxzS16QM?t=3m13s)  <br /> `openstack server create --image <ImageID> --flavor <Number> --key-name <KeyName> <ServerName>`
  * [Create Floating ip](https://youtu.be/KYyxxzS16QM?t=7m50s)  <br /> `openstack ip floating create ext_net`
  * [Add floating IP](https://youtu.be/KYyxxzS16QM?t=9m10s)  <br /> `openstack  ip floating add <IP> <ServerName>`
  * [Add security group](https://youtu.be/KYyxxzS16QM?t=10m36s)  <br /> `openstack server add security group <ServerName> <security group>`

### Manage your servers
* [Using one machine to access others](https://youtu.be/FOlwmWzSb3Q?t=4s)
  * [Transfer your private key](https://youtu.be/FOlwmWzSb3Q?t=1m10s) <br /> `scp ~/.ssh/my-key.pem <username>@<IP>:~/.ssh/`
* [Add key](https://youtu.be/FOlwmWzSb3Q?t=2m47s)
  ```bash
  chmod 400 ~/.ssh/my-key.pem
  eval $(ssh-agent)
  ssh-add -k ~/.ssh/my-key.pem
  ```
* [Connect to other servers](https://youtu.be/FOlwmWzSb3Q?t=4m20s)
