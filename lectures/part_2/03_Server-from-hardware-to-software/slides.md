<!-- Start -->
# Student interact during lectures
<!-- {_style="font-size:170%"} -->
* How to get feedback from distance students?
* How to ask questions?
* Did the student understand the lecture?

<!-- {_style="font-size:120%"} -->

http://trypingo.com
<!-- {_class="fragment"} -->


--
## What is a Server?
1. Computer program that provides services to other computer programs
2. The computer that a server program runs in
3. A software that awaits and fulfills requests from client software
<!-- {_style="margin-right: 30%;"} -->
4. A computer with specialized hardware
5. A service application working in the background

<!-- {_class="pingo-sc"} -->

![Pingo QR code](images/pingo-qr.png) [http://pingo.upb.de/321168](http://pingo.upb.de/321168)

<!-- {_class="pingo-qr"} -->


---
# Today's lecture
## Server - from hardware to software
1. Hardware
2. Operating system
3. Software

<!-- {_style="font-size:150%"} -->

Note:
These are the topics for todays lecture <br/>
We will disuse these from a **Server perspective** <br/ >
After the lecture we will meet up in a **group discussion** in Discord, **only for students**


---
## Which one is a Server?
1. &nbsp;
2. &nbsp;
3. &nbsp;
4. &nbsp;

<!-- {_class="pingo-sc" style="font-size:140%"} -->
![Pingo QR code](images/pingo-qr.png) [http://pingo.upb.de/321168](http://pingo.upb.de/321168)

<!-- {_class="pingo-qr"} -->

Note:
Which one is a Server?


--
## Basic components of a computer
* Input Unit
* Storage Unit
* Central Processing Unit (CPU)
  * Arithmetic and Logic Unit (ALU)
  * Control Unit
* Output Unit

<!-- {_style="font-size:100%"} -->

Note:
Before we can understand what makes these computers into a server we must know **what makes a computer**
http://www.byte-notes.com/five-basic-components-computer-system


--
## Basic components of a computer
### Input Unit
* Accepts/reads the list of instructions/data
* Converts this to computer acceptable format
* Supplies the converted instructions and data to the computer system for further processing

<!-- {_style="font-size:100%; margin-right: 25%"} -->

Note:
1. It **accepts (or reads)** the list of instructions and data from the **outside world**.
2. It **converts** these instructions and data in computer **acceptable format**.
3. It **supplies** the converted instructions and data to the computer system **for further processing**.


--
## Basic components of a computer
### Storage Unit
*or the primary/main storage*
* Receives instructions/data from input devices
* Intermediate results of processing
* Store these results before it's released to an output device

<!-- {_style="font-size:100%; margin-right: 30%"} -->

Note:

1. All the data to be processed and the instruction required for processing (**received from input devices**).
2. **Intermediate** results of processing.
3. **Final results** of processing **before** these results are released to an **output device**.


--
## Basic components of a computer
### Central Processing Unit (CPU)
* Responsible for all events inside the computer
* Controls all internal and external devices
* 2 major components
  * Arithmetic and Logic Unit (ALU)<!-- {_class="fragment"} -->
    * Actual execution of the instructions
    * Intermediate results are temporarily transferred back to the primary storage
  * Control Unit<!-- {_class="fragment"} -->
    * How the input device knows that it's time to feed data into the storage unit?
    * How does the ALU know what should be done with the data once it is received?
    * Way is it only the final results that are sent to the output devices and not the intermediate results?


<!-- {_style="font-size:100%"} -->

Note:
ALU is the place where the actual execution of the instructions take place during the processing operations.


--
## Basic components of a computer
### Output Unit
* Accepts the results produced by the computer
* Converts these coded results to human acceptable (readable) form
* Supplied the converted results to the outside world

<!-- {_style="font-size:100%; margin-right: 25%"} -->

Note:
1. It **accepts** the results produced by the computer which are in **coded form** and hence cannot be easily understood by us.
2. It **converts** these coded results to human acceptable (**readable**) form.
3. It supplied the converted results to the **outside world**.


--
## What makes a computer into a server?
* 24/7
  * reliable
  * redundant
  * hot swap
* Monitoring
* Management

<!-- {_style="font-size:100%"} -->

Note:
What makes a computer into a server?
Show these components


---
## Operating system
### What is an operating system?
* In the beginning:<!-- {_class="fragment"} -->
  > “Software controlling the hardware”
* Modern OS: <!-- {_class="fragment"} -->
  > “A layer between software and hardware”  

<!-- {_style="font-size:100%; width:100%"} -->


--
## Basic components of an OS
* Shell
* Process Manager
* Main-Memory Manager
* I/O Manager
* IPC Manager
* File System Manager


--
<!-- {_data-transition="fade-in fade-out"} -->
## Operating System Architecture
![Monolithic kernel architecture](images/Operating-Systeml-Architecture-Monolithic-kernels.png)

Note:
A monolithic kernel is an operating system architecture where the entire operating system is working in kernel space and is alone in supervisor mode. The monolithic model differs from other operating system architectures in that it alone defines a high-level virtual interface over computer hardware. A set of primitives or system calls implement all operating system services such as process management, concurrency, and memory management. Device drivers can be added to the kernel as modules.


--
## What is the big drawbacks with a Monolithic Kernel?
1. The kernel size increase
2. User code can easily get executed in the kernel
3. It is slow
4. Lack of extensibility
5. The bad maintainability

<!-- {_class="pingo-sc"} -->

![Pingo QR code](images/pingo-qr.png) [http://pingo.upb.de/321168](http://pingo.upb.de/321168)

<!-- {_class="pingo-qr"} -->

Note:
What is the big drawbacks with a Monolithic Kernel?


--
<!-- {_data-transition="fade-in fade-out"} -->
## Operating System Architecture
![Micro kernel architecture](images/Operating-Systeml-Architecture-Microkernels.png)


--
<!-- {_data-transition="fade-in fade-out"} -->
## Operating System Architecture
![Hybrid kernel architecture](images/Operating-Systeml-Architecture-Hybrid.png)


--
<!-- {_data-transition="fade-in fade-out"} -->
## Operating System Architecture
![Kernel architecture](images/Operating-Systeml-Architecture-all.png)
* User mode
  * no ability to directly access hardware or reference memory
  * delegate to system APIs to access hardware or memory
  * crashes in user mode are always recoverable
* Kernel mode
  * unrestricted access to the underlying hardware
  * execute any CPU instruction and reference any memory address
  * crashes in kernel mode are catastrophic

<!-- {_style="font-size:70%;"} -->


--
## Server OS vs. Desktop OS
* Server OS is configured for Background Tasks
* Some desktop versions can have limitations:
  * Memory
  * CPUs
  * NICs
* Built in Services
  * DNS
  * DHCP
  * Web server
  * Catalog Server
* Monitoring


---
## Software - Services
### Difference between an Application and a Services
<!-- {_style="font-size:120%;"} -->
* Service
  * Perform a single or a few specialized operations
  * Most often accessed by other programs
  * Targets part of a larger problem domain
  * Runs in the background
* Application
  * Perform a wide range of operations
  * Accessed by humans
  * Targets a whole problem domain


--
## What software type is a Server?
1. Application
2. Service
3. Both
4. None of the above

<!-- {_class="pingo-sc"} -->

![Pingo QR code](images/pingo-qr.png) [http://pingo.upb.de/321168](http://pingo.upb.de/321168)

<!-- {_class="pingo-qr" style="top:150px"} -->

Note:
What software type is a Server?


--
## Server software components
*


---
## The life cycle of a machine and its OS
![Evard's OS Life Cycle](images/OS-LifeCycle.png)

Note:
Evards, lit p. 42
https://www.usenix.org/legacy/publications/library/proceedings/lisa97/full_papers/20.evard/20_html/main.html
