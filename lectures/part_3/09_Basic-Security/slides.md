<!-- Start -->
# Today's lecture <!-- {_style="font-size:140%"} -->
* Cryptography Basic Principles
  * No just encryption
  * Asymmetric and Symmetric keys
  * Certificate
  * SSH
* Permissions
  * File Permissions in Linux
  * File Permissions in Windows
  * A G DL P
* Network
  * Network Segmentation
  * Firewall


Note:
These are the topics for todays lecture.


---
## Cryptography - Basic Principles <!-- {_style="font-size:180%;""} -->
* Confidentiality (Encryption) <!-- {_class="fragment"} -->
* Authentication <!-- {_class="fragment"} -->
* Integrity <!-- {_class="fragment"} -->
* Non Repudiation <!-- {_class="fragment"} -->

<!-- {_style="font-size:150%;"} -->

Note:
Encryption
In a simplest form, encryption is to convert the data in some unreadable form. This helps in protecting the privacy while sending the data from sender to receiver.
Authentication
Suppose, Alice sends a message to Bob and now Bob wants proof that the message has been indeed sent by Alice. This can be made possible if Alice performs some action on message that Bob knows only Alice can do.
Integrity
Now, one problem that a communication system can face is the loss of integrity of messages being sent from sender to receiver. Bob wants to know that the message Alice sent hasn't been modified on the way. This can be achieved by using the concept of cryptographic hash.
Non Repudiation
What happens if Alice sends a message to Bob but denies that she has actually sent the message? Cases like these may happen and cryptography should prevent the originator or sender to act this way. One popular way to achieve this is through the use of digital signatures.


--
## Cryptography - Basic Principles <!-- {_style="font-size:180%;""} -->
### Secret Key Cryptography
![Symmetric Encryption](./images/symmetric-encryption.png)<!-- {_style="width:550px;"} -->
* The sender applies a key to encrypt a message
* The receiver applies the same key to decrypt the message
* Only single key is used - symmetric encryption
* The biggest problem with symmetric encryption is distribution of the key


--
## Cryptography - Basic Principles <!-- {_style="font-size:180%;""} -->
### Public Key Cryptography
![Asymmetric Encryption](./images/asymmetric-encryption.png)<!-- {_style="width:550px;"} -->
* Each party has a private key and a public key.
* The private is secret and is not revealed while the public key is shared with all those whom you want to communicate with


--
## Cryptography - Basic Principles <!-- {_style="font-size:180%;""} -->
### Hash Functions
* Does not involve any key
* Uses a fixed length hash value that is computed on the basis of the message
* Used to check the integrity of the message to ensure that the message has not be altered,compromised or affected by virus

<!-- {_style="margin-right:25%"} -->
![Hash Functions](./images/hash-functions.png)<!-- {_style="width:800px;"} -->


--
## Certificates
* Digitally signed documents
* Verifies the validity of the public key
* The user's guarantee that:
  * the public key really belongs to the sender
  * the transmitter holds the private key
* What can be done with the public key


--
## Certificates
* What does a certificate contain?
  * Serial Number
  * Subject
  * Signature Algorithm
  * Signature
  * Issuer
  * Validity period
  * Key-Usage
  * Public Key
  * Thumbprint Algorithm
  * Thumbprint (also known as fingerprint)


--
## Certificates
### Public-Key Infrastructure (PKI)
* Anyone can send Bob a secret message
  * Provided they know Bob’s public key
* How do we know a key belongs to Bob?
  * If imposter substitutes another key, read Bob’s mail
* One solution: PKI
  * Trusted root authority (VeriSign, GlobalSign)
    * Everyone must know the verification key of root authority
  * Root authority can sign certificates
  * Certificates identify others, including other authorities
  * Leads to certificate chains


