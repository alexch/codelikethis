# Serving Files

# Let's build a file server in NodeJS!

It'll be fun!

Follow along by cloning <https://github.com/BurlingtonCodeAcademy/simple-server>


# Single File Server

```js
@@@js
let fs = require('fs');
let http = require('http');
const port = process.env.PORT || 5000;

http.createServer(function (request, response) {
  let contentType;
  let file;
  let data;

  file = 'index.html';
  try {
    console.log('Serving ' + file);
    data = fs.readFileSync(file);
    contentType = 'text/html'
  } catch (error) {
    console.log(error);
    data = "Error: " + error.toString();
    contentType = 'text/plain';
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
3. Type in `GET /` and hit the <kbd>Enter</kbd> key *twice*
4. Look at the output. Is it what you expect? Why or why not?

# Single File Server: important points

* the server only serves a single file, `index.html`, no matter what the client requests
* it uses the `Content-Type` header to tell the client that the file is in HTML format
* if there is an error loading the file, it sends the correct *[status code](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)* 
  * (404 means "File not found" although other errors are possibly more correct)
  
# Single File Server: Code Walkthrough

# Single File Server: Code Walkthrough 1

```javascript
let fs = require('fs');
let http = require('http');
```

loads required libraries "fs" (for filesystem access) and "http" (for fetching or serving files through HTTP).

```js
  file = 'index.html';
```

"the only file we will ever serve is named `index.html`"

# Single File Server: Code Walkthrough 2

```js
const port = process.env.PORT || 5000;
http.createServer(function (request, response) {
    //...
}).listen(port);
```

* creates a server that immediately starts listening on port 5000
* after each client request, it calls the anonymous function 
* inside the function...
  * the `request` object contains info about the request
  * the function can modify the `response` object to generate the response

# Single File Server: Code Walkthrough 3

```js
    data = fs.readFileSync(file);
```

`fs.readFile` is a NodeJS function in the `fs` library; it accepts a file path and returns an object containing that file's contents

`readFileSync` returns the object **immediately** (aka *synchronously* => *sync* suffix) 

but the standard `readFile` function returns it **eventually** by calling a callback function

(we'll keep using the *sync* versions because it makes the code easier to follow, but we could rewrite it to be asynchronous without too much effort)

# Single File Server: Code Walkthrough 4

```js
  try {
    data = fs.readFileSync(file);
    contentType = 'text/html'
  } catch (error) {
    console.log(error);
    data = "Error: " + error.toString();
    response.statusCode = 404;
  }
