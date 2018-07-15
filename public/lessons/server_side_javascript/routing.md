# Routing

*routing* in web apps is essentially a set of rules to decide...

  * given this request
  * what code do we run?
  
the "code we run" is also called an *endpoint* or a *route* or a *script* or a *handler* or...

# Routing is simple

Many web app server frameworks have complicated systems for routing, but that complexity is not essential.

Routing can be a simple series of `if..else` statements, or a [`switch` statement](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/switch) 

and most of the fancy framework code is simply to build up a list of matching rules which the server then walks through in first-to-last order.

# Let's build a blog!

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

[also scroll through simple_blog.js looking for interesting bits]

# URL Query Parameters

Path parameters are all the rage, but some scenarios need traditional `?`-style query parameters. 

For instance, an actual search through the blog -- by keyword or by date or by author -- will be best expressed as a series of `name=value` pairs at the end of the URL.

`/search?author=Julius+Caesar` would become `{author: "Julius Caesar"}`

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
