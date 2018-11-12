# Server-Side JavaScript: Files

Let's add a 'publish article' form to the blog.

# API Design

Article Schema:

|field|type|description|
|---|---|---|
|id|integer| unique among all articles; corresponds to file name e.g. `1.json` |
|author|string|
|title|string|
|body|string| someday we'll make this Markdown | 

```
{
 "id": 1,
 "title": "How to Cross a Rubicon",
 "author": "Julius Caesar",
 "body": "Lorem ipsum dolor..."
}
```

Endpoints:

`POST /articles` create a new article

# Tech

NodeJS has a nice `fs` library built in that has some smooth ways of reading and writing files.

# Code - find id

```
  // find the highest id...
  let id = articles.reduce((topId, article) => {
    console.log(article.id);
    return Math.max(topId, article.id);
  }, 1);
  // ...and pick a higher one
  let newId = id + 1;
```

# Code - read params, write file

```
  assistant.parsePostParams((params) => {
    let article = {
      id: newId,
      author: params.author,
      title: params.title,
      body: params.body
    }
    let articleDataFile = $path.join(articlesDir, newId + ".json");
    fs.writeFile(articleDataFile, JSON.stringify(article), (err) => {
      if (err) {
        assistant.sendError(500, err);
      } else {
        assistant.sendRedirect('/articles');
      }
    })
```

# Code - redirect

```javascript
  sendRedirect(path) {
    let message = `Redirecting to ${path}`;
    console.log(message);
    this.response.statusCode = 302;
    this.response.setHeader('Location', path);
    this.finishResponse('text/plain', message);
  }
```
