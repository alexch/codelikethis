# Blog Codealong

# LAB: Let's build a blog in Express!

Follow along here: <https://github.com/BurlingtonCodeAcademy/express-blog>

## HTML Endpoints:

* GET `/` - home page
* GET `/articles` - list of all articles
* GET `/articles/1` - article with id 1
* GET `/search` - find all matching articles
* GET `/publish` - form to create a new article
* POST `/articles` - actually create a new article

## JSON Endpoints:

* GET`/articles.json` - list of all articles in JSON format
* GET`/articles/1.json` - article with id 1 in JSON format
* GET`/search.json?author=alice` - list of all articles written by Alice

# Data storage

We haven't learned about databases yet, which is fine, because...

> The filesystem **is** a database. 😮

... so for this app, we will store articles as JSON files on disk.

# Project Setup

Create a new project named "blog" and run

```bash
npm init -y
npm install express
```

# Server Setup

Create a file named `app.js` with the following code:

```javascript
const fs = require('fs');
const $path = require('path');
const express = require('express');

const app = express();
const port = process.env.PORT || 5000;
const publicDir = $path.resolve('./public');
const articlesDir = $path.resolve('./articles');

app.use(express.static('public'));
app.listen(port, () => console.log(`Blog app listening on port ${port}!`));
```

### Notes:

* `fs` and `path` are NodeJS libraries for dealing with the filesystem. We will use them later.
* we made `$path` start with a $ so that later we can use a local variable named `path` without namespace collision

# Home page

Our existing server code will handle a default static home page; if we name it `index.html` then we're good.

**Remember** -- if you copied and pasted the *hello_express* server code, you must **remove** the `app.get('/'` route, or else Express will say "hello" instead of sending the file.

Create a directory named `public` and a file named `index.html` containing:

```html
<h1>Express Blog</h1>

<form method='GET' action='/search'>
  <label>Search by Author: <input type="search" name="author"></label>
  <input type='submit' value='Search'>
</form>

<ul>
  <li>
    <a href="/articles/1">Featured Article</a>
  </li>
  <li>
    <a href="/articles">All Articles</a>
  </li>
  <li>
    <a href="/publish">Publish a New Article</a>
  </li>
  
</ul>
```

This page now contains links to all the other pages in the site. Feel free to make it prettier! :-)

# Seeding the Database

Create a directory named `articles`. Inside this directory create a file named `1.json` containing something like this:

## articles/1.json

```json
{
  "id": 1,
  "title": "How to Cross a Rubicon",
  "author": "Julius Caesar",
  "body": "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
}
```

# Article page is a file plus an API call

Traditionally, a web server generates HTML "on the fly" in response to a web request.

A more modern app will send *static* HTML/CSS/JS, then *that* code will run on the client and make a *new* request for JSON data to fill itself in.

So to make our modern blog app show an article, we need *two*  
 
 1. an HTML *file* to send on initial page load
 2. a JSON *route* to send the actual article

# Viewing a single article (Client-side)

### public/article.html 

```html
<div class='article'>
  <h2 id='title'></h2>
  <i>by <span id='author'></span></i>
  <p id='body'></p>
</div>
<script>
let articleId = document.location.pathname.split('/').splice(-1);

fetch('/articles/' + articleId + '.json')
  .then((response) => response.json())
  .then(fillArticle)

function fillArticle(article) {
  document.getElementById('title').textContent = article.title;
  document.getElementById('author').textContent = article.author;
  document.getElementById('body').textContent = article.body;
}
</script>
```

# Viewing a single article (Server-side)

Our first route will match `/articles/1` and return the HTML for viewing a single article.

Our second route will match `/articles/1.json` and return the actual article data in JSON format.

Add the following code to the server:

### app.js

```javascript
function articleFilePath(articleId) {
  return $path.join(articlesDir, articleId + ".json");
}

app.get('/articles/:articleId.json', (request, response) => {
  let filePath = articleFilePath(request.params.articleId);
  response.sendFile(filePath);
});

app.get('/articles/:articleId', (request, response) => {
  let filePath = articleFilePath(request.params.articleId);
  if (fs.existsSync(filePath)) {
    let htmlFile = $path.join(publicDir, "article.html");
    response.sendFile(htmlFile);
  }
  else {
    response.status(404).send(`Article ${request.params.articleId} not found`);
  }
});
```

> Now try it out! Visit the "Featured Article" from the home page and see if it works.

# Viewing All Articles (Client-side)

### public/articles.html

```html
<h2>Articles:</h2>
<div id='articles'>
  <ul>
    
  </ul>
</div>

<script>
fetch('/articles.json')
  .then((response) => response.json())
  .then(fillArticles)

function fillArticles(articles) {
  let list = document.querySelector('#articles > ul');
  for (let article of articles) {
    let item = document.createElement('li');
    let html = '<a href="/articles/' + article.id + '">' + article.title + '</a>'
    if (article.author) {
      html += ' (by ' + article.author + ')'
    }
    item.innerHTML = html;
    list.appendChild(item);
  }  
}
</script>
```

# Viewing All Articles (Server-side)

In addition to serving *static files*, the server needs to respond to some routes *dynamically*.

