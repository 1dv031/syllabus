<style>
pre {
  margin: 0 0 0 0;
  box-sizing: border-box;
  white-space: pre;
  word-wrap: normal;
  overflow: auto !important;
  background-color: rgba(0, 0, 0, 0.05);
  padding: 13px 17px;
  font-size: 14px;
}
span.highlight{
  background: none;
  color: #de3939
}
</style>

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

## Authoritative-Only DNS Server
### Master Name Server
* Create a machine
* Check the name and local lookup
  * Local lookup `sudo nano /etc/hosts`

```
127.0.0.1 localhost
192.168.20.53 ns1.devopslab.xyz ns1
```
  * Computer name `sudo nano /etc/hostname`
  * Reload config for computer name `sudo hostname -F /etc/hostname`
* Install bind

```
sudo apt-get update
sudo apt-get install bind9 bind9utils bind9-doc
```
* Configuring the Options File
  * `sudo nano /etc/bind/named.conf.options`

```
options {
  directory "/var/cache/bind";
  recursion no;
  allow-transfer { none; };

  dnssec-validation auto;

  auth-nxdomain no;    # conform to RFC1035
  listen-on-v6 { any; };
};
```
* Configure the Zone
  * `sudo nano /etc/bind/named.conf.local`

```
zone "devopslab.xyz" {
  type master;
  file "/etc/bind/zones/db.devopslab.xyz";
  allow-transfer { 192.168.20.54; };
};

zone "174.47.194.in-addr.arpa" {
  type master;
  file "/etc/bind/zones/db.194.47.174";
};
```
  * Create zone files

```
sudo mkdir /etc/bind/zones
sudo cp /etc/bind/db.local /etc/bind/zones/db.devopslab.xyz
sudo cp /etc/bind/db.127 /etc/bind/zones/db.194.47.174
```
  * Edit forward lookup zone file `sudo nano /etc/bind/zones/db.devopslab.xyz`

```
$TTL    604800
@       IN      SOA     ns1.devopslab.xyz. admin.devopslab.xyz. (
                              5         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
; Name servers
devopslab.xyz.    IN      NS      ns1.devopslab.xyz.
devopslab.xyz.    IN      NS      ns2.devopslab.xyz.

; A records for name servers
ns1             IN      A       194.47.174.124
ns2             IN      A       194.47.174.125

; Other A records
@               IN      A       194.47.174.110
www             IN      A       194.47.174.110
```

  * Edit reverse lookup zone file `sudo nano /etc/bind/zones/db.194.47.174`

```
$TTL    604800
@       IN      SOA     devopslab.xyz. admin.devopslab.xyz. (
                              5         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
; Name servers
        IN      NS      ns1.devopslab.xyz.
        IN      NS      ns2.devopslab.xyz.

; PTR records
124       IN      PTR      ns1.devopslab.xyz.
125       IN      PTR      ns2.devopslab.xyz.
110       IN      PTR      www.devopslab.xyz.
```
* Testing the Files and Restarting the Service
  * Test config syntax `sudo named-checkconf`
  * Check config `sudo named-checkzone devopslab.xyz /etc/bind/zones/db.devopslab.xyz`
  * Check reverse config `sudo named-checkzone 174.47.194.in-addr.arpa /etc/bind/zones/db.194.47.174`
  * `sudo service bind9 restart`
  * Check the logs `sudo tail -f /var/log/syslog`

### Secondary/Slave Name Server
* Create a machine
* Check the name and local lookup
  * Local lookup `sudo nano /etc/hosts`

```
127.0.0.1 localhost
192.168.20.54 ns2.devopslab.xyz ns2
```
  * Computer name `sudo nano /etc/hostname`
  * Reload config for computer name `sudo hostname -F /etc/hostname`
* Install bind

```
sudo apt-get update
sudo apt-get install bind9 bind9utils bind9-doc
```
* Configuring the Options File
  * `sudo nano /etc/bind/named.conf.options`

```
options {
    directory "/var/cache/bind";
    recursion no;
    allow-transfer { none; };

    dnssec-validation auto;

    auth-nxdomain no;    # conform to RFC1035
    listen-on-v6 { any; };
};
```
  * Configure the forward lookup zone `sudo nano /etc/bind/named.conf.local`

```
zone "devopslab.xyz" {
  type slave;
  file "db.devopslab.xyz";
  masters { 192.168.20.53; };
};

```
  * Configure the reverse lookup zone `sudo nano /etc/bind/named.conf.local`

```
zone "174.47.194.in-addr.arpa" {
  type slave;
  file "db.194.47.174";
  masters { 192.168.20.53; };
};
```
* Testing the Files and Restarting the Service
  * Test config syntax `sudo named-checkconf`
  * Restart bind `sudo service bind9 restart`
  * Check the logs `sudo tail -f /var/log/syslog`
