# HTTP: File Transfer for the Web

* HTTP: HyperText Transfer Protocol
  * Invented in ~1991 by Tim Berners-Lee as part of the World Wide Web

* Uses TCP/IP: Internet Protocol

* [A Brief History of HTTP](https://hpbn.co/brief-history-of-http/)

# HTTP 0.9 (1991)

* **very** simple protocol, geared towards ease of use and implementation
* **100%** ASCII characters in and out

# HTTP 0.9 protocol

|Step|Client|Server|
|---|---|---|
|open connection  |`telnet example.com 80`|
|request a resource |`GET /index.html` &#9166; |
|return the resource | |`<html><body>...`

# HTTP 0.9 example

This still works on google.com!

Type this:

```
$ telnet google.com 80
```

  * (on Windows 10 it's [a little complicated](https://social.technet.microsoft.com/wiki/contents/articles/38433.windows-10-enabling-telnet-client.aspx) to enable telnet but it does work eventually)

then you'll see this:

```
Trying 172.217.11.46...
Connected to google.com.
Escape character is '^]'.
```

then type this and hit enter:

```
GET /
```

then you'll see this:

```
HTTP/1.0 200 OK
Date: Sat, 07 Jul 2018 19:50:23 GMT
...

<!doctype html><html>...
```

# LAB: Simple Server

1. Launch your hello world server with `node index.js`
2. *In a separate terminal window*, run `telnet localhost 5000`
3. Type in `GET /` and hit the enter key *twice*
4. Look at the output. Is it what you expect? Why or why not?

# HTTP 1.0 (1993-1996)

* same basic idea as HTTP 0.9, but with
  * a version identifier
  * request headers
  * response status line 
  * response headers

# HTTP 1.0 protocol

|Step|Client|Server|
|---|---|---|
|open connection  |`telnet example.com 80`|
|request a resource |`GET /index.html HTTP/1.0`  &#9166; |
|request headers | `User-Agent: Dogscape 1.0` &#9166; |
|blank line |  &#9166; |
|response status     | | `HTTP/1.0 200 OK` |
|response headers    | | `Content-Type: text/html` <br> `Content-Length: 12340` |
|blank line          | |  &#9166; |
|response body      | |`<html><body>...` |

# Main points

* Request and (part of) Response are still ASCII
* `Content-Type` header allows different file types
  * reused **MIME**: (Multipurpose Internet Mail Extensions) spec for file type names
* `Content-Length` header so the client knows how big a file to expect
* ...and many more headers to help clients and servers work together

# Let's build a file server in NodeJS!

It'll be fun!

# Single File Server

```js
@@@js
var fs = require('fs');
var http = require('http');

var port = process.env.PORT || 5000;
http.createServer(function (request, response) {
  let contentType;
  var file;
  let data;

  file = 'index.html';
  try {
    console.log('Serving ' + file);
    data = fs.readFileSync(file);
    contentType = 'text/html'
  } catch (error) {
    console.log(error);
    data = "Error: " + error.toString();
    response.statusCode = 404;
  }

  response.setHeader('Content-Type', 
    contentType + '; charset=utf-8');
  response.write(data);
  response.end();
}).listen(port);

console.log("Listening on port " + port);
```

* TODO: move to a gist

# LAB: Single File Server

1. Type in the above server, and launch it with `node index.js`
2. *In a separate terminal window*, run `telnet localhost 5000`
3. Type in `GET /` and hit the enter key *twice*
4. Look at the output. Is it what you expect? Why or why not?

# Single File Server: important points

* the server only serves a single file, `index.html`, no matter what the client requests
* it uses the `Content-Type` header to tell the client that the file is in HTML format
* if there is an error loading the file, it sends the correct *status code* 
  * (404 means "File not found" although other errors are possibly more correct)

# Simple File Server

```js
@@@js
var fs = require('fs');
var http = require('http');

var port = process.env.PORT || 5000;
http.createServer(function (request, response) {
  let contentType;
  let file;
  let data;
  let path = request.url;

  if (path === '/') {
    file = 'index.html';
  }
  else {
    file = '.' + decodeURIComponent(request.url);
  }

  try {
    if (file) {
      console.log('Serving ' + file);
      data = fs.readFileSync(file);
      contentType = mime.lookup(file);
    }
  } catch (error) {
    console.log(error);
    data = "Error: " + error.toString();
    response.statusCode = 404;
  }

  response.setHeader('Content-Type', contentType + '; charset=utf-8');
  response.write(data);
  response.end();
}).listen(port);

console.log("Listening on port " + port);
```

# LAB: Simple File Server

1. Type in the above server, and launch it with `node index.js`
2. *In a separate terminal window*, run `telnet localhost 5000`
3. Type in `GET /index.js` and hit the enter key *twice*
4. Look at the output, especially the body and the `Content-Type` header. Is it what you expect? Why or why not?

# Simple File Server: important points

* the server *parses* the request path (e.g. `/index.js`) and uses it to locate a *file* on the server
* it uses the `mime` library to look up the file MIME type (e.g. `application/javascript`) from the file extension (e.g. `.js`)
* it uses the `Content-Type` header to tell the client that the file is in that format
* there is a **major** security hole in this server. Can you find it?

# Security Hole

* this server is *terribly* insecure
* any client can access *any* file on the server, simply by putting in a relative path
  * e.g. `GET ../../../etc/passwd` - the system password file
  * e.g. `GET ../yelpington/index.html` - files from a *different site* hosted on the *same computer*
  * e.g. `GET /index.js` - *server* code, not *client* code

> that's why most web servers use a `public` directory to store all publicly accessible files

# Fixing the hole

1. Create a *relative* file path from the request path
2. Create an *absolute* file path from the relative path
3. Make sure that file path is *inside* this site's `public` directory

TODO: code fix

# Simple Directory Server

New rule:

* when the user requests a *file*, we serve that file
* when the user requests a *directory*, we serve an *HTML page* that includes *links* to each file in that directory
  * aka an "index file" or "index.html"

TODO: code

