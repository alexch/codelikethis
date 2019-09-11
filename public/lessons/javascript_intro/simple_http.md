# HTTP

Let's lift the hood and check out the engine that makes the World Wide Web run.

# Browsers - what do they do?

* A web browser is a computer application that reads files. 
* When entering a **URL** (ex. https://www.facebook.com) into the address bar in a browser, the browser requests information in the form of a file associated with that specific URL.
* Your browser renders code in the form of a website.

# Request - Response

* HTTP stands for **Hypertext Transfer Protocol**. 
* In a nutshell, an HTTP request is sent by the **client** (a browser), which is used to locate information in the form of a file. 
* This file contains code, which tells your browser how, and what, to render. 
* A web server responds to this request, by telling the browser where the file lives. 

![HTTP Request](/lessons/www/http_request.png "HTTP Request") (via <https://betterexplained.com/>)

# HTTP Methods

HTTP is a protocol that allows clients to communicate with web servers, and is a primary underlying infrastructure of the Internet. The two most common HTTP methods are:

* `GET`
* `POST`

When a URL is inputted, the browser sends a `GET` request to a web server. When a form is submitted on a website, a `POST` request is submitted, and the browser hands off the form data to be handled by the web server.

(There are several more [HTTP Methods](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods) but GET and POST are used for 99.99%+ of Web traffic.)

# DNS

* DNS stands for Domain Name Service
* This is a standardized way for a browser to know **where** your website lives. 
* Your browser communicates with a **nameserver**, which tells your browser the IP address of where the files for your website are located. 
* Information on your nameservers are known as **DNS Records**. 

![DNS illustration](https://s.hswstatic.com/gif/dns-rev-1.gif "DNS Illustration")

Remember, websites live at an **IP Address**. This is a string of numbers, (ex. 70.42.251.42) that locates a specific computer (or "host") on the Internet. A domain name is simply a translation that provides humans with an easy way to remember where a website lives.

# Other DNS Info

Your nameservers may also contain other information about your domain, such as where your email server lives. For example, if I try to send an email to mark@facebook.com, your email server is going to communicate with the nameserver for `facebook.com` and say, "Where does this email server live?". 
