# What is the DOM?

DOM stands for **Document Object Model**, and can sometimes be a bit tricky to wrap your head around. It is essentially an API that defines how your HTML document is accessed and manipulated. In the strict definition of a DOM, your HTML file is the document, and the HTML elements are objects (or nodes). 

# Is the DOM Just My HTML?

No, it isn't. Often, the DOM can appear similar or identical to the HTML that comprises your website. However, browsers can fix small syntax errors in your HTML automatically (such as a missing tag), and your HTML can be modified using Javascript. However, the Javascript isn't actually _editing_ your document. It is simply modifying the DOM. You can think of the DOM as a translation of your website's code that allows for it to be modified. If some Javascript is rearranging elements on your page, you won't see these changes in the HTML docmuent, as the JS isn't actually editing your document. A visual representation of the DOM can be seen by using the 'Inspect' feature of your browser. 


# Unbreaking Your Code (Using the DOM)

With both HTML and CSS, it can be easy to forget a semi-colon or a closing tag, which can lead to unwanted display issues on your website. There are a few tools that can help prevent and/or fix this going forward. 

* Your Browser
* A Friend
* A Linter

# Debugging With Your Browser

I find Chrome to be just about the single most useful tool for debugging HTML and CSS. 

# Grab a Second Set of Eyes

dos ojos

#What is a Linter?

que es?