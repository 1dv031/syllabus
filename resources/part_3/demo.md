## Installation & Post setup
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
