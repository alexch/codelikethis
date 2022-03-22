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

A **FUNCTION** is a **NAME** for a piece of code

```js
function greetByName(someName) {
  return 'Hello there! It is nice to meet you ' + someName + '.';
}
```

> This is similar to how a **variable** is a **name** for a piece of data

# Why Name a Piece of Code?

Here are some reasons why this is useful:

- Use code from several places in a file
- Perform the same procedure on different input values
- Organize your code into different 'modules' of functionality
- Limit visibility and access of variables, or values

# Function example

Here's an example function:

```js
function add(firstNum, secondNum) {
  let sum = firstNum + secondNum;
  return sum;
}
```

- `function` means, define a function
- `add` is the **name** of the function
- `firstNum, secondNum` are the **parameters** to the function, also called **arguments**
- `sum` is a **local variable** of the function
- `sum` is also the **return value** of the function

# Calling a Function

You call a function by referencing the name followed by parentheses:

```js
function add(firstNum, secondNum) {
  let sum = firstNum + secondNum;
  return sum;
}

add(2, 3)   // returns 5
add(12, 30) // returns 42
```

> This is also known as **executing** the function.

# Lab: One Nation, Divisible

A number is **divisible** by another if when you divide them, the **remainder** is `0`.

Write a function called `divisible` that:

- Accepts two numbers as parameters
- Returns `true` if the first number is divisible by the second number, and `false` otherwise

```js
function divisible(firstNum, secondNum) {
  // write your code here
}

divisible(100, 10)  // true
divisible(100, 7)   // false
divisible(3333, 11) // true
divisible(99, 12)   // false
```

> If you write the solution in a file, use `console.log(divisible(100, 7))` to print the `return` value.

# Divisible solution

<details>
<summary>Hint 1</summary>
<div>

The modulus operator `%` returns either an integer or zero.  Integers are truthy, while 0 is falsy.

</div>
</details>

<details>
<summary>Hint 2</summary>
<div>You may need to use some logic. You can create a simple control flow with an `if ...else` statement</div>

<pre>
  <code class="language-javascript">
  if(/*this expression evaluates true*/) {
    //do this
  } else {
    //otherwise do this
  }
  <code>
</pre>

</details>

<details>
<summary>Solution</summary>
<pre>
  <code class="language-javascript">
  function divisible(operator, operand) {
    if(operator % operand) {
      return true
    } else {
      return false
    }
  }

  divisible(100, 10) // => true
  <code>
</pre>
</details>

# Shouter

Here is a function that takes a String as input, and it `return`s a shouted version of that String.

```js
function shouter(someString) {
  let loudString = someString.toUpperCase();
  return loudString + '!!!';
}

shouter('i like pizza');
// 'I LIKE PIZZA!!!'
```

> The variable `loudString` is called a **local variable** and can only be used **inside** the function.

# Lab: Capitalize

Write a function called `capitalize` that:

- Accepts a one word string as a parameter.
- Returns a new **Capitalized** version of a word.
- Remember to only uppercase the first letter of the word.

```js
function capitalize(someWord) {
  // your code here
}

capitalize('tomato')
// 'Tomato'
```

