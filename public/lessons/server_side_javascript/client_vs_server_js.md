# The Structure of the Internet

<!--Picture of server requests pinging around -->

# The Client/Server Model

* The **client** is any part of your webapp useable by your end users
  * web pages
  * forms
  * Images
  * Interactive elements
* The **server** listens for requests from the client, and sends responses
  * mostly just listeners and rules
  * runs in a node.js environment

# Using Plugins

Plugins, and libraries like Live Server, and node-static provide an easy way for you to get a site up and running fast.

* Pros:
  * easy to setup
  * inbuilt tools

* Cons:
  * Opaque
  * Best for local development only

# Server Side JavaScript

Server Side JS runs in a node environment, and is a set of rules to determine *what happens* when we get a certain *request* to a specific *route*

e.g. **When** you have a `GET` request to `/` **Send** the `index.html` file to the browser

# Structuring Your Directory

<!--Image goes here. Boxes in boxes-->

# Core Concept: the Public Directory

The directory that contains the files needed for the client side of your web app is often named "public"

* naming convention assumed by some libraries
* contains subdirectories for different file types
  * images
  * JS
  * CSS
* HTML files live directly in in the "public" folder

# Is there a special syntax for server side JS?

* No, but...
* Different frameworks have their own ideas about how a server *should* be set up
* Slightly different than client side JS
  * different methods to import external files
  * module/global (nodeJS) v. document/window (browser JS)