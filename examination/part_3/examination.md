## Examination Assignment 3

In this third examination assignment You should set up a server environment suited for a specific situation. You are given a job description of a fictitious company ([ACME AB](https://en.wikipedia.org/wiki/Acme_Corporation)) who need help with the installation and setup of the company network, both locally and publicly. To help you we have our cloud environment (labcloudftk.lnu.se) where you can solve the problem.

### Documentation
During the oral examination, you will get 10 minutes available to explain and defend your solution of the assignment. To assist you and the examiner, you should provide a general documentation where you can quickly get en overview of your solution. An image of the network topology, server name and password are the minimum that should be included.

The cloud environment that you will use is only for showing your solution to the customer, so try to automate and script the environment as much as possible.

### Description of Acme AB
Below are the assignment described in the form of a description of the ACME AB's IT strategist, Brumund Dal.

---

Hello! <br />
We are in need of a new server environment where we can handle our local network and the operations of our web applications.

### DMZ
We have need of hosting four web sites, two should run on PHP with Apache while the other two to be hosted on a Nginx and node.js applications. We would then have two Web servers with two Web sites on each, each Web server must be a separate virtual machine. It is desirable to install server script languages but not a requirement. These four web sites only need to run a simple "Hello World application" for now. You must be able to access the sites for the outside with the help of the below URLs.

* acmea.xx222xx.devopslab.xyz (PHP)
* acmeb.xx222xx.devopslab.xyz (Node.js)
* acmec.xx222xx.devopslab.xyz (PHP)
* acmed.xx222xx.devopslab.xyz (Node.js)

We also need to have a DNS management that you will need to install and configure for us. You should set up name servers to be authoritative for the zone xx222xx.devopslab.xyz. When you are ready to be delegated the control for the zone you should send a email to **1dv031@lnu.se.** In the email you should specify the domain name you will be responsible for. Examples Mail: <br />
![Exempelmail](https://raw.githubusercontent.com/1dv031/syllabus/master/examination/part_3/img/domain-name-mail.png)

*Please note that **xx222xx** should be replaced by your LNU username*

Web Server and DNS servers should be in their own DMZ separate from the LAN.

### LAN
We also want you to install and set up a LAN for us, separated from the above described DMZ. In this scenario it will work to use the designated cloud service (labcloudftk.lnu.se). We have the following demands on our LAN:

* Management of Active Directory in which our organization has been implemented in a good way. See our organizational structure below.
* A file server with shares for the different departments and appropriate permission based on our organization.
* A test client (Windows), standard Windows desktop that can be implemented in the cloud environment for testing.
* We have created a CSV file with employee information that we want to be included in Active Directory, [ACME Inc. - Employees](https://raw.githubusercontent.com/1dv031/syllabus/master/examination/part_3/files/acme-employees.csv)

### Our organization
The image below describes our organization, this model should guide your approach. The management level should have full permissions everywhere while the various subdivisions only have access to their respective parts. Create an appropriate file structure and shares that shows that this works.

![organization](https://raw.githubusercontent.com/1dv031/syllabus/master/examination/part_3/img/organization-chart.png)