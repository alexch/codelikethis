# What is the DOM?

* DOM stands for **Document Object Model** 
* can be a bit tricky to wrap your head around. It is essentially an API that defines how your HTML document is accessed and manipulated. 
* In the strict definition of a DOM, your HTML file is the document, and the HTML elements are objects (or nodes). 
* A visual representation of the DOM can be seen by using the 'Inspect' feature of your browser. 

Please try this out right now, on this web page!

# Is the DOM Just My HTML?

* No, it isn't. :-)
* The DOM can appear similar or identical to the HTML that makes up your website. However, browsers can fix small syntax errors in your HTML automatically (such as inserting a missing close tag).
* The DOM is also kept up to date with the current state of the page, even if it is modified using JavaScript.
* Javascript **isn't actually _editing_ your document**. It is simply modifying the DOM. You can think of the DOM as an editable copy of your read-only website, which stays pristine on your server or filesystem.

# Unbreaking Your Code (Using the DOM)

With both HTML and CSS, it can be easy to forget a semi-colon or a closing tag, which can lead to unwanted display issues on your website. There are a few tools that can help prevent and/or fix this going forward. 

* Your Browser
* A Friend
* A Linter

# Debugging With Your Browser

Chrome can be one of the most useful tools for debugging HTML and CSS.

* Right clicking on an element in Chrome. You will see an option labeled 'Inspect'.
* An easy-to-read visual representation of your DOM will open, which can be modified and analyzed to track down any code that may be of issue.
* Both CSS properties and HTML elements can also be added, removed, or modified to determine their impact on specific elements of your web page. 

![Image of the chrome web inspection tool](https://developer.chrome.com/devtools/images/devtools-window.png "Chrome Web Inspector")

# Grab a Second Set of Eyes

Often staring at thousands of semi-colons and angle brackets can be overwhelming and mind-numbing. A second set of trained eyes can help to find that pesky character that is breaking your code. 

# What is a Linter?

* A program that assesses code in order to locate any possible errors

There are endless options for both HTML and CSS linters. A quick Google search will yield a number of potential websites and plugins to help debug your code. 

E.g. <https://validator.w3.org/>
