
# Server Vs. Client
While most of the coding syntax is similar between the server and client, there are some significant differences as well.

Client and Server side:

- have different roles and responsibilities
- run inside of different operating environments 
- often don't use the same programming language (except JavaScript!)

# The Client/Server Model

![client/server](https://developer.mozilla.org/files/4291/client-server.png)


* The **client** is any part of your web app that the user might interact with, or at the very least have access to. These include:
  * web pages
  * forms
  * Images
  * Interactive elements
* The **server** listens for requests from the client, and sends responses
  * mostly just listeners and rules
  * runs in a node.js environment if JavaScript


# Client-Side Code
Client-side code is primarily concerned with the appearance and functionality of a rendered web page. This would include:

- form validation
- selecting UI components
- creating layouts
- nav bars
- DOM manipulation

Client side is often referred to as the **frontend**, although they mean slightly different things.

**Frontend** often refers to a general "realm" of web development, whereas **client** explicitly refers to an end user's machine and experience. 

# Server-Side Code
Server-side code is mostly involved in choosing which (or what) kind of information is send back to the browser as part of the response, after receiving a request. This would include:

- validating form submissions
- saving, updating, deleting, or reading from a database
- running logic based upon the request
- returning a web page and its resources (static)
- creating and returning a web page *dynamically* (when the content changes over time)

Can be written in many programming languages, like PHP, Python, Ruby, and NodeJS(JavaScript!)
Server side is often referred to as the **backend**, although they mean slightly diferent things.

**backend** often refers to the general "realm" of web development that exists separate from the client-side, and **server** explicitly refers to the hardware and software that are explicitly making that happen. 