[![Chain of trust](https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Chain_of_trust.svg/512px-Chain_of_trust.svg.png) <br />By Yanpas (Own work) [CC BY-SA 4.0](http://creativecommons.org/licenses/by-sa/4.0)](https://commons.wikimedia.org/wiki/File%3AChain_of_trust.svg)

<!-- {_style="position:fixed;right: 0px; bottom: 0px;font-size:40%"} -->


--
## Certificates - Web Servers
1. Client connect on port 443, requests the server identity  <!-- {_class="fragment"} -->
2. Server sends a copy of the TLS Certificate, including servers public key <!-- {_class="fragment"} -->
3. Client check against list of thrusted CA´s and that the certificate is valid. Creates a symmetric key, encrypt it with the public key from the server. <!-- {_class="fragment"} -->
4. Server decrypt the symmetric key with its own private key. Start using the symmetric key when encrypt the messages <!-- {_class="fragment"} -->
5. We have a trusted and encrypted communication <!-- {_class="fragment"} -->

<!-- {_style="font-size:70%; margin-right:25%"} -->
![](./images/httpsflow.png)


--
## Perform SSH Login Without Password
1. Create public and private keys using ssh-key-gen on localhost
  ```
  ssh-keygen
  Generating public/private rsa key pair.
  Enter file in which to save the key (/home/ubuntu/.ssh/id_rsa):
  Enter passphrase (empty for no passphrase):
  Enter same passphrase again:
  Your identification has been saved in /home/ubuntu/.ssh/id_rsa.
  Your public key has been saved in /home/ubuntu/.ssh/id_rsa.pub.
  ```
2. Copy the public key to remote-host using ssh-copy-id
  ```
  ssh-copy-id -i ~/.ssh/id_rsa.pub user@remot-ip
  ```
3. Login to remote-host without entering the password
  ```
  ssh user@remot-ip
  or
  ssh -i ~/.ssh/id_rsa.pub user@remot-ip
  ```


---
## Linux File Permissions
* Permission Groups
  * owner
    * The Owner permissions apply only the owner of the file or director
  * group
    * The Group permissions apply only to the group that has been assigned to the file or directory
  * all users
    * The All Users permissions apply to all other users on the system
* Permission Types
  * read
    * The Read permission refers to a user's capability to read the contents of the file.
  * write
    * The Write permissions refer to a user's capability to write or modify a file or directory.
  * execute
    * The Execute permission affects a user's capability to execute a file or view the contents of a directory.

<!-- {_style="margin-right:25%"} -->


--
## Linux File Permissions
```
user@servername:~$ ls -l
drwxr-xr-x  8 jacob  staff  272 Apr 27 15:49 Admin
-rw-r--r--  1 jacob  staff  162 Apr 27 12:55 README.md
drwxr-xr-x  3 jacob  staff  102 Apr 27 13:17 Students
drwxr-xr-x  4 jacob  staff  136 Apr 28 10:15 libs
-rw-r--r--  1 jacob  staff   49 Apr 28 13:33 newUsers.csv
-rw-r--r--  1 jacob  staff  176 Apr 28 13:33 newUsers.html
```
<!-- {_style="margin: 0px; width:65%"} -->

* r = Read, w = Write, x = Execute
* The first character is the special permission flag that can vary.
* The following set of three characters (rwx) is for the owner permissions.
* The second set of three characters (rwx) is for the Group permissions.
* The third set of three characters (rwx) is for the All Users permissions.


--
## Linux File Permissions
### Changing permissions and owner
* `chmod permission filename`
  * r = 4
  * w = 2
  * x = 1
  * -R for recursive
* `chown owner:group filename`

```
user@servername:~$ chmod 600 README.md
user@servername:~$ chown calle:student README.md
user@servername:~$ ls -l
drwxr-xr-x  8 jacob  staff   272 Apr 27 15:49 Admin
-rw-------  1 calle  student 162 Apr 27 12:55 README.md
drwxr-xr-x  3 jacob  staff   102 Apr 27 13:17 Students
drwxr-xr-x  4 jacob  staff   136 Apr 28 10:15 libs
-rw-r--r--  1 jacob  staff    49 Apr 28 13:33 newUsers.csv
```
<!-- {_style="margin: 0px; width:65%"} -->


--
## Windows Permissions
* Directory permissions:
  * Read
  * Write
  * List Folder Contents
  * Read & Execute
  * Modify
  * Full Control
* File permissions:
  * Read
  * Write
  * Read & Execute
  * Modify
  * Full Control


--
## Windows Permissions
### Directory permissions
![NTFS directory permissions](./images/windows-directory-permissions.png)


--
## Windows Permissions
### File permissions
![NTFS File permissions](./images/windows-file-permissions.png)


--
## Windows Permissions
* Inheritance:
  * NTFS permissions are inherited by default down to the underlying directories and files
  * You can block inheritance
* Blocking of inheritance:
  * Copy
    * Allows you to copy the existing permissions from the parent folder, but allows no future changes
  * Remove
    * Allows you to delete the permissions inherited from the parent folder
    * You can explicitly set the permissions you want the file or subdirectory

<!-- {_style="width:65%"} -->


--
## Windows Permissions
* Access Control List (ACL):
  * An ACL is saved for each file and directory on an NTFS volume
  * Contains a list of all user accounts, groups, and computers that have access to the file or directory
  * Describes the type of access that user accounts, groups, and computers
  * The ACL must contain an Access Control Entry (ACE) for the user account, group, or computer that the user belongs to access the file or directory
  * User accounts that are not on the ACL list is implicitly denied access to the file or directory
  * Users who are denied access in the ACL list is explicitly denied access to the file or directory

<!-- {_style="width:65%"} -->


--
## Windows Permissions
### Access Control List
![NTFS ACL](./images/windows-acl.png)


--
## Windows Permissions
What happens with the permissions when you move or copy files and directories?

![Permission move or copy](./images/permission-move-copy.png)
<!-- {_style="width:800px"} -->


--
## Windows Permissions
### Changing Permissions

![windows-permission-gui-basic](./images/windows-permission-gui-basic.png)


--
## Windows Permissions
### Changing Permissions

![windows-permission-gui-advanced](./images/windows-permission-gui-advanced.png)


--
## Windows Permissions
### Changing Permissions

![windows-permission-gui-advanced-add](./images/windows-permission-gui-advanced-add.png)
<!-- {_style="width:800px"} -->


--
## Windows Share
* Shared directories
  * you can make resources available to others by sharing
  * on FAT partitions, you can only set permissions on the shared directory
  * on NTFS volumes, you can set permissions on both the distributed directory and the files in the directory

<!-- {_style="width:65%"} -->

![windows-share](./images/windows-share.png)
<!-- {_style="width:600px"} -->


--
## Windows Share
### Share permissions
![windows-share-permissions](./images/windows-share-permissions.png)


--
## Role-based Access Control
* Do not assign permissions directly to individual user accounts
* Individuals acquire access through their roles within an organization

<br />
### Active Directory AGDLP
![active-directory-agdlp](./images/active-directory-agdlp.png)


---
## Firewall
![firewall-security-zones](./images/firewall-security-zones.png)
<!-- {_style="width:900px"} -->


--
## Firewall
### Ring 1 - Internet Edge
* The first attack point
* Being exposed to attacks from outside
* Common mistakes
  * Many places the most intelligent and powerful firewall
  * Most attacks occur from inside the network
* Speed is crucial
  * Usually a high performance hardware firewall


--
## Firewall
### Ring 2 - Backbone Edge
* Between the internal network and the Internet Edge
* Backbone networks are providing a common network that all network segments are connected to
* Total volume of traffic flowing in and out through the backbone Firewall is smaller than that of the Internet edge firewall
* Begins the real firewall work through dynamic application layer filtering of both inbound and outbound traffic

<!-- {_style="width:65%"} -->


--
## Firewall
### Ring 3 - Asset network edge
* Packet filtering is insufficient
* Not only examine all incoming traffic with profound dynamic packet filtering, but also examine the output of user/group control.
* User/group control is an absolute requirement:
  * You must be able to log the user name for all outgoing
  * You must be able to log an application
  * Your organization may be held responsible for material that leaves the network

<!-- {_style="width:65%"} -->


--
## Firewall - Ring 4 - LocalHost security
* Computer-based security is the last defense.
* No firewall can completely offset the weaknesses that exist on your computer.
* The only thing that can prevent attacks from the local network.
* The connection between a computer and network
* Check the inbound/outbound connections that can be made and which applications can send and receive data.
* Antivirus should be used to block viruses from other networks
* Operating systems and applications must be kept updated
* Anti-Spyware, -Spam, -adware
* Users and services should be run with minimal permissions

<!-- {_style="width:70%"} -->


--
## Firewall
### Smaller networks
* Simple networks does not need all rings
* Public services should be located in the DMZ segment between the Internet edge and  Asset edge
* The simplest networks only need to place a single firewall at the Internet edge
  * Do not forget about Localhost security

<!-- {_style="width:70%"} -->


--
## Demilitarized Zone (DMZ)
* A network that is placed as a neutral zone between a corporate network and the Internet.
* Prevents outside users from getting direct access to the internal corporate network.
* Includes the company's external/public resources:
  * Web servers
  * Public Name servers
  * E-mail
  * FTP
* If a DMZ is penetrated the attacker won't get access to information on the internal network.

<!-- {_style="width:70%"} -->
