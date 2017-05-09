## Examination Assignment 3

In this third examination assignment You should set up a server environment suited for a specific situation. You are given a job description of a fictitious company ([ACME AB](https://en.wikipedia.org/wiki/Acme_Corporation)) who need help with the installation and setup of the company network, both locally and publicly. To help you we have our cloud environment (labcloudftk.lnu.se) where you can solve the problem.

### Documentation
During the oral examination which is 30 minutes you will get 10 minutes available to explain and defend your solution of the assignment. To assist you and the examiner, you should provide a general documentation where you can quickly get en overview of your solution. An image of the network topology, server name and *password* are the minimum that should be included.

The cloud environment that you will use is only for showing your solution to the customer, so try to automate and script the environment as much as possible.

### Description of Acme AB
Below are the assignment described in the form of a description of the ACME AB's IT strategist, Brumund Dal.

---

Hello! <br />
We are in need of a new server environment where we can handle our local network and the operations of our web applications.

### Part 1 - DMZ

We have need of hosting four web sites, two will run PHP on an Apache while the other two to be hosted through a Nginx and running a Node.js applications. The PHP applications will be a fresh [Wordpress (latest version) installation](https://codex.wordpress.org/Installing_WordPress) (will require mySQL/mariaDB as a database server) and the Node.js (LTS version) application should be some kind of template application that shows that the server and application is running correctly ([Hint - see bash scripting video](https://github.com/CS-LNU-Learning-Objects/linux) )

The web servers should listen to the standard port. That means that in the case of node.js / nginx the Nginx should perform as a reversed proxy that sends the traffic to the node-application (which could listen to another port).
To get some help configuring the Nginx as an reversed proxy see this article: https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-ubuntu-16-04. Especially the the part "Set Up Nginx as a Reverse Proxy Server".

#### DNS
You must be able to access the sites for the outside with the help of the below URLs.

* acmea.xx222xx.devopslab.xyz (PHP, Wordpress)
* acmeb.xx222xx.devopslab.xyz (Node.js, Express-template)
* acmec.xx222xx.devopslab.xyz (PHP, Wordpress)
* acmed.xx222xx.devopslab.xyz (Node.js, Express-template)

We also need to have a DNS management that you will need to install and configure for us. You should set up name servers to be authoritative for the zone xx222xx.devopslab.xyz. When you are ready to be delegated the control for the zone you will "buy" the domain name and register your name servers from [DNS Manager](https://www.devopslab.xyz). Log in with the same credentials as you have at our Lab Cloud. When logged in you can register your name servers, if you get an error look at the error messaged and fix your name servers and try again.

*Please note that **xx222xx** should be replaced by your LNU username*

Web Server and DNS servers should be in their own DMZ separate from the LAN.

### Part 2 - LAN
<!--
We also want you to install and set up a LAN for us, separated from the above described DMZ. In this scenario it will work to use the designated cloud service (labcloudftk.lnu.se). We have the following demands on our LAN:

* Management of Active Directory in which our organization has been implemented in a good way. See our organizational structure below.
* A file server with shares for the different departments and appropriate permission based on our organization.
* A test client (Windows), standard Windows desktop that can be implemented in the cloud environment for testing.
* We have created a CSV file with employee information that we want to be included in Active Directory, [ACME Inc. - Employees](https://raw.githubusercontent.com/1dv031/syllabus/master/examination/part_3/files/acme-employees.csv). We have also included a Powershell script to generate the OU structure and adding all the users and organizational groups, [ACME Inc. - PS Script](https://raw.githubusercontent.com/1dv031/syllabus/master/examination/part_3/files/acme-script.ps1) . You will have to modify the script for your environment.

### Our organization
The image below describes our organization, this model should guide your approach. The management level should have full permissions everywhere while the various subdivisions only have access to their respective parts. Create an appropriate folder/file structure and shares that shows that this works. You should use AGDLP strategy to implement the role based access control.

![organization](https://raw.githubusercontent.com/1dv031/syllabus/master/examination/part_3/img/organization-chart.png)
-->
