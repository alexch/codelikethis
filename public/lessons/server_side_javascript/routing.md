# Routing

*routing* in web apps is essentially a set of rules to decide...

  * given this request
  * what code do we run?
  
the "code we run" is also called an *endpoint* or a *route* or a *script* or a *handler* or...

The "code we run" doesn't have to be complicated. It could be as simple as sending a file.


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

* whenever an incoming request of the given *method* (POST, GET, DELETE...) matches the *path* parameter, Express will invoke the *handler* callback function

* That *handler* has access to the `request` and `response`, and the methods/properties they contain!


# Express Routing Example

In the [Hello, Express](./hello_express) lesson we saw the following route:

```js
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

# Parameters in Express

Express provides several different "parameters" objects:

* `req.params` for *path parameters* (aka *route parameters*) signified with a `:` in the route matcher
* `req.query` for *query parameters* which appear after the `?` in the URL
* `req.body` for *post parameters* which appear inside the request body


# Path Parameters in Express

The special character `:` means "this is a [path parameter](./parameters#path_parameters)"

Example:

```
Path: /hello/Gandalf
Route: /hello/:name
Params: {name: 'Gandalf'}
```

Express will grab the *value* from the path itself, and put it into the `request.params` object for you to use later.

# LAB: Hello, You!

Let's go back to our "Hello, Express!" lab and add another route.

* When you visit the path 'localhost:5000/hello/you/from/me'
* Then the webpage should display "Hello to you, from me."
* Where "you" and "me" are path parameters
* Format the names so that they are always capitalized
* 'localhost:5000/hello/gandalf/from/frodo' displays "Hello to Gandalf, from Frodo



```js
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

# Query Parameters in Express

For query parameters like `?season=winter&weather=cold`

Express will grab the *name* and *value* from the query string, and put it into the `request.query` object for you to use later

# Lab: Visualize It (Query Params)

In your `server.js` file, set up a route `/about`, that when visited,
prints `request.query` to the command line.

Then visit `http://localhost:5000/about?name=Bob&role=Instructor`

You should see the queries printing to the terminal

<details>
<summary>Solution</summary>
<div>

visit `http://localhost:5000/about?name=Bob&role=Instructor`

```javascript
app.get('/about', (request,response)=>{
  console.log(request.query) // prints {name:'Bob',role:'Instructor'}
})
```
</div>

</details>

# LAB: Hello, Query Friend!

Now change your "Hello, Express" server so if you visit the route `localhost:5000/hello?friend=Gandalf` (or any other name you want) it says "Hello, Gandalf!" (or whatever name you assign `friend` to)

<details>
<summary>Soluion</summary>
<div>

```js
app.get('/hello', (request, response)=> {
    response.send('Hello, ' + request.query.friend + '!')
});
```

</div>
</details>

# Middleware

Since request bodies can appear in several different formats, you need to use the correct *middleware* to extract them.

Simply put, middleware is code that:

* has access to the `request` and `response` objects 
* runs *before* the route itself is executed. 
* can be customized to suit your needs

**Request (GET/POST) => Middleware => Server => Response**

You've already used middleware without even knowing it!
In express, middleware is *mounted* with `app.use()` 

# Body Parameters in Express

`express` comes with a handful of *middleware* options right out of the box, one of which is `express.urlencoded()`, which parses the `request` body for you. 

That data will be available as `request.body`, much like `request.params` and `request.query`. 

The **difference** is that `request.body` doesn't come from the URL like `params` and `query` do.

Let's visualize it.


# LAB: Visualize It (Body Params)

In your `index.html`, add a form with the method of POST, like so:

```html

  <form action="/postroute" method="POST">
        <input type="text" name="first">
        <input type="text" name="last">
        <input type="submit" value="submit">
    </form>

```
In your `server.js` file, set up a route `/postroute`, that when the form SUBMITS,
prints `request.body` to the command line. Be sure to enter data to the form!

Note: add `express.urlencoded()` as *middleware* so the body (the form data, in this case) can be parsed and read by the server.

<details>
<summary>Solution</summary>
<div>


```javascript

app.use(express.urlencoded()) // passing {extended:true} as an argument will remove deprecation warnings

app.post('/postroute', (request,response)=>{
  console.log(request.body) // prints {first:'formValueField1', last: 'formValueField2'}
})
```
</div>

</details>

# LAB: Hello, Body Friend!

Now change your "Hello, Express" server so if you submit a form, the server will send back a greeting based on the submitted first and last name.

<details>
<summary>Soluion</summary>
<div>

```js
app.post('/post', (request, response)=> {
    response.send(`Hello, ${request.body.first} ${request.body.last}!`)
});
```

</div>
</details>

# Other Middleware

* [`body-parser`](https://expressjs.com/en/resources/middleware/body-parser.html) parses incoming request bodies. Very useful for reading form submissions!
* [`express.urlencoded`](https://expressjs.com/en/4x/api.html#express.urlencoded) parses incoming requests with URL-encoded payloads. **What we just used: based off of `body-parser`**
* [`express.json`](https://expressjs.com/en/4x/api.html#express.json) parses incoming requests with JSON payloads.
* [`express.static`](http://expressjs.com/en/4x/api.html#express.static) serves static files. Should look familiar.
* Tons of 3rd-party and error-handling options

Middleware can also be directly inserted into individual routes, so they only run in those specific cases. 

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

# Write your own middleware!

Remember how we said you can customize your own middleware? Give it a shot!

When doing so, that function will have access to the `request` and `response` objects, AND the callback function `next` that simply tells it to carry on with the route's execution.

Note: the names of these arguments does not matter, although `req` and `res` are often the convention.

```javascript
/* 
The request and response are sent to the middleware FIRST, and when next() is called, 
passed through to the route itself. They are expected in the order shown.*/

function logTime(req, res, next) {
    let date = new Date()
    console.log(date.toLocaleDateString()) 
    next()
}

app.get('/route/', logTime, (req,res)=>{
  res.send("All done!")
})

```

