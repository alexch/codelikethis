# Glossary of Terms

## Arrays
An ordered collection of things. Arrays can contain any type type of value and are defined using square brackets, [].
```javascript
```

## Bang
!, the not operator, also called an exclamation point.
```javascript
```

## Block
A chunk of code contained within curly braces, {}. Blocks have a local scope.
```javascript
```

## Callback Function
A function which is passed to another function as an argument.
```javascript
```

## Class
A class is essentially an object template, or prototype. They are defined with the `class` keyword and a capitalized name.
  ### Constructor
  A constructor is a special function on classes that allows you to predefine the properties on the objects of that class.
```javascript
```

## DOM
The Document Object Model is an object that represents an HTML page that tells the browser what to display. The DOM can be manipulated without changing the HTML source code as it is unique to each instance of the HTML being run in the browser.

## Event Handler
A function that waits for some event and then triggers a callback function once that event is triggered
```javascript
```

## Function
A self contained block of code. Functions are defined with the `function` keyword, optionally a name for the function, an open an close parentheses, which may have argument variables, and an open and closed set of curly braces defining the body of the function where the action of the function happens.
>Functions return `undefined` unless they have a specific value returned, marked by the `return` keyword
```javascript
```

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
Input/Output, The parts of the computer you interact with.  Input is anything that allows energy or information to enter the system i.e. the keyboard, or a textbox. Output is anywhere that displays information from the system i.e. the screen, or a textbox.
>Sometimes things can act as both input and output suh as the terminal, which you can type into, but also displays information.

## Iterator
A method that loops over the properties of an object or an array.
```javascript
```

## Library
A library is an extension to a programming language that extneds or changes the way that language behaves. i.e. express is a JavaScript Library that allows serverside programming.

## Method
A method is a function attached to an object
```javascript
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
```

## Operator
A type that sends a message to the value to its left

## Queue
An ordered collection that is "first in, first out." There is no Queue object in JavaScript, but we can use arrays like queues.

## Recursion
When you call a function inside of itself to cause a loop
```javascript
```

## Refactor
ReWriting already functional code, and making it better.

## Regular Expression
A low level programming language most oten used for string matching.

## Scope
What the thing is contained within.

## Stack
An ordered collection that is "first in, last out." There is no Stack object in JavaScript, but we can use arrays like stacks

## Terminal
That fancy all-text display box.
  ### Command Line
  The section of the terminal you type into, marked with some sort of prompt, usually a `>` or `$`

## Type
A specific type of value, i.e. `number`, or `string`

## Variable
Something that stands in for something else. Declared with the `let`, `const`, or `var` keyword.