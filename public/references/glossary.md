# Glossary of Terms

## Arrays
An ordered collection of things. Arrays can contain any type type of value and are defined using square brackets, [].
```javascript
let array = ['string', 1234, variableName, {name: 'object'}, ['banana', 'apple', 'pear'], 1.25743]
```

## Bang
"**!**", the not operator, also called an exclamation point.
```javascript
!true // => false
```

## Block
A chunk of code contained within curly braces, {}. Blocks have a local scope.
```javascript
{
  let string = "this is block scope"

  string // => "this is block scope"
}

string // => undefined
```

## Callback Function
A function which is passed to another function as an argument.
```javascript
function callContainer(callback) {
  callback() // accepts a function as an argument then calls that function
}

function sayHello() {
  console.log("Hello")
}

callContainer(sayHello) // sayHello is being used as a callback function
```

## Class
A class is essentially an object template, or prototype. They are defined with the `class` keyword and a capitalized name.
  ### Constructor
  A constructor is a special function on classes that allows you to predefine the properties on the objects of that class.
```javascript
class Rectangle {
  constructor(height, width) {
    this.height = height;
    this.width = width
    this.area = this.area.bind(this)
  }

  area() {
    return this.height * this.width
  }
}
```

## DOM
The Document Object Model is an object that represents an HTML page that tells the browser what to display. The DOM can be manipulated without changing the HTML source code as it is unique to each instance of the HTML being run in the browser.

## Event Handler
A function that waits for some event and then triggers a callback function once that event is triggered
```javascript
element.addEventListener('event', callbackFunction)

setInterval(1000, callbackFunction)
```

## Function
A self contained block of code. Functions are defined with the `function` keyword, optionally a name for the function, an open an close parentheses, which may have argument variables, and an open and closed set of curly braces defining the body of the function where the action of the function happens. Functions can also be written in 'fat arrow' syntax in which case they don't need the function keyword, and instead have a fat arrow `=>` between the parentheses that accepts arguments, and the curly braces.
>Functions return `undefined` unless they have a specific value returned, marked by the `return` keyword

```javascript
function add(arg1, arg2) { // classic fuction definition
  return arg1 + arg2
}

fatArrowFunction = (arg) => {
  console.log(arg)
}

let anotherValidFunction = function() {
  console.log('You can only call me below this definition')
}
```

Functions set to a variable name with the `let`, `const`, or `var` keyword do not hoist and can only be used after being defined.

## HTML
Hyper Text Markup Language. It's a high level programming language, and the Face of the World Wide Web.

## Instance
A specific usage of a value.

```javascript
function doSomething(thing) {
  //does stuff
}

doSomething(valueOne)//an instance of doSomething
doSomething(valueTwo)//a different instance of doSomething 
```

## I/O
Input/Output, The parts of the computer you interact with.  Input is anything that allows energy or information to enter the system i.e. the keyboard, or the console. Output is anywhere that displays information from the system i.e. the screen, or the console.
>Sometimes things can act as both input and output suh as the terminal, which you can type into, but also displays information.

## Iterator
A method that loops over the properties of an object or an array, and performs an action on them. Common iterators are the `forEach` method on arrays, `for ... of` loops, and `for ... in` loops.

```javascript
let array = ['a thing', 'another thing']
array.forEach(thing => console.log(thing))

for (thing of array) {
  console.log(thing)
}

for (index in array) {
  console.log(array[index])
}
```

## Library
A library is an extension to a programming language that extneds or changes the way that language behaves. i.e. express is a JavaScript Library that allows serverside programming.

## Method
A method is a function attached to an object. If you define a method using fat arrow syntax it will bind the keyword `this` to the object the method is attached to.

```javascript
const object = {
  method() {
    console.log("I'm a method!")
  }

  anotherMethod = () => {
    console.log("I'm a fat arrow method!")
  }
}
```

## Null
Null is a value that stands in for "nothing." Javascript has several nulls:

  * `null` Nothing, there is no value
  * `undefined` I don't know what the value is
  * `NaN` Not a Number
  * `''` Empty String 

## Object
An object is a collection of key value pairs. The values can be any JavaScript value, including functions (in which case they become methods), and the keys are strings. Objects are created using curly braces to deliniate the object with the keys and thier values seperated by colons, and the key/value pairs seperated by commas

```javascript
let object = {

  prop : "a property",

  "multi key": true,
  
  number: 2,

  method() {
    if(this["multi key"]) {
      return "access garnted"
    }
    else {
      return "access denined"
    }
  },
   
  inception: {name: "objects in objects"}
}
```

## Operator
A value that sends a message to the value to its left

## Queue
An ordered collection that is "first in, first out." There is no Queue object in JavaScript, but we can use arrays like queues with `push` and `shift`.

## Recursion
When you call a function inside of itself to cause a loop

```javascript
function count(num){//function that takes a number
  console.log(num)// prints the number
  count(num + 1)// and recurses to count infinitely(or at least until it exceeds the callstack and errors out)
}
```

## Refactor
ReWriting already functional code, and making it better.

## Regular Expression
A low level programming language most oten used for string matching.

## Scope
What the thing is contained within.

## Stack
An ordered collection that is "first in, last out." There is no Stack object in JavaScript, but we can use arrays like stacks with `push` and `pop`

## Terminal
That fancy all-text display box.
  ### Command Line
  The section of the terminal you type into, marked with some sort of prompt, usually a `>` or `$`

## this
`this` is a special keyword that points to the containing scope.

## Type
A specific type of value, i.e. `number`, or `string`

## Variable
Something that stands in for something else, and is bound to the scope in which it's defined. Declared with the `let`, `const`, or `var` keyword. `let` allows a variable to be mutated. `const` does not allow the variable to be mutated. `var` is older and behaves a lot like let, but doesn't allways bind to it's containing scope, and **should not be used**.
