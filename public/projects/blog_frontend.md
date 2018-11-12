# Blog Front-End

Your task is to build a JavaScript based front-end for a Blog API back-end.

## Wireframe

```
+-------------------------------------------------------------+
| +---------------------------------------------------------+ |
| |                                                         | |
| |                     Header                              | |
| +---------------------------------------------------------+ |
| +------------+ +--------------------------+ +-------------+ |
| |            | |                          | |             | |
| |   Sidebar-1| |      Main Content        | |   Sidebar 2 | |
| |            | |                          | |             | |
| |            | |                          | |             | |
| |            | |                          | |             | |
| |            | |                          | |             | |
| |            | |                          | |             | |
| |            | |                          | |             | |
| |            | |                          | |             | |
| |            | |                          | |             | |
| |            | |                          | |             | |
| |            | |                          | |             | |
| |            | |                          | |             | |
| |            | |                          | |             | |
| |            | |                          | |             | |
| |            | |                          | |             | |
| |            | |                          | |             | |
| |            | |                          | |             | |
| +------------+ +--------------------------+ +-------------+ |
| +---------------------------------------------------------+ |
| |                                                         | |
| +---------------------------------------------------------+ |
+-------------------------------------------------------------+
```

## Steps:


### Review Fake Blog Docs

Read the fake blog API documentation located at:

* "https://jsonplaceholder.typicode.com/"

### Request with Postman

Read the Postman API client documentation to learn how to send your first request.
- https://www.getpostman.com/docs/v6/postman/launching_postman/sending_the_first_request

### Play with the API

Use the API client Postman to query the api at the following routes and inspect the output.

1. https://jsonplaceholder.typicode.com/posts/1

2. https://jsonplaceholder.typicode.com/posts

3. https://jsonplaceholder.typicode.com/comments

4. https://jsonplaceholder.typicode.com/posts/3/comments

5. https://jsonplaceholder.typicode.com/posts/3/comments

6. https://jsonplaceholder.typicode.com/posts/1?_embed=comments

7. https://jsonplaceholder.typicode.com/comments/1?_expand=post

What are the differences between the URL resources listed above? Talk about them with your partner

### Starter HTML

Create a basic HTML page with the following sections:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Fetching Data</title>
</head>
<body>
  <div id="root">
    <header id="header">
      My Dynamic Blog
    </header>
    <section id="users">
      User list goes here
    </section>
    <main>
      List of posts and titles goes here
    </main>
    <section id="first-posts">
      First 10 posts go here
    </section>
    <footer id="footer">
      Put your footer content here if you want
    </footer>
  </div>
</body>
</html>
```

### Append Data to Page

Experiment with adding content to the page based on an API response.

```javascript
let allUsers = [];

let getAllUsers = () => {
  fetch('https://jsonplaceholder.typicode.com/users')
    .then(response => response.json())
    .then(users => allUsers = users)
}

let buildParts = (elem) => {
  let result = '';
  for (let prop of elem) {
    let part = `<span>${prop}:</span> `
    result += part;
  }
  return `<p>${result}</p>`
}

let render = (target, data, properties) => {
  let elements = data.map(item => {
    let obj = {};
    for (let prop of properties) {
      obj[prop] = item[prop];
    }
    return obj;
  })

  let parts = elements.map(elem => buildParts(elem))
  root.innerHTML += `<div class="response-data">${parts}</div>`;
}
```


### Five


### Six


### Seven
