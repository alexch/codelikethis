# Lab: Age Calculator

Write a function that calculates the number of seconds old you are when given your age

```javascript
let age = 27

function ageCalc (num) {
  //Your code goes here
}

ageCalc(age) // should print "You are 852055200 seconds old." to the console
```

How could we use ARGV to make this more modular?

# Flip it around!

Can you write the inverse function; one that takes a number of seconds and tells you the exact age?

You can get the current date by calling `Date.now()` which will give you a time in milliseconds, and the date you were born by createing a new `Date` object. You can then figure out the time that's elapsed in milliseconds by subtracting the date you were born from the current date

```javascript
  let date = new Date(1992, 05, 12, 3, 14) //new Date(year, month, day, hour, minute)
  let ageInMilliSec = Date.now() - date
```

# Solution

Here's one solution for the age calculator:

<details>
<summary>Answer</summary>
<div>

```js
let age = 27

function ageCalc(num) {
  let secondsInMin = 60
  let minInHour = 60
  let hrInDay = 24
  let dayInYr = 365.25

  let secInYr = secondsInMin * minInHour * hrInDay * dayInYr

  let ageInSec = num * secInYr

  return ageInSec
}

console.log(ageCalc(age))

```

To flip it you could simply divide the `num` variable by `secInYr` rather than multiplying to get years in a number of seconds.

</div>
</details>




# More Functional Labs

## Supply Calculator

Write a function that:

* accepts three arguments, an age, an amount per day, and an item
* calculates the amount of items used over the course fo the rest of your life (based on a constant max age)
* Outputs "You will need **Number** **Item**s to last the rest of your life." e.g.

```js
supplyCal(20, 3, "cookie") // => "You will need 87600 cookies to last the rest of your life"
```

> Supply Calculator inspired by the Lifetime Supply Calculator lab designed for the Girl Develope It! curriculum. The original can be found [here](https://www.teaching-materials.org/javascript/exercises/functions)

## Titilize

Write a function that:

* accepts a string as an argument
* splits apart the words in the string
* capitalizes each word
* returns a string with the first letter of each word capitalized e.g.

```js
titilize("eveRY green bus drives fAst") // => "Every Green Bus Drives Fast"
```

## MadLibs

Write a function that:

* accepts 3 arguments, the subject (noun), action (verb), and direct object (noun)
* outputs a message saying " **noun** **verb**ed the **noun**!" e.g.

```js
madLib('Bill', 'jump', 'dog') // => "Bill jumped the dog!"
```

* Bonus: sanatize your inputs so the first word is *always* capitalized, and the other two words are *always* lowercase.

* Double Extra Bonus: Expand this to a whole madlib story, not just a single sentence.