For example, `/articles/1.json` will be served statically, but `/articles.json` will be created on the fly based on the current contents of the `public/articles` directory.

## app.js

```js
app.get('/articles', (request, response) => {
  response.sendFile($path.join(publicDir, 'articles.html'))
})

app.get('/articles.json', (request, response) => {
  let articles = allArticles();
  let data = JSON.stringify(articles);
  response.type('application/json').send(data);
})

function allArticles() {
  return fs.readdirSync(articlesDir)
    .filter(file => file.endsWith('.json'))
    .map(file => JSON.parse(fs.readFileSync($path.join(articlesDir, file))))
    .sort((a,b)=> (a.id - b.id));
}
```

## Notes:

* There's probably a more efficient way to read all the files, using `readFile` instead of `readFileSync`, but this works for now.
* Although they look very similar to human eyes, the routes `/articles` and `/articles.json` will *not* overlap with each other, since they are both exact matches. So you can put them in any order.

# Publish an Article (Client-side)

## public/publish.html

```html
<h1>Publish an Article</h1>

<form method='POST' action='/articles'>
  <label>Author: <input type='text' name='author'></label>
  <br>
  <label>Title:  <input type='text' name='title'></label>
  <br>
  <label for='body'>Body:</label>
  <br>
  <textarea name='body'>
  </textarea>
  <br>
  <input type='submit'>
</form>
```

# Publish an Article (Server-side) (1)

Since the "publish" form will be submitted by the browser (and not by JavaScript), it will send the parameters in URL-encoded format in the request body.

So on the server, we must use `express.urlencoded` to parse the body and set the parameters inside the `request.body` object.

## app.js

```javascript
app.get('/publish', (request, response) => {
  let htmlFile = $path.join(publicDir, "publish.html");
  response.sendFile(htmlFile);
})

app.post('/articles', express.urlencoded({extended: false}), (request, response) => {
  createArticle(nextArticleId(), request.body, response)
})
```

# Publish an Article (Server-side) (2)

Before we create an article we must pick a brand new, unused id for it.

## app.js

```javascript
// Pick an unused article id.
function nextArticleId() {
  let articles = allArticles();

  // find the highest id...
  let id = articles[articles.length - 1].id;

  // ...and pick a higher one
  let articleId = id + 1;
  return articleId;
}
```

Warning: this algorithm has a race condition 
and will sometimes fail when several clients
attempt to create new articles simultaneously!

...but it will be good enough for now. Later we will use a proper database with a good unique id generator.

# Publish an Article (Server-side) (3)

## app.js

```javascript
function createArticle(articleId, params, response) {
  let article = {
    id: articleId,
    author: params.author.trim(),
    title: params.title.trim(),
    body: params.body.trim()
  };

  let articleDataFile = $path.join(articlesDir, articleId + ".json");
  fs.writeFile(articleDataFile, JSON.stringify(article), (err) => {
    if (err) {
      response.status(500).send(err);
    } else {
      response.redirect('/articles');
    }
  });
}
```

## Notes:

* it is tempting to pass "params" directly in to the database layer from the route, but it's best to have a separate processing step that lets your application handle security and data integrity issues, including:

  * escaping
  * normalizing
  * validating
  * anonymizing
  * logging

# Search

New endpoints:

 * `/search` returns `search.html`
    * which calls `/search.json` on page load to perform the actual search
 * `/search.json` returns the results of a search in JSON

The parameters to search are 

| Name | Type | Description | 
|---|---|---|
| `author` | string | search for documents whose `author` contains the value |

That's it for now! (We can add other fields later if we want.) 

# Search (client-side)

## search.html

```html
<form method='GET' action='/search'>
  Search by Author: <input type="search" name="author">
</form>

<h2>Search Results:</h2>
<div id='results'>
    <ul>
    </ul>
</div>

<script>
fetch('/search.json' + document.location.search)
  .then((response) => response.json())
  .then(fillArticles);

function fillArticles(articles) {
  let list = document.querySelector('#results > ul');

  if (articles.length === 0) {
    list.innerHTML = 'none';
  }
  
  else for (let article of articles) {
    let item = document.createElement('li');
    let html = '<a href="/articles/' + article.id + '">' + article.title + '</a>';
    if (article.author) {
      html += ' (by ' + article.author + ')';
    }
    item.innerHTML = html;
    list.appendChild(item);
  }

}
</script>
```

## Notes:

This code depends on `document.location.search` (the `?` portion of the URL) still containing the parameters that were passed from the form when the page was fetched. 

# Search (server-side)

Since our database is so small, we will load all articles into memory and search through them using a JavaScript iterator (`filter`).

```javascript
app.get('/search', (request, response) => {
  response.sendFile($path.join(publicDir, 'search.html'))
})

app.get('/search.json', (request, response) => {
  let results = searchArticles(request.query)
  response.type('application/json');
  response.send(JSON.stringify(results));
});

function searchArticles(params) {
  let results = allArticles().filter((article) => {
    if (params.author) {
      let articleAuthor = article.author || '';
      let targetAuthor = params.author || '';
      return articleAuthor.toLowerCase().includes(targetAuthor.toLowerCase());
    }
  });
  return results;
}
```

See? Who needs a database? :-)

