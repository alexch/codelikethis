# Callback Functions

## what is a callback?

A callback is a function definition that is passed to another function as an argument.

```javascript
function container(arg, callback) {
  callback(arg)
}

function doThis() {
  //just your standard javascript function
}

container(someArgument, doThis) // will call doThis passing in someArgument

//or

container(function(someArgument) {
  //does something
})

//you could also use fat arrow functions

container(someArgument => {
  return someValue
})
//or
container(someArg => someValue)
```

Callback functions are a native part of JavaScript, and the original way of handling asynchronous programming in JavaScript. We now have more ways of handling callbacks, however callbacks are still prevelent throughout the language, and are useful in a variety of situations, such as passing some form of input, which will be given after the program has started, to a function, or waiting for some event to happen before the callback can be called.

## Callback Hell

Callback Hell aka the Christmas Tree of Doom can be easily recognized by the shape of your code. If you start getting something like this:

```javascript
function callbackHell(event) {
  function(result, function() {
    function(result, function() {
      function(result, finction() {
        function(result, function(){
          function(result, function(){
            function(result, function(){
              function(result, function(){
                //Is this hell? Yes, yes it is.
              })
            })
          })
        })
      })
    })
  })
}
```

You're propably in callback hell

## event handler callbacks

There are several different types of event handlers in JavaScript, the ones you will probably come across most often are those dealing with, action, input,and timing.

```javascript
process.stdin.on('data', function(){
   //does something with the data
}) // process.stdin waits for some event and then calls a function based on the value of that event. In this instance it's a 'data' event

//of you replace .on with .once it will terminate after firing the function once

HTMLElement.addEventListener('click', function(event){
   //the event is always passed as the first argument to the function
}) //calls the function after the event has been triggered on the element it's attached to in this case it's a 'click' event

setTimeout(1000, function(){
   //does something
}) //setTimeout waits a specified amount of time in milliseconds then calls the callback

//setInterval is similar, but will call the callback once EVERY specified number of milliseconds
```

## request/response callbacks

Request/Response callbacks are used in server side coding with javascript using backend libraries like [express](https://expressjs.com/).

```javascript
const express = require('express')
const app = express()

app.get('http://someURL.com', function(req, res) {
  
  //the request (often abreviated to req) is the first argument and is the return value of your method ('get' in this case) request

  //response (abbreviated to res) is always the second argument and is the content you want to send back

  if(req.status !== 404) {
    res.send('<h1>This site Exists!</h1>')
  } else {
    res.send('no page found')
  }
})
```