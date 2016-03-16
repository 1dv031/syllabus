<!-- HERE STARTS THE ACTUAL LECTURE -->
## This is a three part lecture

* Who is who?
* The OSI model
* Some TCP/IP protocols


---

## Part 1: Who is who?
### in (computer) communication

* Some Latin to get us started
* Some important words (with Latin roots)
* A general communication system


--

### Some Latin to get us started

* communicato
* informatio
* caudex
* medium
* datum (datus)


--

### An example with humans (and a cat)

![Lion or a cat?](images/lion-and-cat.png)

What is <em>communication</em>, <em>information</em>, <em>code</em>, <em>data</em> and <br />a <em>medium</em> in this picture?

<!-- {_style="font-size: 75%;"} -->


--

### Some important words (I)

* message
* source
* destination


--

### The same example again

![Lion or a cat?](images/lion-and-cat.png)

What is the <em>message</em>, who is the <em>source</em> and who is <br />the <em>destination</em>?

<!-- {_style="font-size: 75%;"} -->


--

### Some important words (II)

* transmitter
* signal
* channel
* noise
* receiver


--

### The same example (yet) again

![Lion or a cat?](images/lion-and-cat.png)

What is the <em>transmitter</em>, <em>channel</em>, <em>signal</em> and <em>receiver</em>?<br />Can we identify any <em>noise</em>?

<!-- {_style="font-size: 75%;"} -->


--

### A schematic diagram of a general communication system

![Shannon's schematic diagram of a general communication system](images/homebrewed-shannon-model.png)

Source: Shannon, C. E., "A mathematical theory of communication", in <em>Mobile<br />computing and communciations review</em>, volume 5, issue 1, 2001, page 3.

<!-- {_style="font-size: 50%;"} -->


--

### Closing note: A few modes of communication

* Unicast
* Broadcast
* Multicast
* Anycast


--

### Identify the modes

![Broadcast](images/broadcast.png)&nbsp;&nbsp;&nbsp;
![Multicast](images/multicast.png)
<!-- {_style="margin-left: 20px;"} -->

![Unicast/Anycast](images/unicast.png)
<!-- {_style="margin-left: 165px;"} -->


---

## Part 2: The OSI model

### The open systems interconnection<br />basic reference model<br />ISO/IEC 7498-1:1994(E)


--

### What is the OSI model?

* Conceptual 7 layer model
* Defines different aspects of computer communication
* Entities at one level communication with entites at the corresponding layer at the other end


--

### The (empty) model

![Empty OSI model](images/OSI-eNo.png)


--

### Vertical interaction between layers

![Vertical interaction in the model](images/OSI-v.png)


--

### Horizontal interaction between layers

![Horizonatl interaction in the model](images/OSI-h.png)


--

### Question about basic needs

![Two computers that need to communicate](images/2-computers-and-cat.png)

What is the first thing we need<br /> for this communication to work?


--

### The answer is in the first layer

![OSI model: Physical layer](images/OSI-1.png)


--

### Next we need to control the medium

![OSI model: Data link layer](images/OSI-2.png)


--

### Some (fun) data link stuff

* CSMA/CD
* CSMA/CA
* MAC addresses
* Ethernet frames

![Two computers linked by a medium](images/2-linked-computers.png)


--

### How do we solve this problem?

![Two computers and a cloud](images/2-computers-and-cloud.png)
<!-- {_style="padding-top: 2em"} -->


--

### We add a new layer

![OSI: Network layer](images/OSI-3.png)


--

### Fun stuff found in the network layer

* Routing protocols
* End-to-end encryption
* IP addresses

<!-- {_style="font-size: 80%"} -->

![Two computer linked by a medium](images/2-linked-computers.png)

1. Do we use network layer stuff here?
2. Do we need network layer stuff here?

<!-- {_style="font-size: 50%"} -->


---

## Part 3: Some TCP/IP protocols
