    topic name: "errors"
    topic name: "values"
    topic name: "null"
    topic name: "undefined"
    topic name: "falsy"
    link  from: "Mozilla Developer Network",
          name: "Null Reference",
          href: "https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/null"

# Null

*null* is the value that means "there is no value"

> Q: What is the sound of one hand clapping?

> A: `null`

# Null is useful

Null is used in cases where "nothing yet" is a valid scenario.

For instance, if a user has an account, but doesn't (yet) have a profile picture, `account.profilePic` may be `null`.

Then you can test for that case, e.g.

![Control Flow Diagram](/images/control-flow.png)


# Null is dangerous

```js
let fruit = 'apple'

fruit.toUpperCase()

console.log(fruit)

fruit = null
fruit.toUpperCase()
```

Please watch the instructor type this (or type it yourself) and then...

> *Read the error!*

# TypeError explained

```js
fruit.toUpperCase()
TypeError: Cannot read property 'toUpperCase' of null
```

* "`TypeError`" means "this is an error about data types" -- you thought you were using a string, but you weren't -- you were actually using `null` which is *not* a string

* "`Cannot read property 'toUpperCase'`" means "you asked the value for a property named `toUpperCase` but there was no such property"

* `of null` means "the value you were using was null"

This error can be confusing, because it doesn't tell you the name of the variable that was null.

# JavaScript has several "empty" values

* `null`
* `undefined`
* `NaN`
* `''`
* `0`
* `false`

Docs: [MDN: null](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/null)

> This proliferation of nulls is generally a bad idea in language design, but JavaScript is stuck with them.

# Null

The `null` keyword in Javascript means nothing. It is the language's way of saying "there is no value."  The `null` keyword is often put in to a program by the programmer to stand in for a value that will be set later.

# Undefined

`undefined` is JavaScript's way of saying "I don't know." This is probably the most common empty value, and can creep into your program in a number of ways.  Accessing a property that doesn't exist on an object, and trying to call a variable name which hasn't been defined yet are both common ways of getting an `undefined` value.  Functions with no `return` statement return `undefined` by default

# NaN

`NaN` means "not a number" and is the value you get when you try and convert a type to a number that can not be parsed as a number. Any arithmetic equation that `NaN` is a part of will evaluate to `NaN` as any number when combined with `NaN` is no longer a valid number.

# Empty String

The empty string `''` is a string without any chaarcters **at all** in it. A common way for it to get into a program is as a value from a form section that has not been filled out.
> Note: A string conataining only white space `" "` is not an empty string and will evaluate as `true` since all strings are truthy

# Zero

The number `0`, like in mathematics, is an empty value. It is a number that has no value, and so is treated as an empty value in JavaScript.

# False

The keyword `false` is a boolean value that means "not true." It is usually not set directly, but is rather the evaluation of an expression,although there are some instances where you may want to specifically set a variable or property to `false`.

# Emptyness is falsy

All of the empty values in the previous slides are *falsy*, so they will cause an `if` statement to fall through. This allows the code from the earlier example to be written concisely:

![Gaurd Clause Diagram](/images/gaurd-clause.png)

If `user.profilePic` is either `null` or `undefined` (or `false` or `NaN` or `''`, or `0`) then we will show the default picture, thus *avoiding* a null pointer error when trying to show `user.profilePic`.

The pattern of checking for a valid value before proceeding is sometimes called a *guard clause* or *defensive programming*.

> Note the string versions of empty values ("false", "0", "NaN", etc.) are **not** falsy as they are not empty strings, and are no longer keywords. Anything wrapped in quotations is just a string, nothing more, nothing less.
