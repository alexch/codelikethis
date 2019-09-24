    topic name: "functions"
    topic name: "arguments"
    topic name: "parameters"
    topic name: "return-values"
    link href: "https://eloquentjavascript.net/03_functions.html",
         name: "Eloquent JavaScript: Functions"
    link href: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Functions",
         name: "Mozilla Developer Network: Functions"
    link href: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Closures",
         name: "Mozilla Developer Network: Closures and Scope"
    link href: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions",
         name: "Mozilla Developer Network: Arrow Functions"

# Functions

Remember that a **variable** is a **name** for a piece of data

A **function** is the **name** for a piece of code

## Why would you want to name a chunk of code?

Perhaps...

* you have some code you want to run again and again
* you want to do the same operation on different values
* you want to keep your code organized

# Function example

Here's a not very useful function:

```js
function add(x, y) {
  let sum = x + y;
  return sum;
}
```

* `function` means "define a function"
* `add` is the *name* of the function
* `x, y` are the *parameters* of the function (also called *arguments*)
* `sum` is a *local variable* of the function
* `sum` is also the function's *return value* because of the magic word *return*

# Call Me, Maybe

You call a function by its name, plus parentheses:

```js
function add(x, y) {
  let sum = x + y;
  return sum;
}

add(2, 3)   // returns 5
add(12, 30) // returns 42
```

# Lab: One Nation, Divisible

One number is *divisible* by another if you divide them and the *remainder* is 0.

Write a function called `divisible` that takes two numbers, and returns `true` if the first number is divisible by the second number, and `false` otherwise.

```js
divisible(100, 10)    //=> true
divisible(100, 7)     //=> false
divisible(3333, 11)   //=> true
divisible(99, 12)     //=> false
```

# Shouter

Here is a function that takes some String as input, and as output returns a shouted version of that String.

```js
function shouter(someString) {
  let loudString = someString.toUpperCase();
  return loudString + '!!!';
}

shouter('i like pizza');  => 'I LIKE PIZZA!!!'
```

The variable `loudString` is called a **local variable** and can only be used **inside** the function.

# Lab: Capitalize

Please write a function that returns a **Capitalized** version of a word.
Only uppercase the first letter of the word.

For example:

`capitalize('tomato')` returns `'Tomato'`

A solution is on the next slide, but try to solve it on your own.
Remember that there are many [string operations](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#Methods_2) available to you...

# Capitalize Lab Solution

[Useful String Methods](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Useful_string_methods#Strings_as_objects)

[String Manipulation](https://www.digitalocean.com/community/tutorials/how-to-index-split-and-manipulate-strings-in-javascript#accessing-characters)

<details>
  <summary>Hint One</summary>
Try getting the first letter from the String using indexing
<div>

```js
let firstLetter = string[0]
```

</div>
</details>

<details>
  <summary>Hint Two</summary>
Try using the Array method `slice`
[String Slice - Mozilla](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/slice)
<div>

```js
let restOfString = string.slice(1)
```

</div>
</details>

<details>
  <summary>Answer</summary>
  <div>

```js
function capitalize(word) {
  let firstLetter = word[0];
  let restOfWord = word.slice(1);
  return firstLetter.toUpperCase() + restOfWord.toLowerCase();
}

console.log(capitalize('smith'));
console.log(capitalize('MACGUYVER'));
```

The variables `firstLetter` and `restOfWord` are called *local variables* and can only be used *inside* the `capitalize` function.
  </div>


</details>

# Passing Variables to Functions

When you pass a *variable* to a function, that variable's *value* is assigned to a *parameter*.

> The variable and parameter names **do not** need to match!

```js
function shouter(someString) {
  let loudString = someString.toUpperCase();
  return loudString + '!!!';
}

let feeling = "I feel great";
let strongFeeling = shouter(feeling);
```


| Outside the function | Inside the function | Value               |
|----------------------|---------------------|---------------------|
| `feeling`            | `opinion`           | `"I feel great"`    |
|                      | `strongOpinion`     | `"I FEEL GREAT"`    |
| `strongFeeling`      |                     | `"I FEEL GREAT!!!"` |

# Four Function Syntaxes

> **WARNING**: JavaScript has many ways to define a function.

[Function declaration syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function)

```js
function add(x,y) { return x + y; }
```

The following are all roughly equivalent to the above:

[Function Expression](https://developer.mozilla.org/en-US/docs/web/JavaScript/Reference/Operators/function)

```js
let add = function(x,y) { return x + y; };
```

[Arrow Function Expression](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions)

```js
let add = (x,y) => { return x + y; };
```

[Arrow Function Expression with implicit return value](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions#Function_body)

```js
let add = (x,y) => x + y;
```

* Note that these new forms are *anonymous*, meaning there is **no name** between `function` and `(x,y)`
    * the name of the function **is** the name of the variable that points to it

# LAB: more about functions

* [FreeCodeCamp](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures)
    - start with the challenge [Write Reusable JavaScript with Functions](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/write-reusable-javascript-with-functions)
    - continue through the challenge [Assignment with a Returned Value](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/assignment-with-a-returned-value)

* Read [Eloquent JavaScript chapter 3](http://eloquentjavascript.net/03_functions.html)
