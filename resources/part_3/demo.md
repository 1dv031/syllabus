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




## Install Web Servers
### Nginx
<iframe width="853" height="480" src="https://www.youtube.com/embed/LGV2Z1GQCaY?rel=0" frameborder="0" allowfullscreen></iframe>
* Install Nginx
  ```
  sudo apt-get update
  sudo apt-get install nginx
  ```
* Configure the firewall, use `sudo ufw app list` to see the names of install services
  ```
  sudo ufw allow 'Nginx Full'
  sudo ufw allow OpenSSH
  sudo ufw enable
  sudo ufw status
  ```
* Control Nginx
  * Nginx status `systemctl status nginx`
  * Stop Nginx service `sudo systemctl stop nginx`
  * Start Nginx service `sudo systemctl start nginx`
  * Restart Nginx, connections to the web server will be lost `sudo systemctl restart nginx`
  * Reload configuration, reload without dropping connections `sudo systemctl reload nginx`
  * Disable the Nginx service to start up at boot `sudo systemctl disable nginx`
  * Re-enable the service to start up at boot `sudo systemctl enable nginx`

### Apache 2
<iframe width="853" height="480" src="https://www.youtube.com/embed/zmegNRww3wQ?rel=0" frameborder="0" allowfullscreen></iframe>
* Install Apache
  ```
  sudo apt-get update
  sudo apt-get install apache2
  ```
* Configure the firewall, use `sudo ufw app list` to see the names of install services
  ```
  sudo ufw allow 'Apache Full'
  sudo ufw allow OpenSSH
  sudo ufw enable
  sudo ufw status
  ```
* Control Nginx
  * Apache status `systemctl status apache2`
  * Stop Apache service `sudo systemctl stop apache2`
  * Start Apache service `sudo systemctl start apache2`
  * Restart Apache, connections to the web server will be lost `sudo systemctl restart apache2`
  * Reload configuration, reload without dropping connections `sudo systemctl reload apache2`
  * Disable the Apache service to start up at boot `sudo systemctl disable apache2`
  * Re-enable the service to start up at boot `sudo systemctl enable apache2`

## Configure Web Servers
### Apache 2
<iframe width="853" height="480" src="https://www.youtube.com/embed/kj4iQvq6Tgg?rel=0" frameborder="0" allowfullscreen></iframe>
* Create the Directory Structure and permissions
  ```
  sudo mkdir -p /var/www/jl222gk.devopslab.xyz/public_html
  sudo mkdir -p /var/www/test.jl222gk.devopslab.xyz/public_html
  sudo chown -R $USER:$USER /var/www/jl222gk.devopslab.xyz/public_html
  sudo chown -R $USER:$USER /var/www/test.jl222gk.devopslab.xyz/public_html
  sudo chmod -R 755 /var/www
  ```
* Create Demo Pages for the sites
  * `nano /var/www/jl222gk.devopslab.xyz/public_html/index.html`
    ```
    <html>
      <head>
        <title>Welcome to jl222gk's page!</title>
      </head>
      <body>
        <h1>Success! jl222gk's page is working!</h1>
      </body>
    </html>
    ```
  * `nano /var/www/test.jl222gk.devopslab.xyz/public_html/index.html`
    ```
    <html>
      <head>
        <title>Welcome to jl222gk's Test page!</title>
      </head>
      <body>
        <h1>Success! jl222gk's Test page is working!</h1>
      </body>
    </html>
    ```
* Create New Virtual Host Files
  * Copy the default config `sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/jl222gk.devopslab.xyz.conf`
  * Edit the config for the first site `sudo nano /etc/apache2/sites-available/jl222gk.devopslab.xyz.conf`
    ```
    <VirtualHost *:80>
      ServerAdmin admin@jl222gk.devopslab.xyz
      ServerName jl222gk.devopslab.xyz
      ServerAlias www.jl222gk.devopslab.xyz
      DocumentRoot /var/www/jl222gk.devopslab.xyz/public_html
      ErrorLog ${APACHE_LOG_DIR}/error.log
      CustomLog ${APACHE_LOG_DIR}/access.log combined
    </VirtualHost>
    ```
  * Setup the second site by coping the first `sudo cp /etc/apache2/sites-available/jl222gk.devopslab.xyz.conf /etc/apache2/sites-available/test.jl222gk.devopslab.xyz.conf`
  * Edit the config for the first site `sudo nano /etc/apache2/sites-available/test.jl222gk.devopslab.xyz.conf`
    ```
    <VirtualHost *:80>
      ServerAdmin admin@test.jl222gk.devopslab.xyz
      ServerName test.jl222gk.devopslab.xyz
      ServerAlias www.test.jl222gk.devopslab.xyz
      DocumentRoot /var/www/test.jl222gk.devopslab.xyz/public_html
      ErrorLog ${APACHE_LOG_DIR}/error.log
      CustomLog ${APACHE_LOG_DIR}/access.log combined
    </VirtualHost>
    ```
* Enable the new sites with `a2ensite`
  ```
  sudo a2ensite jl222gk.devopslab.xyz.conf
  sudo a2ensite test.jl222gk.devopslab.xyz.conf
  ```
* Disable the default site with `sudo a2dissite 000-default.conf`
* Restart Apache 2 `sudo systemctl restart apache2`

### Nginx
<iframe width="853" height="480" src="https://www.youtube.com/embed/Uz2V46yOUFQ?rel=0" frameborder="0" allowfullscreen></iframe>
* Create the Directory Structure and permissions
  * Same as in Apache 2
