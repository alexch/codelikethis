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

```js
if (account.profilePic === null) {
    showDefaultPicture();
} else {
    showPicture(account.profilePic);
}
```

# Null is dangerous

```js
let fruit = null
fruit.toUpperCase()
```

Please watch the instructor type this (or type it yourself) and then...

> *Read the error!*

# Errors are good

They tell you

* you made a mistake
* what that mistake was
* (sometimes) how to fix it

Please try to interpret this error:

```js
fruit.toUpperCase()
TypeError: Cannot read property 'toUpperCase' of null
```

# TypeError explained

```js
fruit.toUpperCase()
TypeError: Cannot read property 'toUpperCase' of null
```

* "`TypeError`" means "this is an error about data types" -- you thought you were using a string, but you weren't -- you were actually using `null` which is *not* a string

* "`Cannot read property 'toUpperCase'`" means "you asked the value for a property named `toUpperCase` but there was no such property"

* `of null` means "the value you were using was null"

This error is confusing because it *buries the lede* -- you must read all the way to the end before you find the relevant clue ("`null`"), and it *omits* the name of the variable whose value was null ("`fruit`").

Sadly, it is your job as a programmer to translate "TypeError: Cannot read property 'toUpperCase' of null" into "We expected the variable `fruit` to contain a string, but it contained `null` instead."

# null pointer errors

* null pointer errors are **very** common
* the trick is reading the error and figuring out
    1. *where* it happened (*which line*)
    2. *which variable* was null
    3. *why* it was null
* often once you know *which*, knowing *why* is obvious
    * but sometimes it's a puzzle and you have to trace back
    * e.g. the original problem was when *fruit was set to `null`*, but the error happened later, when the program tried to *use* `null` as if it were a string

# If You're Going To Fail...

Two failure recovery philosophies:

* fail fast, fail hard
* keep calm and carry on

Which idea is better?

Why or why not?

# Failure Recovery

*graceful* - generally good for users

  * provide information and context in non-technical language
  * help user accomplish their goal
  * allow user to try again immediately

*fail-fast* - generally good for coders

  * exposes errors early
  * forces you to think through "rainy day" scenarios
  * provides information about the state of the program at the moment the error happened

# JavaScript has several nulls

* `null` means "nothing"
* `undefined` means "i don't know"
* `NaN` means "not a number"
* `''` means "an empty string"

Docs: [MDN: null](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/null)

> This proliferation of nulls is generally a bad idea in language design, but JavaScript is stuck with them.

# Nulls are falsy

All of the nulls in the previous slide are *falsy*, so they will cause an `if` statement to fall through. This allows the code from the earlier example to be written concisely:

```js
if (user.profilePic) {
    showPicture(user.profilePic);
} else {
    showDefaultPicture();
}
```

If `user.profilePic` is either `null` or `undefined` (or `false` or `NaN` or `''`) then we will show the default picture, thus *avoiding* a null pointer error when trying to show `user.profilePic`.

The pattern of checking for a valid value before proceeding is sometimes called a *guard clause* or *defensive programming*.
