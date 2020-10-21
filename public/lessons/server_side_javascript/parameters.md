# Overview
When sending information to a server, like navigating the web is wont to do, it is important to understand a few things how that information can be sent. As with most things in programming, it isn't a one-size-fits-all approach. 

These are dependent upon the method, like GET or POST.

# Passing Parameters
You can pass parameters in a number of ways:

* on the Path
  * (between the hostname and the `?`)
* in a GET request's "query" section
  * (after the `?`)
* in a POST request in JSON format
  * (inside the request body)

# For Example...

Let's imagine three different ways to send the same information to GitHub.com:

```js
{
  user: "BurlingtonCodeAcademy",
  repo: "til",
  section: "blob",
  branch: "master",
  filepath: "/README.md"
}
```

# Path Parameters
path parameters are great for making *legible URLs*. Your URL is part of your user interface; treat it like the address of a resource!

This path:
`http://github.com/BurlingtonCodeAcademy/til/blob/master/README.md`

would match this route in `express`:
```js
app.get('/:user/:repo/:section/:branch/:filepath',(req,res)=>{
  console.log(req.params)
})
```

That is, if GitHub's server was a simple `express` app `;-)`


# Query Parameters

Query Parameters use the same URL slot as normal queries, but use a particular format to encode multiple parameters into a single string. This should sound familiar from our lesson on URLS.

`github.com/file?user=BurlingtonCodeAcademy&repo=til&section=blob&branch=master&filename=README.md`

This would be available to an `express` server like so:

```js
app.get('/?user=BurlingtonCodeAcademy&repo=til&section=blob&branch=master&filename=README.md',(req,res)=>{
  console.log(req.query)
})
```
This is admittedly a little convoluted to look at. You're sure to have seen it at some point, however, especially in search engines where the long strings of text can be handled by the browser.

# Post Parameters
The other HTTP method used for passing parameters is POST. POST is implicitly more secure, as the information isn't sent directly to the server through a super-visible URL. Instead, it is contained in a post *body* when the information is JSON formatted.

```
POST /file 

{"user":"BurlingtonCodeAcademy","repo":"til","section":"blob","branch":"master","filepath":"/README.md"}
```

assuming the proper middleware is in place, this information would be available in `express` like so:

```js
app.post('/file',(req,res)=>{
  console.log(req.body)
})
```

# Summary: GET vs POST

remember, HTTP defines several *methods* (GET, POST, PUT, HEAD, etc...)

GET requests
 - Query Parameters are in the URL, after the `?`
 - format: `name=value&othername=othervalue`
 - plus weird escaping rules (percent-encoding and space-to-plus)

POST requests

 - Post Parameters are in the *body* of the request
 - Can also be big file uploads, or a JSON format payload, or others

# Additional Concept: REST
The concept of "path parameters" is central to an idea called REST.

It argues that people designing web applications should consider their apps URLs to be an essential part of their app's design and functionality, and that those URL paths should follow a convention that exposes parts of the app as *resources* that can be identified and interacted with individually using a common set of *methods* (that happen to be more or less the same as the HTTP methods).

(There is a lot more to learn about REST but at least now you know roughly what it means.) 
