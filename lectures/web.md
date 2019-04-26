## Lecture content

[The presentation](https://rawcdn.githack.com/1dv031/syllabus/19dcbe372b9b106d1fd4df659f747751ec533c5b/lectures/web.html)
 
A presentation about the web and web servers

## Resources
- [Recording VT19](https://youtu.be/acrPK_SOYFg) (Youtube)

## Demos - Apache

### Resources
https://httpd.apache.org/docs/2.4/

## Installing Apache2

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
* Control Apache
  * Apache status `systemctl status apache2`
  * Stop Apache service `sudo systemctl stop apache2`
  * Start Apache service `sudo systemctl start apache2`
  * Restart Apache, connections to the web server will be lost `sudo systemctl restart apache2`
  * Reload configuration, reload without dropping connections `sudo systemctl reload apache2`
  * Disable the Apache service to start up at boot `sudo systemctl disable apache2`
  * Re-enable the service to start up at boot `sudo systemctl enable apache2`

## Configure Apache 2
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



## Nginx configuration

### Resources
http://nginx.org/en/docs/

## Demo - Getting started
<iframe width="853" height="480" src="https://www.youtube.com/embed/fQUmTwo4jks" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
