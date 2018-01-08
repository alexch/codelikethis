# Null

*null* is a magic pointer

# There Is No Spoon

![Neo With Spoon](../images/spoon.jpg)

*null* is the pointer to an object that means "there is no object"

# Experiment

    @@@ js
    let fruit = "apple"
    fruit = null
    fruit.toUpperCase()

*Read the error!*

# Errors are good

They tell you

* you made a mistake
* what that mistake was
* (sometimes) how to fix it

Interpret this error:

    @@@ js
    fruit.toUpperCase()
    TypeError: Cannot read property 'toUpperCase' of null

# null pointer errors

* null pointer errors are very common
* the trick is reading the error and figuring out
    1. *where* it happened (*which line*)
    2. *which variable* was null
    3. *why* it was null
* often once you know *which*, knowing *why* is obvious
    * but sometimes it's a puzzle

# If You're Going To Fail...

Two philosophies:

* fail hard, fail fast
* keep calm and carry on

Which idea is better?

Why or why not?

# JavaScript has several nulls

* `null`
* `undefined`
* `NaN`

```js
@@@ js
typeof null          // "object" (not "null" for legacy reasons)
typeof undefined     // "undefined"
null === undefined   // false
null == undefined    // true
null === null        // true
null == null         // true
!null                // true
1 + null             // 1
1 + undefined        // NaN
```

Docs: [MDN: null](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/null)
