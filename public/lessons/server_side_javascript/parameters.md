# Many Ways To Pass Parameters

in HTTP

* on the Path
  * (between the hostname and the `?`)
* in a GET request's "query" section
  * (after the `?`)
* in a POST request in query param format
  * (inside the request body)
* in a POST request in JSON format
  * (inside the request body)

# For Example...

Let's imagine four different ways to send the same information to GitHub.com:

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

`http://github.com/BurlingtonCodeAcademy/til/blob/master/README.md`

path parameters are great for making *legible URLs*

your URL is part of your user interface; treat it like the address of a resource, not as a call to a function


# REST area

The concept of "path parameters" is central to an idea called REST.

It argues that people designing web applications should consider their apps URLs to be an essential part of their app's design and functionality, and that those URL paths should follow a convention that exposes parts of the app as *resources* that can be identified and interacted with individually using a common set of *methods* (that happen to be more or less the same as the HTTP methods).

(There is a lot more to learn about REST but at least now you know roughly what it means.) 

# Query Parameters

(aka search params / GET params)

`github.com/file?user=BurlingtonCodeAcademy&repo=til&section=blob&branch=master&filename=README.md`


# Post Parameters

POST params:

```
POST /file HTTP/1.1
Host: localhost
Content-Type: application/x-www-form-urlencoded

user=BurlingtonCodeAcademy&repo=til&section=blob&branch=master&filename=README.md
```

# Post Body as JSON

this is the simplest way to understand, but it's not standard, so you may have to write more code to do it

```
POST /file HTTP/1.1
Host: localhost
Content-Type: application/json

{"user":"BurlingtonCodeAcademy","repo":"til","section":"blob","branch":"master","filepath":"/README.md"}
```

# Summary: GET vs POST

remember, HTTP defines several *methods* (GET, POST, PUT, HEAD, etc...)

GET requests

 - Query Parameters are in the URL, after the `?`
 - format: `name=value&othername=othervalue`
 - plus weird escaping rules (percent-encoding and space-to-plus)

POST requests

 - Post Parameters are in the *body* of the request
 - Usually in the same `name=value&` format
 - Can also be big file uploads, or a JSON format payload, or others

# Parsing Parameters

Your app server framework (Express) will convert query or post params into an object for you, but it's not hard to do yourself.

Here's a small function that parses any string in "query parameter" (aka "URI Encoded") format, either from the `?` part of the URL, or the body of a request:

```javascript
function decodeParams(query) {
  if (query.startsWith('?')) {
    query = query.slice(1);
  }

  let fields = query.split('&');

  let params = {};
  for (let field of fields) {
    let [ name, value ] = field.split('=');
    value = value.replace(/\+/g, ' ');
    params[name] = decodeURIComponent(value);
  }

  return params;
}
```

(Note that the above function assumes each parameter can only have one value; in HTTP it's possible for the client to pass several parameters with the same name, causing headaches for server API designers.)
