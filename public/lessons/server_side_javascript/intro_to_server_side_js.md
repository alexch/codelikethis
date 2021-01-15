# Overview
Welcome to the server-side! In this slide deck, we will be covering the basic aspects of servers, like what they are and how they relate to your viewing web pages! 

# What is a server?
*Server* is a term that refers to both hardware and/or software. It is used to define the relationship between the computer a user is interacting with (client) and the distinctly different environment that said user will request information from. 

## When dealing with hardware, it: 

- is an ordinary computer
  - *usually* elsewhere
  - can be the same computer!
- stores the software that defines behavior
- contains the components for a website
  - JavaScript files
  - HTML
  - CSS stylesheets
  - Images

## When dealing with software, it:

- understands URLs (AKA web addresses)
- listens for a *protocol** request
- responds to request
- sends response through a *protocol* response

# Requests
Servers have uniquely defined rules that determine how they will respond based on a request.

## The request:

- is sent from the *client* (most often a web browser)
- is sent to the server via protocol (like HTTP)
- should be intentional and explicit
- can contain information from a user's input
- can be used to:
  - update a database
  - navigate a website
  - retrieve information
  - and more!

# Responses
Servers have uniquely defined rules that determine how they will respond based on a request.

## The response:

- is sent by the server
- sends information back to the *client* (most often a web browser)
- is typically determined by the request received
- may carry out an action based on the request
- contain a status code for general information
  - 200 is `OK`
  - 404 is `Not Found`
  - [and more...](https://http.cat/)

# Headers
When requests and responses are sent between server and browser, additional information is included in *headers*

The header can be loosely categorized based on its context: **request, response, or general**

- **request headers** 
    - contain information about the client (requester), or what the request is expecting.
- **response headers** 
    - contain details about the response, like server location and time.
- **general headers** 
    - can be included in both request and responses, but provide no info based on what information is contained.

# Server-side programming
"Server-side" is meant to describe everything that happens in between a request and a response. 

## Server-side code:

- is used to deliver information efficiently
- is used to keep things secure
- is versatile
- is not visible to the *client* (most often a web browser)
- can be written in a number of programming languages!

# Server Environment

All code needs to run in some sort of environment, which affects the syntax, and options available to you.

When we are doing DOM Scripting, working with React, or otherwise doing *client-side* coding we are working in the browser's environment

*Server-side* JavaScript generally runs in a Node environment

# Welcome Back Node!

If Node.js sounds familiar, that's because we started this course programming in a Node environment!

# Differences Between Node and the Browser

* Global Objects
  * `global` v. `browser` or `window`
* Import/export methods
  * `require` v. `import`

# Server and Client

The Server and Client sides to your application have separate, but related jobs, and each is useful for specific things.

* Client Side:
  * Directly interactive
  * Presents Data to users
  * Sends requests to the server
  * Not secure, all data/code is available through the browser
  * Options depend on browser

* Server Side:
  * Listens for requests from the client, and sends back responses
  * Not directly accessible from the Client
  * Secure
  * Consistent

Together they make a full stack application

# Structuring your Directory

When creating a full stack application, your server file should live at the root level of your project, while all the client side code should live in a dedicated subdirectory; often called `client` or `public`

![directory file structure](/images/basic-server-structure.png)

# Setting up Your Client with React

`create-react-app` can be used to easily generate a React front end for your application.

* Create a project directory
* Inside that directory run `npm init -y`
* Install any server dependencies, and create your server file
* Still inside the directory run `npx create-react-app client`
* Now you have a React front end!

![React server example](/images/client-closed.png)

![React server example](/images/client-open.png)

# React Caveats

When using a React front end there are a couple things to keep in mind

* React is a single page web App. All user facing routes should return the `index.html` file
* `create-react-app` creates a git repo. Git does not like it when you try to put repos in repos
  * run `rm -rf .git` from inside `client` to remove the interior repo otherwise git will have issues
* React has `production`, and `build` versions. You generally want to serve the `build` version
  * If you need to have the production version talk to your server you will need to [proxy the requests from React](https://create-react-app.dev/docs/proxying-api-requests-in-development/)
  * And you will need to have React's production server, and your custom server running at the same time

# Resources

* [Introduction to the Server Side](https://developer.mozilla.org/en-US/docs/Learn/Server-side/First_steps/Introduction)
* [What is a web server?](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_is_a_web_server)
* [Medium Post](https://medium.com/@BaaniLeen/web-development-series-intro-to-server-side-scripting-fe5626323f92)
