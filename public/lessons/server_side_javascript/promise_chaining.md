
# What is a promise?

A promise is something that stands in for a piece of data you don't have yet. This allows us to write code around values we will be getting at some point while the program is running.

# Promise Chaining

Promise chaining is a way of making your asynchronous code run top to bottom like synchronous programming, but still allowing you to wait for data to be fetched from somewhere else. To chain promises you use a special method `.then()` which accepts a callback function as its argument, and passes the resolved value of the previous promise to the callback function as an argument.

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

Promise chaining with `.then` is the most comon way of dealing with fetch, post, or any other types of requests in express because fetching any data takes time, and we need to force our program to wait to recieve that data before we can use it.

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

**BUT** async/await is very new and not fully implemented by many frameworks and libraries, express included.  While it will work mostly as expected it doesn't have all the functionality that express gives you with promise chaining with `.then`. In particular you will need to define how to handle errors for each of your blocks otherwise your server will crash if it runs into an error, rather than alerting you of the error and continuing on.
