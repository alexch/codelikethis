# Routing

*routing* in web apps is essentially a set of rules to decide...

  * given this request
  * what code do we run?
  
the "code we run" is also called an *endpoint* or a *route* or a *script* or a *handler* or...

# Routing is simple...

Many web app server frameworks have complicated systems for routing, but that complexity is not essential.

Routing can be a simple series of `if..else` statements, or a [`switch` statement](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/switch) 

and most of the fancy framework code is simply to build up a list of matching rules which the server then walks through in first-to-last order.

# ...but don't reinvent the wheel

Frameworks like Express give you more than the *implementation* of features like routing and parameter passing

they also give you an *interface* that will make **your** calling code easier to read

as well as a shared context of documentation and tutorials so other coders don't have as much to learn before understanding your code

# Express Routing

* supports handling all HTTP methods with the pattern `app.method(path, handler)`

* whenever an incoming request of the given *method* matches the *path* parameter, Express will invoke the *handler* callback function

# Express Routing Example

In the [Hello, Express](./hello_express) lesson we saw the following route:

```
app.get('/', (request, response) => response.send('Hello World!'))
```

This means, 

| code | explanation |
|---|---|
| `app` | my application, |
| `.get` | when the client does a `GET` request |
| `(request, response) =>` | will call this *handler* function with a *request* object and a *response* object |
| `response.send` | send a response |
| `('Hello, World')` | with this string as its body | 

# Express Route Matching Rules

* paths can include special characters that are *like* regular expressions

  * `?` "zero or one of these"
  * `+` "one of more of these"
  * `*` "zero or more" (but see below)
  * `()` "these go together"

* ...but are *not* regular expressions

  * `.` and `-` are interpreted literally
  * `:` means "this is a parameter" (see next slide)
  * `*` means "zero or more characters" (which is `.*` in real regexes)

* ...or you can use *actual* regular expressions

        // This route path will match butterfly 
        // and dragonfly, but not butterflyman
        app.get(/.*fly$/, function (request, response) {
            response.send('I am a fly')
        })

* for more info, see the full [Express Routing Guide](https://expressjs.com/en/guide/routing.html) on their web site

# Path Parameters in Express

The special character `:` means "this is a [path parameter](./parameters#path_parameters)"

Example:

```
Path: /hello/Gandalf
Route: /hello/:name
Params: {name: 'Gandalf'}
```

Express will grab the *value* from the path itself, and put it into the `request.params` object for you to use later.

# LAB: Hello, Path Friend!

Change your "Hello, Express" server to have the following route:

```
app.get('/hello/:friend', (request, response)=> {
    response.send('Hello, ' + request.params.friend + '!')
});
```

Prove that it works by visiting <http://localhost:5000/hello/Gandalf> (or use your own name)

# LAB: Hello, You!

Now add a new route

```
app.get('/hello/:you/from/:me', (request, response)=> {
    response.send(`${request.params.me} says, "Hello, ${request.params.you}!')
});
```

Does <http://localhost:5000/hello/Gandalf/from/Sauron> work? If not, why not?

(Answer on next slide.) 

# Route Matching is Top-Down

Remember, Express routes are a list of matching rules which the server then walks through in first-to-last order.

So if an early route matches, it wins... even if there's a more specific rule that also matches later in the list.

## Solution:

Put more specific rules above more general rules.

```javascript
app.get('/hello/:you/from/:me', (request, response)=> { ... 
});

app.get('/hello/:friend', (request, response)=> { ... 
});
```