```

`try..catch` means "if anything goes wrong in the `try` block, then call the `catch` block with an object representing the error that just occurred"

In this case the only thing that can go wrong is while reading the file, so we set a *404 Not Found* status code on the HTTP response

and put the error message in the response body page

so the client has some clue as to what went wrong

# Simple File Server

Next let's allow the client to request more than one file.

In a URL, the `path` part maps nicely to a file path, so let's use it, like this:

|URL|path|file|
|---|---|---|
|http://localhost:5000/README.md   | /README.md | ./README.md |
|http://localhost:5000/public/favicon.ico | /favicon.ico | ./public/favicon.ico |

`./` ("dot slash") means "inside the current directory", which in this case is the directory the server is launched from.

# Simple File Server: Code

```js
@@@js
let fs = require('fs');
let http = require('http');
const port = process.env.PORT || 5000;
http.createServer(function (request, response) {
  let contentType;
  let file;
  let data;
  let path = request.url;

  if (path === '/' || path === '') {
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
3. Type in `GET /index.js` and hit the <kbd>Enter</kbd> key *twice*
4. Look at the output, especially the body and the `Content-Type` header. Is it what you expect? Why or why not?

# Simple File Server: important points

* the server *parses* the request path (e.g. `/index.js`) and uses it to locate a *file* on the server
* if there is no request path (e.g. `http://localhost:5000/`) then it defaults to `index.html`
* `decodeUriComponent` converts URLEncoded symbols
  * (e.g. converting `%2F` back into a `/` slash, or `%25` into a single percent sign)
* once it finds the file...
  * it uses the `mime` library to look up the file MIME type (e.g. `application/javascript`) from the file extension (e.g. `.js`)
  * it uses the `Content-Type` header to tell the client that the file is in that format

Most important point:

> There is a **major** security hole in this server. Can you find it?

# Security Hole

* this server is *terribly* insecure
* any client can access *any* file on the server, simply by putting in a relative path
  * e.g. `GET ../../../etc/passwd` - the system password file
  * e.g. `GET ../yelpington/index.html` - files from a *different site* hosted on the *same computer*
  * e.g. `GET /index.js` - *server* code, not *client* code

> that's why most web servers use a `public` directory to store all publicly accessible files

btw, most browsers these days automatically remove `../` from URLs, to prevent this kind of attack, but we can get around that in `telnet`:

```
$ telnet localhost 5000
Trying ::1...
Connected to localhost.
Escape character is '^]'.
GET /../fancy/README.md
```

# Patching the hole

1. Create a *relative* file path from the request path
2. Create an *absolute* file path from the relative path
3. Make sure that file path is *inside* this site's `public` directory

```js
@@@js
const $path = require('path');
let file = '.' + decodeURIComponent(request.url);
file = $path.resolve(file);
let publicDir = $path.resolve('.');
if (!file.startsWith(publicDir)) {
  data = "Error: you are not permitted to access that file.";
  response.statusCode = 403; // Forbidden
  console.log("User requested file '" + request.url + "' (not permitted)");
  file = null;
}
```

> This "public dir" algorithm is a *partial* solution; there are many other factors in configuring a secure web server that we can't get into now.

# Simple Directory Server

New rule:

* when the user requests a *file*, we serve that file
* when the user requests a *directory*, we serve an *HTML page* that includes *links* to each file in that directory
  * aka an "index page" or "index.html"

Historical note:

* This was the way the early webservers always used to work, and modern web servers can be configured to work the same way.
* This is *why* index.html is named *index* -- it is a *replacement* for the automatic default *index* page.

# Simple Directory Server

```js
@@@js
if (fs.statSync(file).isDirectory()) {
  let indexFile = file + "/index.html";
  if (fs.existsSync(indexFile)) {
    sendFile(indexFile);
  } else {
      
    let files = fs.readdirSync(file);
    let html = files
        .map((f) => `<li><a href="${path}/${f}">${f}</a></li>`)
        .join('\n');
    data = `<h1>${path}</h1> <ul> ${html} </ul>`; 
    contentType = 'text/html';

  }
} else {
  sendFile(file);
}

```

* Our logic is getting a bit more complex, so we're extracting some functions to make it more readable
* This is our first example of *dynamically generated HTML*
* We're also using *backtick strings* (an ES6 feature) to "interpolate" strings into each other:
  * with ticks: `'$' + dollars + '.' + cents`
  * with backticks: &#96;`$${dollars}.${cents}`&#96;
  * output: `"$24.03"` (same for both)

# public dir

One final change to our file server...

Let's make it so you can't serve server-only file and directories like *node_modules* and *README.md*.

```javascript
    let publicDir = $path.resolve('./public');
    if (!file.startsWith(publicDir)) {
      console.log("User requested file '" + request.url + "' (not permitted)");
      sendError(403, "Error: you are not permitted to access that file.");
    }
```

run `node simple_dir.js` and visit <http://localhost:5000/images>

note that these files are *inside* the `public` directory even though the *request path* did **not** include the word "public"

# Prepare for extraction

Now that we have a (mostly) working file server, let's extract it into a library. Look at `lib/assistant.js`.

We took the functions `sendFile`, `sendError`, etc., and put them into a *class* named FileServer.

Now the [core server](core_server.js) is tight:

```
const http = require('http');
const Assistant = require('./lib/assistant');
const port = process.env.PORT || 5000;

http.createServer(function (request, response) {
  console.log('Finding ' + request.url);
  let assistant = new Assistant(request, response);
  assistant.handleFileRequest();
}).listen(port);
console.log("Listening on port " + port);
```
