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

* [`express.urlencoded`](https://expressjs.com/en/4x/api.html#express.urlencoded) parses incoming requests with URL-encoded payloads
* [`express.json`](https://expressjs.com/en/4x/api.html#express.json) parses incoming requests with JSON payloads

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
