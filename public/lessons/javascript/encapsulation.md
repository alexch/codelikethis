    @description = "Encapsulation is an important part of Object-Oriented programming, but we don't need objects to achieve it. This lesson covers using scope and IIFEs to make truly private variables in JavaScript without classes or prototypes."
    link href: "https://www.youtube.com/watch?v=HcW5-P2SNec"
    topic name: "encapsulation"
    topic name: "closure-scope"
    topic name: "private-variable"
    topic name: "immediately-invoked-function-expressions"

# Encapsulation in JavaScript

[encapsulation](https://en.wikipedia.org/wiki/Encapsulation_(computer_programming)) is an important principle of software design

essentially it means:

> Keep similar things together; keep different things apart.

Two related and overlapping concepts are [information hiding](https://en.wikipedia.org/wiki/Information_hiding) and [decomposition](https://en.wikipedia.org/wiki/Decomposition_(computer_science)).

# Why encapsulate?

* keep *code* and *the data it uses* together
* limit state mutations (to a single file or a contiguous block of code)
* limit reach of bugs
* *increase cohesion* of data & the code that loves it
* *decrease coupling* of unrelated program features
* focus on one thing at a time
  * so you know where in your code to look

> "Do one thing, and do it well" is the encapsulator's motto

# Encapsulation is for Humans

Remember, the computer doesn't care about your fancy design, but humans will, so keep it simple.

# OO?

Encapsulation is an important part of *[object-oriented design](../oo)*

but it's not the only part (there's also inheritance, polymorphism, interfaces, etc.)

and you can use encapsulation on its own

# Encapsulation Technique 1: closure scope

Here's a *factory function* that creates & returns a circle object:

```js
function createCircle(radius) {
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

# Encapsulation Technique 2: private variables

*private variables* are encapsulated inside a closure:

```js
function createCircle(radius) {
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

Note that only `area` and `circumference` are exposed via a pointer to the circle; `diameter` and `radius` are private.

# Encapsulation Technique 3: IIFE

* The following cryptic syntax is very common in JS
* It's essentially the same as the previous code, but combining two steps into one
* It's called an **IIFE** = Immediately Invoked Function Expression

```js
(function(){ })();
```

Expanded:

![IIFE Example](/images/iife-breakdown.png)

The trick is, when you *invoke* the function, you generate a *new scope* for that invocation's closure.

You then *preserve* that scope by returning a pointer to an object that you created *inside* that closure.

# Encapsulation with IIFE Example

Example:

```js
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

