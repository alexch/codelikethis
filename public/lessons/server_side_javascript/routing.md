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
  * `*` "zero or more of these"
  * `()` "these go together"

* ...but are *not* regular expressions

  * `.` and `-` are interpreted literally
  * `:` means "this is a parameter" (see next slide)
  * `*` means "zero or more characters" (which is `.*` in real regexes)

* ...or you can use *actual* regular expressions

        app.get(/.*fly$/, function (request, response) {
            response.send('I am some sort of fly')
        })

* for more info, see the full [Express Routing Guide](https://expressjs.com/en/guide/routing.html) on their web site

# Parameters in Express

Express provides several different "parameters" objects:

* `req.params` for *path parameters* (aka *route parameters*) signified with a `:` in the route matcher
* `req.query` for *query parameters* which appear after the `?` in the URL
* `req.body` for *post parameters* which appear inside the request body

# Path Parameters in Express

The special character `:` means "this is a [path parameter](./parameters#path_parameters)"

Express will grab the *value* from the path itself, and put it into the `request.params` object for you to use later

# LAB: Hello, Path Friend!

Change your "Hello, Express" server to have the following route:

```
app.get('/hello/:friend', (request, response)=> {
    response.send('Hello, ' + request.params.friend + '!')
});
```

Prove that it works by visiting <http://localhost:5000/hello/Gandalf> (or use your own name)

# Query Parameters in Express

For query parameters like `?season=winter&weather=cold`

Express will grab the *name* and *value* from the query string, and put it into the `request.query` object for you to use later

# LAB: Hello, Query Friend!

Now change your "Hello, Express" server to have the following route:

```
app.get('/hello', (request, response)=> {
    response.send('Hello, ' + request.query.friend + '!')
});
```

Prove that it works by visiting <http://localhost:5000/hello?friend=Gandalf> (or use your own name)

# Body Parameters in Express

Since request bodies can appear in several different formats, you need to use the correct *middleware* to extract them.

* [`express.json`](https://expressjs.com/en/4x/api.html#express.json) parses incoming requests with JSON payloads
* [`express.urlencoded`](https://expressjs.com/en/4x/api.html#express.urlencoded) parses incoming requests with URL-encoded payloads

Example (from [the express guide](http://expressjs.com/en/resources/middleware/body-parser.html)):

```javascript
// POST /login gets urlencoded bodies
app.post('/login', express.urlencoded(), function (req, res) {
  res.send('welcome, ' + req.body.username)
})

// POST /api/users gets JSON bodies
app.post('/api/users', express.json(), function (req, res) {
  // create user in req.body
})
```
