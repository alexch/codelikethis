
# What is a promise?

A promise is something that stands in for a piece of data you don't have yet. This allows us to write code around values we will be getting at some point while the program is running.

# Promise Chaining

Promise chaining is a way of making your asynchronous code run top to bottom like synchronous programming, but still allowing you to wait for data to be fetched from somewhere else.

To chain promises you use a special method `.then()` which accepts a callback function as its argument, and passes the resolved value of the *previous promise* to the callback function as an argument.

```js
let someArray = [] //global variable we will manipulate inside our .then

fetch('some URL or file path')
.then(
  function(res){ //passes the response of the fetch request as an argument
    return res.json()
})
.then(
  function(jsonObj) { //passes the return value of the previous '.then' as an argument
    someArray.push(jsonObj)
}) //you can continue chaining as many '.then's as you need
```

# Promise chaining in ExpressJS

Promise chaining with `.then` is the most common way of dealing with fetch, post, or any other types of requests in express because fetching any data takes time, and we need to force our program to wait to recieve that data before we can use it.

So a GET request handler in express might look something like this:

```js
app.get('/some_api', (req, res) => {
  fetch(req + '.json').then(
    function(rawData) {
      rawData.json()
    }).then(
    function(jsonData) {
      res.send(jsonData)
    })
})
```

# Can't I just use async/await?

Yes you can.

**BUT** async/await is fairly new and not fully implemented by some frameworks and libraries.

Luckily for us express recently added support for async/await in their framework. You can make the request/response callback an asyc function, and then await inside of it.

# Try and Catch

When using async/await on your server you need to set up explicit error handling rules, or the server will crash on an error.

You can do this with a `try` block for the happy path, and a `catch` block for error handling

```js
app.get('/some_api', async (req, res) => {
  try {
    let data = await fetch(req + '.json')
    res.send(data)
  }
  catch (error) {
    console.error("something went wrong: " + error.message)
  }
})
```
