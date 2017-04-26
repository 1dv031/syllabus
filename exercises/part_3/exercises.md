## Exercises
The assignments are divided in to separate levels, A, B and C where C is the most difficult level. You should always strive to complete at least level A and B.
Do not forget to document your network in your exercise repo.

***

## Exercise 01 - Server OS Installation
|  |  |
| ------------- | ------------- |
| Level  | A  |
| Week | 16-17 |
| Lectures| L04 |
| Prerequisites| Watch [L04 - OS installation and post setup ](https://youtu.be/Yh_A6E9EaL8) <br /> Watch [Demo - Installation & Post Setup](https://youtu.be/cRTm7FO3w98) |
| Requirements | [Virtual Box](https://www.virtualbox.org/wiki/Downloads) <br /> [Windows Server 2012 R2 Evaluation ISO](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-server-2012-r2) <br /> [Ubuntu Server 14.04 ISO](http://www.ubuntu.com/download/server) |
| Keywords| Server OS Installation |

### Assignment:
Your assignment is to install Windows Server 2012 R2 Core and Ubuntu Server 14.04. Use your exercise github repo to document all your configuration. Create a directory for each exercise inside your repo.

***

## Exercise 02 - Post Setup
|  |  |
| ------------- | ------------- |
| Level  | A  |
| Week | 16-17 |
| Lectures| L04 |
| Prerequisites| Watch [L04 - OS installation and post setup ](https://youtu.be/Yh_A6E9EaL8) <br /> Watch [Demo - Installation & Post Setup](https://youtu.be/cRTm7FO3w98) |
| Requirements | Exercise 01 |
| Keywords| Post Setup, OS Updates, Network settings, Firewall|

### Assignment:
Your assignment is to perform the post setup for the servers you installed in Exercise 1.

* Change the computer name on both servers
* Install the VirtualBox Guest Additions on both servers
* Install all recommended updates on both servers
* Network configuration:
  * Change the network to "Internal Network" for both machines
  * Configure the network to static addressing
    * Windows Server: 192.168.0.50/24
    * Ubuntu Server: 192.168.0.51/24
* Make sure that both servers can ping each other
* Make sure that the firewall is enabled on both servers

Use your exercise github repo to document all your configuration. Try to make it easy automate the post setup, perhaps make some scripts.

***



## Exercise 03 - Getting started with the Cloud
|  |  |
| ------------- | ------------- |
| Level  | A  |
| Week | 17-18 |
| Prerequisites| Watch [Demo - Getting started with OpenStack](https://youtu.be/gTN6iSopAvo?list=PLSWJPPj5sKmpd1_CvWzGsB8p6VdGFSEv1) all 7 clips |
| Requirements | none |
| Keywords| OpenStack |

### Assignment:
Your assignment is to get started with our cloud.
Follow the [video tutorial](https://coursepress.lnu.se/kurs/systemadministrationi/part-3-server-installation-and-operations/lab-cloud/) and make the same configuration.

Use your exercise github repo to document all your configuration. Try to make it easy to automate, perhaps make some scripts.

***

## Exercise 04 - Public Name Servers
|  |  |
| ------------- | ------------- |
| Level  | A  |
| Week | 18-19 |
| Lectures| L06 |
| Prerequisites|  Watch [L06 - Some Server services ](https://youtu.be/--m9YpZ8Av4) <br /> Watch [Demo - Public Name Server](https://youtu.be/zk_b8ms-pvc) |
| Requirements |  Exercise 03 and an admin jump machine |
| Keywords| DNS, Public Name Server, Authoritative-Only DNS Server |

### Assignment:
Your assignment is to set up two public authoritative-only name servers, one master and one slave.

* Install two new servers
* Both server should have Bind 9 installed
* Configure one as a master and the other as a slave
* Configure a forward lookup zone for `{your-username}.devopslab.xyz`
* Configure a reverse lookup zone for the public IP addresses that you will use.
* The name server should be configured to:
  * only answer for zones it has a zone file for
  * not forward question
  * only allow zone transfer to the slave server
  * be accessible from the Internet

Use your exercise github repo to document all your configuration. Try to make it easy automate the post setup, perhaps make some scripts.

***
