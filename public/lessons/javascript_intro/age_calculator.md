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

# Flip it!

Can you write the inverse function; one that takes a number of seconds and tells you the exact age?

You can get the current date by calling `Date.now()` which will give you a time in milliseconds, and the date you were born by createing a new `Date` object. You can then figure out the time that's elapsed in milliseconds by subtracting the date you were born from the current date

```javascript
  let date = new Date(1992, 05, 12, 3, 14) //new Date(year, month, day, hour, minute)
  let ageInMilliSec = Date.now() - date
```
