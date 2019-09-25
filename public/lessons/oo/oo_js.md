    link name: "The Secret Life of Objects",
         href: "http://eloquentjavascript.net/06_object.html",
         from: "EloquentJavaScript",
         description: "Though no one really agrees on its precise definition, object-oriented programming has shaped the design of many programming languages, including JavaScript."

# Object-Oriented JavaScript

This lesson assumes you are familiar with the usage of JavaScript [Objects](../javascript/objects) and [Methods](../javascript/methods) and the fact that JavaScript is a [hybrid language](../javascript/hybrid_styles).

JavaScript is a hybrid of (at least) three styles:

  * procedural
  * functional
  * object-oriented

In this lesson we explore how JavaScript implements *object-oriented* language features.

# What is an Object?

* an object is an *encapsulation* of *state* with *behavior*

> This is a simple definition, but many programmers either don't know it, don't understand it, or don't agree with it.

# Definition of Object

An object...

* *encapsulates* state and behavior
    * *state* aka data, properties, variables
    * *behavior* aka functions, methods, messages
    * *encapsulation* means "put similar things together; keep dissimilar things apart"
* responds to *messages* through an *interface*
  * a *message* corresponds to a *method* (mostly)

# Pure Object-Oriented Programming

* In pure OO, a method only directly uses two sources of non-local data
    * parameters of the method
    * properties of the method's own object
    * cf. the Law Of Demeter (more on this later)
* All other data are manipulated via *messages* sent to other objects (aka *method calls*)

# Pure Object-Oriented Example

```javascript
let rectangle = {
    height: 10,
    width: 8,
    area: function() {
        return this.height * this.width;
    }
}

let a = rectangle.area()
```

the above code follows OO rules since it only accesses data held inside `rectangle` via the magic pointer `this`, and returns a new value, not a live reference to internal state

# Using an Object, But Not Object-Oriented

Using the `rectangle` object from the previous slide, the following code is **not** object-oriented...

```javascript
let p = calculatePerimeter(rectangle);

function calculatePerimeter(rectangle) {
  return rectangle.height * 2 + rectangle.width * 2;
}
```

...since `height` and `width` are owned by `rectangle`, not by the `calculatePerimeter` function

Q: How would an OO design calculate the rectangle's perimeter? (Answer on next slide.)

# Pure Object-Oriented Example (Cont.)

instead, an OO design would add `perimeter` as a *method*, so `rectangle.perimiter()` would access properties with `this`, perform the calculation, and return the correct value:

```javascript
rectangle.perimeter = function() {
  return this.height * 2 + this.width * 2
}

let p = rectangle.perimeter()
```

# Object vs. Object

* In JS, an "object" is just a [hash](/lessons/javascript/hashes)
  * not very object-oriented
* To be object-oriented you need to add a few things
  * the "`this`" variable
  * constructors and `new`
  * inheritance (via prototypes (`__proto__` or `Type.prototype` or `class`))
  * privacy (aka *data hiding* or *encapsulation*)
* More on all those concepts coming soon!

# The Linguistic Metaphor for Objects

One way to think about objects: 

Objects are *things* that can be *described* and can *do* things, or...

  * Objects are nouns
    * (things)
  * Methods are verbs
    * (actions, behaviors, or imperative messages ("Sit! Good dog."))
  * Attributes are adjectives
    * (a property that describes a particular thing)
  * Classes are categories
    * (a noun that describes a *type* of thing, not a thing itself)

# Creating an object literally

This code 

```js
let dog = {color: "brown"}
```

1. creates a new object
2. gives that object a property named `'color'` whose value is `'brown'`
3. assigns the variable `dog` to point to that object

# References and Instances

* Imagine computer memory with two compartments: *references* and *instances*
  * also known as "the stack" (or "the scope") and "the heap"
  * also known as "pointers" and "values"
* References include *parameters* and *local variables*
* Instances contain the "real" data
* Each reference points at the location of an instance
  * every reference is the same size (just 32 bits, or maybe 64 bits)

| Stack |     | Heap    |
| ----- | --- | -----   |
| dog   | ->  | {color: "brown"} |

# Literals create instances

```
let abby = {color: "brown"}
let lula = {color: "brown"}
```

* `abby` refers to a new object *instance*
* `lula` refers to a *different*, new object instance with the same *value*

