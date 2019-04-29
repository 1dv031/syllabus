## Getting started with OpenStack
This part is combining some newly recorded material for managing your cloud accounts on our OpenStack cloud.
Before you start using our lab cloud, make sure you watch trough these videos. The interface can be a bit different since we have updated the Open Stack version since the demo was recorded.

### Getting started - Create your network
In this video we talk about our cloud environment, CS Cloud, that is built on [OpenStack](https://www.openstack.org/). You learn what it is and how you could log into it and start using it. The video also shows how to start to set up a new network for your OpenStack project.
<iframe width="420" height="240" src="https://www.youtube.com/embed/S1XWOxj3GmU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
[Download mp4](http://coursepress.lnu.se/pub/education/course/1dv031/vt19/movies/create_network_cscloud.mp4)

### Create an instance
In this video you will learn how to create an instance or machine in your network
<iframe width="420" height="240" src="https://www.youtube.com/embed/48vUTOmZAfg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
[Download mp4](http://coursepress.lnu.se/pub/education/course/1dv031/vt19/movies/create_instance.mp4)

### Connect to an instance through SSH
When we now have created our machine we want to connect to and log in on it. This is done by using SSH and a pre-produced SSH-key.
<iframe width="420" height="240" src="https://www.youtube.com/embed/7wbvCgKRKZA" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
[Download mp4](http://coursepress.lnu.se/pub/education/course/1dv031/vt19/movies/ssh_to_instance.mp4)

### Using the OpenStackClient (OSC) - with docker
In this video we go through how to run a docker container that includes the OSC. 
<iframe width="420" height="240" src="https://www.youtube.com/embed/Odd59bAj598" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
[Download mp4](http://coursepress.lnu.se/pub/education/course/1dv031/vt19/movies/using-os-cli-docker.mp4)

**OBS! For more demos about cli-commands you can whats the older recording below (see OpenStack CLI).**


## Older videos
Here are some older videos that could still be of importance. The are recorded in an older version of OpenStack but most of the instructions are still relevant. Some of the contents is the same as the new videos above.

<iframe width="420" height="240" src="https://www.youtube.com/embed/videoseries?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1" frameborder="0" allowfullscreen></iframe>

### Web Interface
* [Overview of the Web interface](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=gTN6iSopAvo)
* [Network](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=ELQKjXU4Qh0)
  * [Create a router](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=ELQKjXU4Qh0&t=1m15s)
  * [Create a network](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=ELQKjXU4Qh0&t=3m) <br />
    DNS: 194.47.199.41, 194.47.110.97
  * [Add an interface for the router](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=ELQKjXU4Qh0&t=6m10s)
* [Key pair](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=QWmx1K9duHk)
  * [Create a Key Pair](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=QWmx1K9duHk&t=32s) (OBS You don't have to create your own keys, they ones you should use are already created for you!) Make sure to actually log in with SSH on Linux using keys only, do not active log in using password. For Windows when you do use passwords, make sure you use secure passwords from the start!
  * [Add Key to your computer](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=QWmx1K9duHk&t=59s)
  ```bash
  chmod 400 my-key.pem
  mv my-key.pem ~/.ssh
  eval $(ssh-agent)
  ssh-add -k ~/.ssh/my-key.pem
    ```
* [Create Instances](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=m34IBhq6MDY)

### OpenStack CLI
* [Install the OpenStack Client](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=pELgVCeUe4k&t=4s)
  * [Doc: Install the OpenStack Client](https://docs.openstack.org/user-guide/common/cli-install-openstack-command-line-clients.html)
  * [Install Python 2.7](https://www.python.org/downloads/)
  * [setup tools package](https://pypi.python.org/pypi/setuptools)
  * `easy_install pip`
  * `pip install python-openstackclient`
* [Get the OpenStack RC file](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=pELgVCeUe4k&t=2m40s)
  * [Run the RC file](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=pELgVCeUe4k&t=4m16s) <br />
    If you run **Windows**, download [this script](http://orion.lnu.se/pub/education/course/1DV031/vt16/part-3/files/windowsrc.cmd.zip) and run it like this: <br />
    `windowsrc.cmd {path to RC file}`
  * [Test the CLI](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=pELgVCeUe4k&t=5m46s)
* [Create a machine](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=KYyxxzS16QM&t=10s)
  * [List images](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=KYyxxzS16QM&t=39s) <br /> `openstack image list --limit 50`
  * [List flavor](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=KYyxxzS16QM&t=2m17s)  <br />`openstack flavor list`
  * [List key pair](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=KYyxxzS16QM&t=2m51s)  <br /> `openstack keypair list`
  * [Create a Server](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=KYyxxzS16QM&t=3m13s)  <br /> `openstack server create --image <ImageID> --flavor <Number> --key-name <KeyName> <ServerName>`
  * [Create Floating ip](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=KYyxxzS16QM&t=7m50s)  <br /> `openstack ip floating create ext_net`
  * [Add floating IP](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=KYyxxzS16QM&t=9m10s)  <br /> `openstack  ip floating add <IP> <ServerName>`
  * [Add security group](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=KYyxxzS16QM&t=10m36s)  <br /> `openstack server add security group <ServerName> <security group>`

### Manage your servers
* [Using one machine to access others](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=FOlwmWzSb3Q&t=4s)
  * [Transfer your private key](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=FOlwmWzSb3Q&t=1m10s) <br /> `scp ~/.ssh/my-key.pem <username>@<IP>:~/.ssh/`
* [Add key](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=FOlwmWzSb3Q&t=2m47s)
  ```bash
  chmod 400 ~/.ssh/my-key.pem
  eval $(ssh-agent)
  ssh-add -k ~/.ssh/my-key.pem
  ```
* [Connect to other servers](https://www.youtube.com/watch?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1&v=FOlwmWzSb3Q&t=4m20s)
