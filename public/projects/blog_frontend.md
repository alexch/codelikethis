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


### One

Read the fake blog API documentation located at:

* "https://jsonplaceholder.typicode.com/"

### Two

Use the API client Postman to query the api at the following routes and inspect the output.

1. https://jsonplaceholder.typicode.com/posts/1

2. https://jsonplaceholder.typicode.com/posts

3. https://jsonplaceholder.typicode.com/comments

4. https://jsonplaceholder.typicode.com/posts/3/comments

5. https://jsonplaceholder.typicode.com/posts/3/comments

6. https://jsonplaceholder.typicode.com/posts/1?_embed=comments

7. https://jsonplaceholder.typicode.com/comments/1?_expand=post

What are the differences between the URL resources listed above? Talk about them with your partner

### Three

Create a basic HTML page with the following sections:

```html
@@@html
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

### Four


### Five


### Six


### Seven
