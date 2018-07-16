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

`POST /articles` create a new article *or* update an existing one

# Tech

NodeJS has a nice `fs` library built in that has some smooth ways of reading and writing files.

# Code

todo: add HTML and JS to `simple_blog.js`