> Remember there are many [string operations](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#instance_methods)

# Capitalize Lab Solution

<details>
  <summary>Hint One</summary>
<div>

Try getting the first letter from the String using indexing

<pre><code class="language-javascript">let firstLetter = string[0]<code></pre>

</div>
</details>

<details>
  <summary>Hint Two</summary>
<div>
Try using the method <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/slice">Slice</a>

<pre><code class="language-javascript">let restOfString = string.slice(1)<code></pre>

</div>
</details>

<details>
  <summary>Answer</summary>
  <pre><code class="language-javascript">
    function capitalize(word) {
      let firstLetter = word[0];
      let restOfWord = word.slice(1);
      return firstLetter.toUpperCase() + restOfWord.toLowerCase();
    }

    console.log(capitalize('smith'));
    console.log(capitalize('MACGUYVER'));
  <code></pre>
  <div>
  The variables `firstLetter` and `restOfWord` are called *local variables* and can only be used *inside* the `capitalize` function.
  </div>
</details>

# Passing Variables as Parameters

When you pass a **variable** to a function, that variable **value** is assigned to a **parameter**.

```js
let nameToShout = 'Grace Hopper';

shouter(nameToShout);
// 'GRACE HOPPER!!!'
```

> The variable name and parameter name **DO NOT** need to match

# Shouter Function Explanation

```js
let nameToShout = 'Grace Hopper';

function shouter(someString) {
  let loudString = someString.toUpperCase();
  return loudString + '!!!';
}

let result = shouter(nameToShout);
```

| Outside              | Inside              | Value               |
|----------------------|---------------------|---------------------|
| `nameToShout`        | `someString`        | `'Grace Hopper'`    |
|                      | `loudString`        | `'GRACE HOPPER'`    |
| `result`             |                     | `'GRACE HOPPER!!!'` |

# Lab: Age Calculator

Write a function named `ageInSeconds` that:

- Accepts a person's age in years
- Multiplies the age in years by the number of **seconds** in a year
- `return`s the person's age in **seconds**

```js
let age = 27;

function ageInSeconds(num) {
  // your code here
}

ageInSeconds(age);
// 'You are 852055200 seconds old'
```

# Age Function Reverse

Now write a reverse function that:

- Accepts a number of **seconds** as a **parameter**
- Divides the age in **seconds** by the number of seconds in a **year**
- `return`s the age in years, or fractions of a year

```javascript
let ageInSeconds = 852055200;

function ageInYears(seconds) {
  // your code here
}

ageInYears(ageInSeconds);
// 'You are 27 years old'
```

# Solution

Here's one solution for the ageInSeconds calculator:

<details>
<summary>Answer</summary>
  <pre><code class="language-javascript">
  let age = 27

  function ageInSeconds(num) {
    let secondsInMin = 60
    let minInHour = 60
    let hrInDay = 24
    let dayInYr = 365.25

    let secInYr = secondsInMin * minInHour * hrInDay * dayInYr

    let ageInSec = num * secInYr

    return ageInSec
  }

  console.log(ageInSeconds(age))
  <code></pre>
</details>

# Lab: Supply Calculator

Write a function named `supplyCalc` that:

- Accepts three arguments, a starting age, an amount per day, and an item name
- Calculates the amount of items used over the rest of your life, based on a 100 year max age
- `return`s 'You will need **Number** **Item**s to last the rest of your life.' e.g.

```js
supplyCalc(20, 3, 'cookie') 
// 'You will need 87600 cookies to last the rest of your life'
supplyCalc(99, 3, 'cakes')
// 'You will need 1095 cakes to last the rest of your life'
supplyCalc(0, 3, 'pies')
// 'You will need 109500 pies to last the rest of your life'
```

> Inspired by the Lifetime Supply Calculator lab designed for the Girl Develope It! curriculum. The original can be found [here](https://www.teaching-materials.org/javascript/exercises/functions)

# Supply Calculator Solution

<details>
<summary>Hint 1</summary>

Calculate the number of cookies needed per year

<pre><code class="language-javascript">
let amountPerYear = amountPerDay * 365
<code></pre>
</details>

<details>
<summary>Hint 2</summary>

Calculate the number of years of life left

<pre><code class="language-javascript">
let numberOfYears = 100 - age
<code></pre>
</details>

<details>
<summary>Solution</summary>

Use the number of cookies per year, and number of years of life, to calculate the total cookies

<pre><code class="language-javascript">
function supplyCalc(age, amountPerDay, item) {
  let amountPerYear = amountPerDay *365;
  let numberOfYears = 100 - age;
  let totalNeeded = amountPerYear* numberOfYears;

  return 'You will need' + totalNeeded + ' ' + item + 's to last the rest of your life';
}
<code></pre>
</details>

# Lab: Titleize

Write a function named `titleize` that:

- Accepts a string as an argument
- Splits apart the words in the string
- Capitalizes each word
- `return`s a string with the first letter of each word capitalized e.g.

```js
titleize('all dogs are good dogs');
// 'All Dogs Are Good Dogs'
titleize('eveRY green bus drives fAst');
// 'Every Green Bus Drives Fast'
titleize('FRIDAY IS THE LONGEST DAY');
// 'Friday Is The Longest Day'
```

# Titleize solution

<details>
<summary>Hint 1</summary>

Make a function to capitalize each word

<pre><code class="language-javascript">
function capitalize(word) {
  let firstLetter = word[0].toUpperCase();
  let restOfWord = word.slice(1).toLowerCase();
  return firstLetter + restOfWord;
}
<code></pre>
</details>

<details>
<summary>Hint 2</summary>

Split the words in the string into an Array of items

<pre><code class="language-javascript">
let wordArray = string.split(' ');
<code></pre>
</details>

<details>
<summary>Solution</summary>

Loop over every item in the Array of words, capitalize each, and then add them to a new string

<pre><code class="language-javascript">
function capitalize(word) {
  let firstLetter = word[0].toUpperCase();
  let restOfWord = word.slice(1).toLowerCase();
  return firstLetter + restOfWord;
}

function titleize(string) {
  let wordArray = string.split(' ');

  let newString = '';
  let wordsModified = 0;

  while (wordsModified < wordArray.length) {
    let currentWord = wordArray[wordsModified];
    let newWord = capitalize(currentWord);
    newString = newString + ' ' + newWord;
    wordsModified = wordsModified + 1;
  }

  return newString.trim();
}
<code></pre>
</details>

# More About Functions

- [FreeCodeCamp](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures)
  - start with the challenge [Write Reusable JavaScript with Functions](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/write-reusable-javascript-with-functions)
  - continue through the challenge [Assignment with a Returned Value](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/assignment-with-a-returned-value)

- Read [Eloquent JavaScript chapter 3](http://eloquentjavascript.net/03_functions.html)
