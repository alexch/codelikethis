# Routing

*routing* in web apps is essentially a set of rules to decide...
  * given this request
  * what code do we run?
  
the "code we run" is also called an *endpoint* or a *route* or a *script* or a *handler*...

# Routing is simple

Many web app server frameworks have complicated systems for routing but that complexity is not required

Routing can be a simple series of `if..else` statements, or a [`switch` statement](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/switch) 

And most of the fancy framework code is simply to build up a list of matching rules which the server then walks through in first-to-last order.

# Let's build a 