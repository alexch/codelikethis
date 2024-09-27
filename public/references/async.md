# Asynchronous Programming

## What is asynchronous programming?

By default JavaScript runs synchronously. That means it runs top to bottom straight through without ever stopping. This is good in many instances because we want our computers to run fast and not get hung up on things, but what if you need to wait for user input, read from a file, or fetch something from the internet? By default the program's just going to keep running and will either error out, or give some unexpected because the values you expected to have are undefined. The way we get around this is with promises.

## What is a promise?

A promise is something that stands in for a piece of data you don't have yet. This allows us to write code around values we will be getting at some point while the program is running.

## promise chaining

Promise chaining is a way of making your asynchronous code run top to bottom like synchronous programming, but still allowing you to wait for the initail input. To chain promises you use a special method called `.then` which accepts a [callback function](./callbacks.md) as its argument, and passes the return value of the previous promise to the callback function as an argument. It is most often used when performing `fetch` requests.

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

## async/await

There is a special keyword in JavaScript which allows us to write asynchronous code blocks called `async` inside these code blocks we can use the keyword `await` to essentially pause the execution of the code until the promise is returned, and it only resumes once that promise has been resolved.

```js
  function ask(questionText) {
  return new Promise((resolve, reject) => { //'ask' is a normal function that returns a promise
    readlineInterface.question(questionText, resolve);
  });
};

async function askName() {
  let name = await ask('What is your name?') // the program will not continue until this promise has been resolved
  console.log(`Hello, ${name}!`)
}
```

>The above code will not actually work as we haven't actually set up the readline interface.