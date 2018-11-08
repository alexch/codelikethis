# Browsers - what do they do?

* A web browser is a computer application that reads files. When entering a **domain** (ex. https://www.facebook.com) into the URL bar in a browser, the browser requests information in the form of a file associated with the URL input. 
* Your browser renders code in the form of a website. 

# Request - Response

* HTTP stands for **Hypertext Transfer Protocol**. 
* In a nutshell, an HTTP request is sent by the **client** (a browser), which is used to locate information in the form of a file. * This file contains code, which tells your browser how, and what, to render. 
* A web server responds to this request, by telling the browser where the file lives. 

![HTTP Request](./http_request.png "HTTP Request") (via <https://betterexplained.com/>)

# HTTP Methods

HTTP is a protocol that allows clients to communicate with web servers, and is a primary underlying infrastructure of the Internet. The two most common HTTP methods are:

* GET
* POST

When a URL is inputted, the browser sends a GET request to a web server. When a form is submitted on a website, a POST request is submitted, and the browser hands off the form data to be handled by the web server. 

# DNS - How it works!

* DNS stands for Domain Name System
* This is a standardized way for a browser to know **where** your website lives. 
* Your browser communicates with a **nameserver**, which tells your browser the IP address of where the files for your website are located. 
* Information on your nameservers are known as **DNS Records**. 

![DNS illustration](https://s.hswstatic.com/gif/dns-rev-1.gif "DNS Illustration")

Remember, websites live at an **IP Address**. This is a string of numbers, (ex. 70.42.251.42). A URL is simply a translation that provides humans with an easy way to remember where a website lives. It is important to remember however, not all websites can be accessed by their IP address. This can be due to security, or other reasons. 

# Other DNS Info

Your nameservers may also contain other information about your domain, such as where your email server lives. For example, if I try to send an email to mark@facebook.com, your email server is going to communicate with the nameserver for facebook.com and say, "Where does this email server live?". 

# HTTP: File Transfer for the Web

* HTTP: HyperText Transfer Protocol
    * Invented in ~1991 by Tim Berners-Lee as part of the World Wide Web
    
    * Uses TCP/IP: Internet Protocol
    
    * see [A Brief History of HTTP](https://hpbn.co/brief-history-of-http/)

* Essentially, HTTP is a file transfer protocol
  * every HTTP response contains a *body* which is often the raw, complete contents of a file
  * these files can be images, sounds, data, or code

# Examples of Web Code

Web code can be any language used to create web pages or applications. Common examples of these are

* HTML
* CSS
* JavaScript

The above languages run *inside* the web browser (aka "the client side"). On the server side, there is a lot more variation. You may encounter...

* PHP
* Ruby
* Python

For now, we are going to focus on **HTML and CSS**. This is the most common codebase used for creating webpages, and what is used for virtually all websites. 

# HTTP 0.9 (1991)

* **very** simple protocol, geared towards ease of use and implementation
* **100%** ASCII characters in and out
* Human readability was a goal
* **stateless* meaning "one request, one response, and close"

# HTTP 0.9 protocol

| Step                | Client                    | Server            |
|---------------------|---------------------------|-------------------|
| open connection     | `telnet example.com 80`   |                   |
| request a resource  | `GET /index.html` &#9166; |                   |
| return the resource |                           | `<html><body>...` |

# HTTP 1.0 (1993-1996)

* same basic idea as HTTP 0.9, but with
  * a version identifier
  * request headers
  * response status line
  * response headers

# HTTP 1.0 protocol

| Step               | Client                              | Server                                                 |
|--------------------|-------------------------------------|--------------------------------------------------------|
| open connection    | `telnet example.com 80`             |                                                        |
| request a resource | `GET /index.html HTTP/1.0`  &#9166; |                                                        |
| request headers    | `User-Agent: Dogscape 1.0` &#9166;  |                                                        |
| blank line         | &#9166;                             |                                                        |
| response status    |                                     | `HTTP/1.0 200 OK`                                      |
| response headers   |                                     | `Content-Type: text/html` <br> `Content-Length: 12340` |
| blank line         |                                     | &#9166;                                                |
| response body      |                                     | `<html><body>...`                                      |

# HTTP 1.0 details

* Request and (part of) Response are still ASCII
* `Content-Type` header allows different file types
  * reused **MIME**: (Multipurpose Internet Mail Extensions) spec for file type names
* `Content-Length` header so the client knows how big a file to expect
* ...and many more headers to help clients and servers work together

# HTTP telnet example

`telnet` is the original program for connecting to other computers on the Internet. 

> Unfortunately, many modern OSs don't ship with a working version of `telnet`, so you should watch your instructor's terminal, or skip ahead to the next slide.

```
$ telnet google.com 80
```

That opens a connection to one of Google's many web servers. 

In HTTP, the client starts the conversation, so type this and hit <kbd>Enter</kbd>:

```
GET /
```

then the server replies with an HTTP response!

# Telnet Screenshot

![telnet screenshot](./telnet-google.png)

