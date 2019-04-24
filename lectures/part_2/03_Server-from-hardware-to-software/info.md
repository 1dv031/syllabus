## From Hardware to Software

This is a pre-recorded lecture that talks about the operating system and its component and also some hardware components. 
Some of the content below includes information about the Windows operating system. 
This year we will only focus on Linux as a server operating system though.

<iframe width="560" height="315" src="https://www.youtube.com/embed/V2B21MCQ0GM?t=10m23s&list=PLSWJPPj5sKmr_PkB_qU4SAA-B5Rv4ICF2" frameborder="0" allowfullscreen></iframe>

### Keywords
server, hardware, operating system

### Resources
- [HTML-presentation](https://cdn.rawgit.com/1dv031/syllabus/master/lectures/part_2/03_Server-from-hardware-to-software/index.html#/)
- [Recording](https://youtu.be/V2B21MCQ0GM?t=10m22s&list=PLSWJPPj5sKmr_PkB_qU4SAA-B5Rv4ICF2) (Youtube)

### Reading
An article about operating system [OSU DevOps BootCamp](https://devopsbootcamp.osuosl.org) <br />
[https://devopsbootcamp.osuosl.org/operating-systems.html](https://devopsbootcamp.osuosl.org/operating-systems.html)

### Demo
This demo shows the procedure of the installation and post-setup of operating systems. It uses the virtual box program and installs both Windows (optional) and Linux.


<iframe width="853" height="480" src="https://www.youtube.com/embed/cRTm7FO3w98?rel=0" frameborder="0" allowfullscreen></iframe>
* Virtual box
  * The interface
  * Creating a machine
  * Configure hardware
  * Mounting ISO
* Installing Windows Server 2012 R2 Core (optional)
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