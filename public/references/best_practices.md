# Names

## naming conventions

In JavaScript variable names are written in camel case. This means the words are concatanated with every word after the first being capatilized e.g. `let myVariableName = value`

Class names are still concatanated but the first word is capitilized e.g. `new Class = MyNewClass`

## What makes a good variable name?

Keep your variable names short and descriptive.  Oftentimes people will give variables very terse names the at make sense in the moment, but aren't understandable by anyone else, or even your future self if you come back to the code in a couple months. Single character names are almost always bad.

Likewise names that are too verbose are also confusing. Try and limit your variable names to 1 - 3 words rather than writing a whole sentence. Abreviations can be useful as long as it's very clear what they're standing in for e.g. `object => obj`

Here are a few examples of **good** variable names:

* `userName`
* `num`
* `dogObject`
* `isTrue`

Here are a few examples of **bad** variable names:

* `x`
* `y`
* `n`
* `i`
* `spqr`
* `variableForStoringUserInputFromTheCommandLine`

# Global Variables and Encapsulation

## Global Variables

Global variables are bad.  They are dangerous, and you should avoid using them at all if you can.  Global variables can be changed from anywhere in your program and used from anywhere so if a part of your code expects a variable to be a certain way, and a different part changes that variable now you've got a bug that's very hard to track down as both parts of your code are working as intended they just don't work well *together*.

To make sure you don't have any accidental globals always declare your variables with `let` or `const` since `var` will 'leak' out of block scope. **Never use var.**

## Create an Object Literal

To avoid globals we can wrap code blocks inside an object literal

instead of:

```js
let price = 3.5

function getPrice() {
  return "That'll be about $" + price + "0" 
}

function haggle() {
  price = 3
  return "How about $3"
}
```

you could write:

```js
let treeFiddy = {
  price: 3.5,
  
  getPrice: function() {
    return "That'll be about $" + price + "0" 
  },

  haggle: function() {
    this.price = 3
    return "How about $3"
  }
}
```

This way of containing your variables is pretty good. However there are some drawbacks. Now when you want to access any value or function from that object you will have to call the object first e.g. `treeFiddy.getPrice()` rather than just `getPrice()`

This leads to a lot of repetition throughout your code which is somewhat annoying, but it's a small price to pay to encapsulate related code, and not accidentally overwrite a global variable.

## Module Pattern

The module pattern is when you wrap a related code block in an IIFE. IFFEs can maintain state across calls so you can wrap your code block in a function expression which you immediately call.

```js
let treeFiddy = function() {
  let price = 3.5

  return {
    getPrice: function() {
    return "That'll be about $" + treeFiddy.price + "0" 
    },

    haggle: function() {
      price = 3
      return "How about $3"
    }
  }
}()
```

This method of encapsulation can be rather confusing because IIFEs can be confusing to work with, you need to use different syntax for your inner functions, and you still need to repeat the module name, which makes your code more verbose.

# Make Your Code Human Readable

## Use a Linter

Your browser will always try to run your code if it can, and ignore broken code where possible. While it can be more relaxing to turn off your linter while you're writing code you should turn it back on to check your code afterwards, and try to fix all your syntax issues.

## Format Your Code

Always format your code.  If you're nesting scope, t's an additional level of indentation for each level deep you nest.  Whitespace is your friend. Give different code blocks an empty line between them.  It won't matter to your computer, and will make your code much easier to read for a human.  VSCode has a built-in formatter you can access by right clicking on your document (`option` + `click` on a mac) adn selecting 'format document' from the dropdown menu, or by using the key-command `shift` + `alt` + `f`.

## Comments

Comments are super helpful for understanding your code.  There is an old programming myth that "good code should explain itself."  This is not completely true. No matter how good your code is it will always be clearer to you than to anyone else.  You don't need to document every variable assignment, and function, but you should be giving short descriptions of intended behavior throughout your code.

# Extending Your Code

## Modular Code

Make your code modular.  Try and stick to the principle of each method or function only performing a single task this will allow you to more easily modify your code and extract only the parts you need for a given task.

Instead of doing everything at once like this:

```js
let currentNumber = 100

while (currentNumber > 2) {
  let count = 2
  let number = currentNumber
  let isPrime = true
  while (count < number) {
        if (!(number % count)) {
            isPrime = false
            break
        } else {
            count++
        }
    }
    if(isPrime) {
        console.log(currentNumber)
        currentNumber--
    } else {
        currentNumber--
    }
}
```

You could extract your prime check and make it a stand-alone function:

```js
let currentNumber = 100

function isPrime(number) {
    let count = 2

    while (count < number) {
        if (!(number % count)) {
            return false
        } else {
            count++
        }
    }

    return true
}

while (currentNumber > 2) {
    if(isPrime(currentNumber)) {
        console.log(currentNumber)
        currentNumber--
    } else {
        currentNumber--
    }
}
```

While the second code block here is slightly longer it is much easier to follow since we no longer have to conceptualize the entire program at once, and we no longer have nested loops.

## Use the Right Tool for the Job

JavaScript isn't always the solution for every part of a web app. For example; instead of writing complex code to decide what type of media is submitted through a form you could just have a radio button so the user can tell you what they're submitting.

## Don't Reinvent the Wheel

There are many libraries for many different coding problems.  If there's already a library out there that solves your issue either in part or in whole use that library.

## Setup a Default Configuration

It may be useful to setup a default starting state in your program, so you can be sure that it is always starting with the expected initial values e.g.

```js
let initialState = {
  userName: null,
  isLoggedIn: false
}

function start() {
  let state = initialState;

  mainFunction();
}

start()
```

Then everytime you call the program you first reset the state to the intial state

## Don't Nest Too Deep

Keep your nesting shallow. You are hardly ever going to need to nest more than 2 or 3 levels deep.  If you're going deeper than that it's probably a sign that you can extract some functionality and make it its own code block.

# Loops

## Optimize Loops

When using loops, especially on arrays there are a few tricks you can use to optimize your performance, and since loops execute over and over this can be an easy way to drastically improve your program's performance overall.

## Create an intermediate variable for length

When looping over an array instead of querying the length on every loop set the length of the array to an intermediate vaiable and use that instead. Instead of:

```js
let array = ["apple", "banana", "jackfruit"]
let int = 0

while(int < array.length) {
  console.log(array[i]);

  int++
}
```

You could say:

```js
let array = ["apple", "banana", "jackfruit"]
let int = 0
let length = array.length

while(int < length) {
  console.log(array[int])

  int++
}
```

## Avoid Computation Heavy Code

You should also avoid putting heavyweight code into your loops, such as reguar expressions, or DOM manipulation.

## Sanatize your inputs

Users are never going to use your code in exactly the way you intend them to so it's always a good idea to convert any user input explicitly into the form you expect it to be in when you use it.  e.g.

```js
console.log("What is your name?")
let name = process.stdin.once('data', (chunk) => {
  return chunk.toString().trim()
})
```

instead of

```js
console.log("What is your name?")
let name = process.stdin.once('data', (chunk) => {
  return chunk
})
```