## Examination 1

These are the instructions for the first examination report. In the report you will present your findings when working with [Wireshark](https://www.wireshark.org/) to analyze a number of files containing captured network traffic. 

### Analyzing the capture files

The files you will work with can be found in this [ZIP archive](https://cdn.rawgit.com/1dv031/syllabus/master/examination/part_1/captures/capturefiles.zip). Each file contains some communication to be analyzed.

For each file, try to answer the following questions:

1. What protocols are used in the communication?
2. At what layer of the OSI (or TCP/IP) model do they operate?
3. What RFC(s) (if any) will help us learn more about this protocol?
4. What is the purpose of the protocol?
5. Who are the communicating parties at each layer (focus on addresses)?
6. How are they related to one another?

<br />
As for a more in-depth analysis of each file, use Wireshark functions to answer the following questions:

1. How many packets were exchanged?
2. How much data was sent?
3. What was the average packet size?
4. How much data did each communicating party send?
5. Can we see/reconstruct the communication to gain any knowledge about its content/data?

<br />
Hint: You will find useful functions in the menus under "Analyze" and "Statistics". For more information about Wireshark you can try [the user guide](https://www.wireshark.org/docs/wsug_html_chunked/) or look around at the web site, [wireshark.org](https://www.wireshark.org/), where you also can download Wireshark.

## The report
To present your findings from above you will produce a report **in PDF-format** and publish it in your gitlab repository.


### Content of the report

1. The first part should be an introduction to the text. Here you present the theme of the report in a way that captures the reader and makes her/him want to continue reading. Remember that the person examining your report might have read 10-15 report before s/he comes to yours - how do you make your report stand out?!

2. Once the introductions are over you should go into detail about how you went about your work. Present your findings for each capture file in a way that the reader easy could get the result of the above questions. 

3. Also present what did you do to find the answers? Here you can present central tools, references and descriptions of your methods and your rational behind choosing them.

4. Also answer the below questions:
  1. Explain the TCP/IP-model. What it is, how it it used and why it is important to understand. (ca. 200 words)
  2. Describe the difference between TCP and UDP. In what cases do we use UDP - and why? (ca. 200 words)
  3. Explain the difference between HTTP and HTTPS. What is SSL and TLS and in what other cases are they used? (ca 300 words)
  4. What is DNSSec? (ca 200 words)
  5. Explain what network segmentation means (ca 300 words)

5. In this last part you present what you have learned from working with this examination.

### Some tips

* Use spell check! And if possible grammar check!
* Remember: this is a story even if the form is not that of a fairy tale or a novel. Think about your narrative and style!
* Read it out loud. If it is hard for you to read, it is probably hard for someone else.
* Let some else read it and get their feedback on the content, the language and the narrative.
* Keep within the limits!
* Make sure to make references to the course literature and any other literature that is relevant for your topic.
* Use a [recognized system](https://lnu.se/en/library/Writing-and-referencing/referencing/) ([SWE](https://lnu.se/ub/skriva-och-referera/skriva-referenser/)) for incorporating references in your text.
* We will run your report through the anti plagiarism system Urkund. **Do not copy text from other student's reports nor from any other documents!**

