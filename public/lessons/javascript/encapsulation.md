# Encapsulation in JavaScript

*encapsulation* is an important principle of software design

essentially it means:

> Keep similar things together; keep different things apart.

# Why encapsulate?

* limit state mutations
* limit reach of bugs 
* *increase cohesion* of data & the code that loves it
* *decrease coupling* of unrelated program features
* focus on one thing at a time
  * so you know where in your code to look

> "Do one thing, and do it well" is the encapsulator's motto

Remember, the computer doesn't care about your fancy design, but humans will, so keep it simple.

# OO?

Encapsulation is an important part of *[object-oriented design](/lessons/oo)*

but it's not the only part (there's also inheritance, polymorphism, interfaces, etc.)

and you can use encapsulation on its own

# Example

```js
@@@ js
let createCircle = function(radius) {
    return {
        area: function() {
            return radius * radius * Math.PI;
        }
    }
};

let circle = createCircle(3);

console.log("Area is " + circle.area());
console.log("Radius is " + circle.radius); // THIS WILL FAIL
```

* In the above code, `radius` is only visible inside the *scope* of the function `createCircle`. 

  * This is normal; any parameter or local variable is only visible inside its function.

  * It's also visible inside the `area` function since that function is defined *inside* the function `createCircle`.

* `area` is a property on the hash (JS object) that is returned by `createCircle`

  * This means that `area` is visible to the caller of `createCircle`

* So, `area` is exposed but `radius` is hidden. In other words...

> `radius` is **encapsulated** inside `circle`

# Example 2: ivars

*instance variables* are encapsulated inside an "instance" (a particular copy of the object)

```js
@@@ js
let createCircle = function(radius) {
    let diameter = radius * 2;

    return {
        area: function() {
            return radius * radius * Math.PI;
        },
        circumference: function() {
            return diameter * Math.PI;
        }
    }
};

let circle = createCircle(3);
console.log("Area is " + circle.area());
```

# Example 3: IIFE

* The following cryptic syntax is very common in JS
* It's essentially the same as the previous code, but combining two steps into one
* It's called an **IIFE** = Immediately Invoked Function Expression

 `(function(){ })();`


Expanded:

```
(  function() {   }  ) ();
   ^define             ^invoke
```

Example:

```js
@@@ js
let circle = (function(radius) {
    let diameter = radius * 2;

    return {
        area: function() {
            return radius * radius * Math.PI;
        },
        circumference: function() {
            return diameter * Math.PI;
        }
    }
})(3);
console.log("Area is " + circle.area());
```

<https://developer.mozilla.org/en-US/docs/Glossary/IIFE>

# Example 4: private functions

[TODO: exmaple]

**Beware**: private functions are difficult to write unit tests for.
