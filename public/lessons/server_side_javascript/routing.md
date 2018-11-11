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

# Express Routing Details

* supports handling all HTTP methods with the pattern `app.METHOD(PATH, HANDLER)`

* whenever an incoming request matches the *path* parameter, Express will invoke the *handler* callback function

* paths can include special characters that are *like* regular expressions

  * `?` "zero or one of these"
  * `+` "one of more of these"
  * `*` "zero or more of these"
  * `()` "this is a single thing"

* ...but are *not* regular expressions

  * `.` and `-` are interpreted literally
  * `:` means "this is a parameter" (see next slide)
  
* ...or you can use *actual* regular expressions

        app.get(/.*fly$/, function (request, response) {
            response.send('I am some sort of fly')
        })


* full [Express Routing Guide](https://expressjs.com/en/guide/routing.html) on their web site

# Path Parameters in Express

The special character `:` means "this is a [path parameter](./parameters#path_parameters)"

Express will grab the *value* from the path itself, and put it into the `request.params` object for you to use later

# LAB: Hello, Friend!

Change your "Hello, Express" server to have the following route:

```
app.get('/hello/:friend', (request, response)=> {
    response.send('Hello, ' + request.params.friend + '!')
});
```

Prove that it works by visiting <http://localhost:5000/hello/Gandalf> (use or your own name)


# Blog Codealong

todo: separate lesson

# Let's build a blog in Express!

Follow along here: <https://github.com/BurlingtonCodeAcademy/simple-server/blob/master/simple_blog.js>

Endpoints:

* `/` - home page
* `/articles` - list of all articles
* `/articles/1` - article with id 1

* `/articles.json` - list of all articles in JSON format
* `/articles/1.json` - article with id 1 in JSON format

We haven't learned about databases yet, which is fine:

> the filesystem is a database 😮


# Home page is just a file

Our existing server code will handle a default home page; if we name it `index.html` then we're good.

# Article page is a file plus an API call

Traditionally, a web server generates HTML "on the fly" in response to a web request.

A more modern app will send *static* HTML/CSS/JS, then *that* code will run on the client and make a *new* request for JSON data to fill itself in.

# Blog Client

### article.html 

```html
@@@html
<div class='article'>
  <h2 id='title'></h2>
  <i>by <span id='author'></span></i>
  <p id='body'></p>
</div>
```

### article.js

```
let articleId = document.location.pathname.split('/').splice(-1);

fetch('/articles/' + articleId + '.json')
  .then((response) => response.json())
  .then(fillArticle)

function fillArticle(article) {
  document.getElementById('title').textContent = article.title;
  document.getElementById('author').textContent = article.author;
  document.getElementById('body').textContent = article.body;
}
```

# Blog Server

In addition to serving *static files*, the server needs to respond to some routes *dynamically*.

For example, `/articles/1.json` will be served statically, but `/articles.json` will be created on the fly based on the contents of the `public/articles` directory.

```
@@@js
function allArticles() {
  let articlesDir = $path.join(publicDir, "articles");
  return fs.readdirSync(articlesDir)
    .filter(file => file.endsWith('.json'))
    .map(file => JSON.parse(fs.readFileSync($path.join(articlesDir, file))));
}

function sendArticleList() {
  data = JSON.stringify(allArticles());
  contentType = 'text/json';
}
```

* There's probably a more efficient way to read all the files, using `readFile` instead of `readFileSync`.
* `$path.join` creates a path with OS-specific slash symbols (forward slash on Unix, backslash on Windows)

# URL Path Parameters

One thing a routing system can do is treat the path not as a series of *directories and files*, but as a series of *named parameters*

* `/articles/1.json` becomes `{resource: 'articles', id: '1', format: 'json'}`

```
@@@js
function parsePath(path) {
  let format;
  if (path.endsWith('.json')) {
    path = path.substring(0, path.length - 5);
    format = 'json';
  }
  let pathParts = path.slice(1).split('/');
  let action = pathParts.shift();
  let id = pathParts.shift();
  let pathParams = { action: action, id: id, format: format };
  return pathParams;
}
```

(also scroll through simple_blog.js looking for interesting bits)

# URL Query Parameters

Path parameters are all the rage, but some scenarios need traditional `?`-style query parameters. 

For instance, an actual search through the blog -- by keyword or by date or by author -- will be best expressed as a series of `name=value` pairs at the end of the URL.

`/search?author=Julius+Caesar` would become `{author: "Julius Caesar"}`

# URL Query Parameters in NodeJS

NodeJS has a `URL` object that wraps `request.url` and exposes fields for all the various URL parts. It's got some weird names for those parts, though, so you may want to assign them to better-named variables.

Instantiate it like this:

```
let url = new URL(request.url, 'http://localhost:5000/');
let path = url.pathname;
let queryParams = url.searchParams;
```

Use it like this:

```
function sendSearchResults() {
  let results = allArticles().filter((article) => {
    if (queryParams.get('author')) {
      return article.author.toLowerCase() === 
        queryParams.get('author').toLowerCase();
    }
  });
  data = JSON.stringify(results);
  contentType = 'text/json';
}
```
# Parsing Parameters

Your app server framework might convert query or post params into an object for you, but it's not hard to do yourself:

```javascript
@@@javascript
function decodeParams(query) {
  let fields = query.split('&');
  let params = {};
  for (let field of fields) {
    let [ name, value ] = field.split('=');
    value = value.replace(/\+/g,' ');
    params[name] = decodeURIComponent(value);
  }
  return params;
}
```

# Search

New endpoints:

 * `/search.json` returns JSON results of a search
 * `/search` returns `search.html`
    * which calls `/search.json` on page load to perform the actual search

The parameters to search are 

| Name | Type | Description | 
|---|---|---|
| `author` | string | search for documents whose `author` contains the value |

That's it for now! (We can add other fields later if we want.) 

# Handling Search

Since our database is so small, we will search through all documents in RAM. 

```
@@@javascript
  function sendSearchResults() {
    let results = allArticles().filter((article) => {
      if (queryParams.get('author')) {
        let articleAuthor = article.author.toLowerCase();
        let targetAuthor = queryParams.get('author').toLowerCase();
        return articleAuthor.includes(targetAuthor);
      }
    });
    let data = JSON.stringify(results);
    let contentType = 'text/json';
    finishResponse(contentType, data);
  }
```
See? Who needs a database? :-)

# REST area

Some of these concepts of "path parameters" and "routing" are from a idea called REST.

It argues that people designing web applications should consider their apps URLs to be an essential part of their app's design and functionality, and that those URL paths should follow a convention that exposes parts of the app as *resources* that can be identified and interacted with individually using a common set of *methods* (that happen to be more or less the same as the HTTP methods).

todo: more on REST