| Stack |     | Heap  |
| ----- | --- | ----- |
| abby  | ->  | {color: "brown"} |
| lula  | ->  | {color: "brown"} |

# Side effects

* a variable is a *reference* to an *instance* (persistent location in memory)
* if you have several references to the same instance, odd things can happen

```js
let abby = {color: "brown"}
let abby = dog
let lula = dog

lula.color = "gold"

abby.color // now we think that abby is gold too :-(
```

# Encapsulating State

Instance variables are *properties* of the object:

```js
if (abby.color === 'brown') {
  console.log("Abby is a brown dog.");
}
```

the DOT operator here says "get me the `color` that is attached to `abby`"

# Encapsulating Behavior

Instance *methods* are also *properties* of the object:

```js
let abby = {color: "brown"};
abby.speak = function() {
  console.log("Bark!")
}
abby.speak()     // prints "Bark!" to console
```

The above is fine as far as it goes, but it's not really object-oriented since `speak` isn't using any *state*...

# Encapsulation?

Unfortunately, in JavaScript, *any* code with a pointer to an object can see 
-- and modify! -- *all properties* of that object.

This means that true encapsulation is difficult, since all properties are public, and none are private.

Other languages solve this problem in various ways -- e.g. Java has a `private` keyword, and in Ruby all properties are private -- but JavaScript does not have a clean way of doing it... [at least not yet](https://github.com/tc39/proposal-class-fields).

To work around this deficiency there are several options, but none is ideal:
 * create variables *and accessors* inside your constructor [using closure scope](https://stackoverflow.com/questions/22156326/private-properties-in-javascript-es6-classes/28165599#28165599)
 * prefix private properties with `_`
 * use [WeakMaps](https://github.com/tc39/proposal-class-fields/blob/master/PRIVATE_SYNTAX_FAQ.md#how-can-you-model-encapsulation-using-weakmaps)
 * use [symbols](https://github.com/tc39/proposal-class-fields/blob/master/PRIVATE_SYNTAX_FAQ.md#how-can-you-provide-hidden-but-not-encapsulated-properties-using-symbols)


# "this" is it

* "this" is a magic variable that always points to the current object

```javascript
var circle = {radius: 2};
circle.circumference = function() {
    return Math.PI * 2 * this.radius;
}
console.log(circle.circumference()); // 12.566370614359172
```

* "this" allows one function (method) to operate on many states (instances)

```javascript
var biggerCircle = {radius: 4};
biggerCircle.circumference = circle.circumference;
console.log(biggerCircle.circumference()); // 25.132741228718345
```

### ...but "this" isn't always it!

# JS Gotcha: you must remember `this`

Even *inside* an object, you **must** remember to use `this.`, otherwise `radius` becomes a *global variable*, not a property.

```javascript
var circle = {radius: 2};
circle.circumference = function() {
    return Math.PI * 2 * radius;  // Oops! Forgot "this."
}
circle.circumference() // returns NaN
// (or says 'radius is not defined' if you're lucky)
```

This is a **terrible** mistake in the language design; it undercuts one of the core principles of computer language design, which is to make the *simplest* way to do something also the *easiest* way to do that thing.

# JS Gotcha: Fat Arrow and Binding

In most OO languages, the pointer `this` is managed automatically. Any time you're executing code inside class A, `this` is guaranteed to point to an instance of that class.

In JavaScript, `this` needs to be managed more actively. 

Specifically, during *callbacks* `this` still points to the *other* object -- the one that is *calling you back* -- **not** the object where the function is defined!

**One Solution**: the `=>` fat arrow *re-binds* `this` to point to the *current* object immediately before executing the function.

# More on "this" and binding

* `this` is only set when you call a function *via* an object

```javascript
circle1.circumference()      // OK -- this = circle1
circle2['circumference']()   // OK -- this = circle2
```

* when called *sans* object, `this` points to the **global object** (usually `window`)

```javascript
var g = circle.circumference;
g();                        // BAD -- this = window, so this.radius = undefined, so result is NaN
```

# re-binding

* so if you want to use a *method* as a *callback*, you must *bind* it like this:

```javascript
var module = {
  x: 42,
  getX: function() {
    return this.x;
  }
}

var unboundGetX = module.getX;
console.log(unboundGetX());
// expected output: undefined

var boundGetX = unboundGetX.bind(module);
console.log(boundGetX());
// expected output: 42
```

see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_objects/Function/bind
