# Routing

*routing* in web apps is essentially a set of rules to decide...
  * given this request
  * what code do we run?
  
the "code we run" is also called an *endpoint* or a *route* or a *script* or a *handler*...

# Routing is simple

Many web app server frameworks have complicated systems for routing but that complexity is not required

Routing can be a simple series of `if..else` statements, or a [`switch` statement](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/switch) 

And most of the fancy framework code is simply to build up a list of matching rules which the server then walks through in first-to-last order.

# Let's build a blog!

Endpoints:

* `/` - home page
* `/articles` - list of all articles
* `/articles/1` - article with id 1

We haven't learned about databases yet, which is fine:

> the filesystem is a database 😮


# Home page is just a file

Our existing server code will handle a default home page; if we name it `index.html` then we're good.

# List of articles is a file plus an API call

Traditionally, a web server generates HTML "on the fly" in response to a web request.

A more modern app will send *static* HTML/CSS/JS, then *that* code will run on the client and make a *new* request for JSON data to fill itself in.

todo: code

# URL Path Parameters

to find article number

# URL Query Parameters

an actual search through the blog -- by keyword or date or something
