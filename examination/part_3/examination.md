## Examination Assignment 3

In this examination assignment You should set up a server environment suited for a specific situation. You are given a job description of a fictitious company ([ACME AB](https://en.wikipedia.org/wiki/Acme_Corporation)) who need help with the installation and setup of the companys web and DNS services. To help you we have our cloud environment (cscloud.lnu.se) where you can solve the problem. The examination includes an oral hearing where the theoretical part of the course will be examine.

## Description of the practical assignment
Below are the assignment described in the form of a description of the ACME AB's IT strategist, Brumund Dal.

---

Hello! <br />
We are in need of a new server environment where we can handle our DNS servers and the operations of our web applications.

### Web servers

In the DMZ we need to serve two different web sites

* The first web site runs on a Apache web server with support for PHP and will be hosting a [Wordpress (latest version) installation](https://codex.wordpress.org/Installing_WordPress)(this requires mySQL or mariaDB as a database server also installed on the same instance). To show proof of concept just install a fresh Wordpress installation on the server showing that the server is correct configured. **OBS! Use strong passwords for both the database server and the Wordpress installation. This servers will be accessed from the public web!**
* The second web site is running on Node.js instances. This web site have higher traffic rate and must be able to scale with a load balancer. We want to use Nginx to handle this. So install a Nginx as a load balancer and two Node.js instances behind with the same Node.js (LTS version) application installed. To show us it will work you should use some kind of template application that shows that the server and application is running correctly ([Hint - see bash scripting video](https://www.youtube.com/watch?v=H1b9dVDz2TE)). The application running on this instances will be a stateless application meaning that no sessions is needed to be handled.

The web servers should listen to the standard port(s). 

### DNS service
You must be able to access the sites for the outside with the help of the below URLs.

* acmea.xx222xx.devopslab.xyz (PHP, Wordpress)
* acmeb.xx222xx.devopslab.xyz (Node.js, Express-template)


To be able to handle the domain name we also need to have DNS management. You should set up two name servers, one primary and one secondary, to be authoritative for the zone xx222xx.devopslab.xyz. When you are ready to be delegated the control for the zone you will "buy" the domain name and register your name servers from [DNS Manager](https://www.devopslab.xyz). Log in with the same credentials as you have at our CS Cloud. When logged in you can register your name servers, if you get an error look at the error messaged and fix your name servers and try again.

*Please note that **xx222xx** should be replaced by your LNU username*

Web Servers and DNS servers should be in our own DMZ network.

---
<br>
### Requirements of the assignment
* The network structure should of course work meaning
  * The DNS servers are correctly configuring meaning that the domain names acmea.xx222xx.devopslab.xyz and acmeb.xx222xx.devopslab.xyz is pointing to the web servers described above
  * The web servers is correctly installed and listening for HTTP requests
  * The load balancer is balancing the traffic between the two Node.js instances
  * The applications on the web servers is correctly installed and working as intended  
* There be some shell scripts handling part of the work:
  * Installation and configuration of the load balancer (adding the configuration file though code)
  * Installation and configuration of Apache and PHP
  * Downloading and installation of the latest Wordpress
  * Downloading and installation of the Node.js Applications
* The documentation is done in the README.md file of the examination repository in the 1dv031 organization
* All the script and configuration files you have used to solve the problem should be version controlled in your github repository

<br><br>
For those of you striving for higher grade you could implement more scripting like scripts for reproducing and tearing down the open stack environment (network, routers, instances and so on).

### Documentation of the project
You should document your project in your github repository by saving all scripted files, your configuration files and anything else that will help the examiner to backtrack your work. The repository must have a README.md where give a description of your project. Explain your network structure (add image over the topology) and explain and motivate the choices you have done in your project. Also write down in the end of the readme if you have done anything in the project that you think is relevant for getting higher grade then "Godkänd" (see grading below).

**Some days after the examination your cloud account will be deleted with all of your instances so be sure to take backup of your work if you want to save it.**


## The oral hearing
This assignment will have a oral hearing where theoretical questions will be asked by the examiner. The theoretical questions will focus on the last part of the course, with questions taken from the lectures, exercises and study material. During the oral examination, which is 30 minutes, there could also be some questions where you have to be ready to show your practical assignment. Be ready to share your screen and perform task like "log in to your instance and show and explain your load balancer configuration", "Show your DNS configuration" and so on.

## Grading
The assignment have the following grades: Underkänd, Godkänd, Väl godkänd. The following criteria will be used:

- Underkänd
  - For a performance which is unacceptable in all respects
- Underkänd med chans till komplettering
  -  For a performance which does not meet minimum requirements for acceptance on each examination steps. 
- Godkänd
  - For a performance meeting the requirements for acceptance on each examination steps meaning the students have a good knowledge of the subject and can discuss about the oral questions in a good way. The student  have solved the assignments showing he/she have a good level of understanding for all aspects of the relevant material.
- Väl godkänd
  - For a good performance - meaning the students have a very good knowledge of the subject and can discuss about the oral questions on a high level. The student have solved the assignments before the deadline and presented a working application showing he/she have a high level of understanding for all aspects of the relevant material. Things the examiner will look at may be how the student thinks about security (for instance running HTTPS instead of HTTP) and how easy it would be to tear down and reproduce the solution (e.g. most of the solution is scripted)