* Create Demo Pages for the sites
  * Same as in Apache 2
* Create Server Block Files for each site
  * Create the first server block config file by copying the default file: `sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/jl222gk.devopslab.xyz`
  * Edit the file `sudo nano /etc/nginx/sites-available/jl222gk.devopslab.xyz`
    ```
    server {
      listen 80 default_server;
      listen [::]:80 default_server ipv6only=on;

      root /var/www/jl222gk.devopslab.xyz/public_html;
      index index.html index.htm;

      server_name jl222gk.devopslab.xyz www.jl222gk.devopslab.xyz;

      location / {
          try_files $uri $uri/ =404;
      }
    }
    ```
  * Setup the second site by coping the first `sudo cp /etc/nginx/sites-available/jl222gk.devopslab.xyz /etc/nginx/sites-available/test.jl222gk.devopslab.xyz`
    ```
    server {
      listen 80;
      listen [::]:80;

      root /var/www/test.jl222gk.devopslab.xyz/public_html;
      index index.html index.htm;

      server_name test.jl222gk.devopslab.xyz www.test.jl222gk.devopslab.xyz;

      location / {
          try_files $uri $uri/ =404;
      }
    }
    ```
* Enable your sites
  ```
  sudo ln -s /etc/nginx/sites-available/jl222gk.devopslab.xyz /etc/nginx/sites-enabled/
  sudo ln -s /etc/nginx/sites-available/test.jl222gk.devopslab.xyz /etc/nginx/sites-enabled/
  ```
* Disable the default site `sudo rm /etc/nginx/sites-enabled/default`
* Fixing long names bay changing the config file `sudo nano /etc/nginx/nginx.conf` and uncomment the line `server_names_hash_bucket_size 64;`
* Restart the server `sudo systemctl restart nginx`

## Create a Windows Admin machine
<iframe width="853" height="480" src="https://www.youtube.com/embed/NNxCxQf_sUY?rel=0" frameborder="0" allowfullscreen></iframe>
* Create a new Windows Server 2012 R2 With GUI
* Get password
  ```
  openstack server list
  nova get-password {Server-Id} .ssh/{your-key.pem}
  ```
* Get a floating IP
  ```
  openstack ip floating create ext_net
  openstack ip floating add <IP> <ServerName>
  ```
* Create a Security Group for RDP (TCP 3389)
* Connect to the server with a RDP client
* Set a password for the administrator account `net user administrator *``

## Install Active Directory
<iframe width="853" height="480" src="https://www.youtube.com/embed/klp6rsdwNLA?rel=0" frameborder="0" allowfullscreen></iframe>
Please note:
**When you create the machine for the domain controller, if you want to use a static IP you must do that with the CLI when you create the machine. I've made a video on this, see below...**

* Add ADDS role
  ```
  Import-Module ServerManager
  Add-WindowsFeature AD-Domain-Services
  ```
* Set Administrator Password `net user administrator *`
* Promote DC
  ```
  Import-Module ADDSDeployment
  Install-ADDSForest `
  -CreateDnsDelegation:$false `
  -DatabasePath "C:\Windows\NTDS" `
  -DomainMode "Win2012R2" `
  -DomainName "corp.mediawork.com" `
  -DomainNetbiosName "MEDIAWORK" `
  -ForestMode "Win2012R2" `
  -InstallDns:$true `
  -LogPath "C:\Windows\NTDS" `
  -NoRebootOnCompletion:$false `
  -SysvolPath "C:\Windows\SYSVOL" `
  -Force:$true
  ```

## Network Security
<iframe width="853" height="480" src="https://www.youtube.com/embed/oLQJj2kNG08?rel=0" frameborder="0" allowfullscreen></iframe>

## Static IP
<iframe width="853" height="480" src="https://www.youtube.com/embed/PW9XObZZ63Y?rel=0" frameborder="0" allowfullscreen></iframe>
Please note:
**When I create the security group for the LAN I choose Other Protocol and then specified -1. You can not do this int the version of Openstack we use now. Therefor you need to create 3 rules; one for ALL ICMP, one for ALL UDP and one for All TCP**

## Windows File Server and AGDLP
<iframe width="853" height="480" src="https://www.youtube.com/embed/8fQyGVRTHlU?rel=0" frameborder="0" allowfullscreen></iframe>
* Set Administrator Password `net user administrator *`
* Set name server to DC
* Join domain `sconfig`
  ```
  Install-WindowsFeature File-Services
  ```
* Remote Managment for Firewall
  ```
  netsh advfirewall firewall set rule group=“Windows Firewall Remote Management” new enable=yes
  netsh advfirewall firewall set rule group=“Remote Volume Management” new enable=yes
  netsh advfirewall firewall set rule group=“File and Printer Sharing” new enable=yes
  netsh advfirewall firewall set rule group=“Remote Service Management” new enable=yes
  netsh advfirewall firewall set rule group=“Remote Event Log Management” new enable=yes
  ```
* Create a folder and fix permissions
* Share and add AGDLP
* Test from a Client
<!--
## Scripting Active Directory with Windows Powershell
<iframe width="853" height="480" src="https://www.youtube.com/embed/zuAfIwKSftY?rel=0" frameborder="0" allowfullscreen></iframe>
If you would like to learn more Powershell, I had a full course on the subject two year ago, you can find it [here](https://coursepress.lnu.se/kurs/systemadministration-med-powershell/)
The lecture above is the one I think you'll need the most for this course.
-->
