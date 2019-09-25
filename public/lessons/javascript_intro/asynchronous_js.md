# Synchronous Programming v. Asynchronous Programming
JavaScript was built as a synchronous programming language, which means that by default your program will run top to bottom without ever stopping. But what if you have to fetch something from memory, or from the web? That could take milliseconds, or even seconds while your program is going to run in nanoseconds. What about waiting for user input, which could take some unspecified amount of time?

# How to Make JS Asynchronous

* Callback Functions

* Promises

* Async/Await

# Callback Functions

A callback is a function definition that is passed to another function as an argument.

![Callback Example](/images/callback-example.png)

# Callback Hell

Callback Hell aka the Christmas Tree of Doom can be easily recognized by the shape of your code. If you start getting something like this:

```js
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

You're probably in callback hell


# What is a Promise?

A promise is something that stands in for a piece of data you don't have yet. This allows us to write code around values we will be getting at some point while the program is running.

# Promise Chaining

Promise chaining is a way of making your asynchronous code run top to bottom like synchronous programming, but still allowing you to wait for the initail input. To chain promises you use a special method called `.then` which accepts a [callback function](../references/callbacks.md) as its argument, and passes the return value of the previous promise to the callback function as an argument. It is most often used when performing `fetch` requests.

```javascript
const someArray = []//global variable we will manipulate inside our .then

fetch('some URL or file path')
.then(
  function(res){//passes the response of the fetch request as an argument
    return res.json()
})
.then(
  function(jsonObj) {//passes the return value of the previous '.then' as an argument
    someArray.push(jsonObj)
}) //you can continue chaining as many '.then's as you need
```

# async/await

There is a special keyword in JavaScript which allows us to write asynchronous code blocks called `async` inside these code blocks we can use the keyword `await` to essentially pause the execution of the code until the promise is returned, and it only resumes once that promise has been resolved.

```javascript
const readline = require('readline');

const readlineInterface = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

//----Everything above this line is setup to allow i/o through the terminal--------------------------------------------------------

function ask(questionText) {
  return new Promise((resolve, reject) => {//'ask' is a normal function that returns a promise
    readlineInterface.question(questionText, resolve);
  });
};

async function askName() {
  let name = await ask('What is your name?')// the program will not continue until this promise has been resolved
  console.log(`Hello, ${name}!`)
}
```

# Lab: Quest.js

Write an async function that asks:

* Your name
* Your quest
* Your favorite color
* and then prints out the line "Hello, **name**! Good Luck **quest**, here's a **color** flower."

# Quest Solution

<details>
<summary>Hint</summary>
<div>
You may want to use the `ask()` function

```js
const readline = require('readline');

const readlineInterface = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function ask(questionText) {
  return new Promise((resolve, reject) => {//'ask' is a normal function that returns a promise
    readlineInterface.question(questionText, resolve);
  });
};
```

</div>
</details>

<details>
<summary>Solution</summary>
<div>

```js
async function quest() {
  let name = await ask("What is your name?")
  let quest = await ask("what is your quest?")
  let color = await ask("What is your favorite color?")

  console.log("Hello, " + name + "! Good Luck " + quest + ", here's a " +  color + "flower")
}
```

</div>
</details>