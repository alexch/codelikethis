    topic name: "comparisons"
    topic name: "booleans"
    topic name: "conditionals"
    topic name: "if-then"
    topic name: "if-else"
    topic name: "truthy-falsy"
    topic name: "assignment"
    topic name: "operators"
    topic name: "conjunctions"
    topic name: "node"
    topic name: "functions"
    topic name: "values"

# Truthiness

Computers have a very particular idea of when things are *true* and *false*.

# True or False?

Try the following in node:

* `1 < 2`
* `2 + 2 < 4`
* `2 + 2 <= 4`
* `"anonymous".endsWith("us")`
* `"every journey".startsWith("a step")`

# Comparisons

*Comparison operators* let you compare two values. JavaScript has all the usual suspects...

|Operator|Comparison|
|---|---|
| `<` | less than |
| `>` | greater than |
| `<=` | less than or equal to |
| `>=` | greater than or equal to |
| `==` | equal to |
| `!=` | not equal |
| `===` | *really* equal to |
| `!==` | *really* not equal to |

[MDN: comparison operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Comparison_Operators)

These are also called "Boolean operators" after *[George Boole](https://en.wikipedia.org/wiki/George_Boole)*,
a 19th-century mathematician who invented [Boolean algebra](https://en.wikipedia.org/wiki/Boolean_algebra).)

# Conditions

The magic word `if` is a *conditional*.

The phrase immediately after `if` is a *condition*.

```js
if (age < 18) {
  console.log("Sorry, you can't vote yet.");
}
```

|phrase|meaning|
|---|---|
| `if (` ... `)`      | **if** this condition's value is *truthy* |
| `{` ... `}`         | **then** run this block of code |

Wait a second. "Truthy?"

[MDN: if...else](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/if...else)

# What is truthiness?

![Truthiness](/images/truthiness.png)

* in the Colbert Report, [truthiness](https://en.wikipedia.org/wiki/Truthiness) means things we *feel* to be true, even though we know they're probably not

* In JavaScript, **all** values have truthiness **unless** they are defined as falsy.

* [MDN: Truthy](https://developer.mozilla.org/en-US/docs/Glossary/Truthy)

# What is falsiness?

`false`, `null`, `undefined`, `0`, `NaN`, and the empty string (`""`) are all falsy.

Fortunately, `true` is truthy and `false` is falsy.

Unfortunately, the string `"false"` is truthy, and the string `"0"` is truthy, even though the number `0` is falsy. This is because the string contains a character, and, even though the character is `0`, any string with at least one character is truthy.

[MDN: Falsy](https://developer.mozilla.org/en-US/docs/Glossary/Falsy)

# if... then... else...

The magic word `else` allows **BRANCHING**.

```js
if (age >= 18) {
  console.log("allowed");
} else {
  console.log("denied");
}
```

Like a fork in the road, the program chooses one path or the other.

It takes the first path if the condition is truthy, and takes the second path if the condition is falsy.

# 2 + 2 = ?

Sadly, this mathematical expression:

    2 + 2 = 4

causes an error. You need to do

    2 + 2 == 4

instead. Why?

# The Tragedy of the Equal Sign

* a single equal sign means ASSIGNMENT
  * `name = "Alice"` -- "assign the value 'Alice' to the variable 'name'"
* two equal signs means COMPARISON
  * `name == "Alice"` -- "does the variable 'name' contain the string 'Alice'?"

> This is confusing! (More about it on the next slide.)

# A Notorious Bad Idea

> "A **notorious example for a bad idea** was the choice of the equal sign to denote assignment. It goes back to Fortran in 1957 and **has blindly been copied by armies of language designers**. Why is it a bad idea? Because it overthrows a century old tradition to let "=" denote a comparison for equality, a predicate which is either true or false. But Fortran made it to mean assignment, the **enforcing** of equality... `x = y` does not mean the same thing as `y = x`."
>
> — [Niklaus Wirth](https://en.wikipedia.org/wiki/Niklaus_Wirth), Good Ideas, Through the Looking Glass (2005)

see also http://en.wikipedia.org/wiki/Assignment_%28computer_science%29#Assignment_versus_equality

# Condition or Assignment?

> BEWARE of using a single equal sign inside an `if` condition!

* the value of a comparison is either `true` or `false`
  * so `if (x == 2)` means `if x is 2` which changes based on `x`

* the value of an assignment is the *value being assigned*
  * so `if (x = 2)` means `if 2` which is *always truthy*
  * also, the value of `x` will be 2 afterwards, no matter what it was before

# The Tragedy of the Threequal Sign

In addition to `=` and `==`, JavaScript also has `===`.

That's three equal signs in a row.

|Operator|Operation|Example|Meaning|
|---|---|---|---|
| `=`   | assignment         | `X = Y`  | let X equal Y |
| `==`  | comparison (fuzzy) | `X == Y` | does X *mostly* equal Y? |
| `===` | comparison (exact) | `X === Y`  | does X *really* equal Y? |

`==` means "does X equal Y, or if not, can Y be *converted* into something that equals X?"

Since the rules for type conversion are confusing, most JavaScript experts recommend:

> always use `===`, never use `==`

> Using `==` can have some very interesting side effects, see [Stackoverflow](https://stackoverflow.com/questions/359494/which-equals-operator-vs-should-be-used-in-javascript-comparisons)

# Conjunction Junction

You can make more complicated logical expressions using conjunctions:

|Conjunction|Operator|Example|Meaning|
|---|---|---|---|
| AND | `&&` | `X && Y` | "are both X and Y true?" |
| OR | <code>&#124;&#124;</code> | <code>X &#124;&#124; Y</code> | "is either X or Y (or both) true?" |
| NOT | `!`  | `!X` | "is X false?" |

For example:

```js
if (age >= 18 || hasPermissionSlip()) {
  console.log("allowed");
} else {
  console.log("denied");
}
```

[MDN: logical operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Logical_Operators)

# LAB: Good Friend, Bad Friend

* Your [`hello.js` program](./input-and-output#lab_hello_friend) should currently look something like this:

```js
console.log("What is your name?");
process.stdin.once('data', (chunk) => {
    let name = chunk.toString().trim();
    console.log("Hello, " + name + "!");
});
```

* Now change `hello.js` so that it doesn't always say hello!
  * If the user's name is "Darth" then say "Noooooo! That's impossible!"

# Good Friend, Bad Friend solution

<details>
<summary>Solution</summary>
<div>

```js
console.log("What is your name?");
process.stdin.on('data', (chunk) => {
    let name = chunk.toString().trim();
    if (name === "Darth") {
      console.log("Noooooo! That's impossible!")
    } else {
      console.log("Hello, " + name + "!");
    }
});
```

</div>
</details>

# Lab: Infinite Names

* Change `hello.js` so it keeps asking for names forever...
  * ...unless and until someone says their name is "bye!"
  * then it stops and exits back to the terminal

# Infinite Names solution

<details>
<summary>Hint 1</summary>
<div>
Using `.on` instead of `.once` will keep the process running

</div>
</details>

<details>
<summary>Hint 2</summary>
<div>
Remember

```js
process.exit()
```

will end your program.
</div>
</details>


<details>
<summary>Solution</summary>
<div>

```js
console.log("What is your name?");
process.stdin.on('data', (chunk) => {
    let name = chunk.toString().trim();
    if (name === "bye!") {
      process.exit()
    }else if (name === "Darth") {
      console.log("Noooooo! That's impossible!\nWhat is your name?")
    } else {
      console.log("Hello, " + name + "!\nWhat is your name?");
    }
});
```

</div>
</details>

# LAB: Enemies List

* Change `hello.js` so that it says "Go away!" if the user's name is any one of a number of evil names
* For instance, Voldemort, Satan, Lex Luthor...
* Bonus: don't let enemies sneak in even if they spell their names with capital letters, like `VolDeMort`

# Enemies List solution

<details>
<summary>Hint</summary>
<div>
You can do multiple checks in a single if statement by using the logical "or" operator: `||`

```js
if(checkOne || checkTwo || checkThree) {
  //this block of code runs if any of the checks are true
}

```

</div>
</details>

<details>
<summary>Solution</summary>
<div>

```js
console.log("What is your name?");
process.stdin.on('data', (chunk) => {
    let name = chunk.toString().trim();
    if (name === "bye!") {
      process.exit()
    }else if (name === "Darth" || name === "Sauron" || name === "Voldemort") {
      console.log("Noooooo! That's impossible!\nWhat is your name?")
    } else {
      console.log("Hello, " + name + "!\nWhat is your name?");
    }
});
```

</div>
</details>

# Lab: exercises about logic

* FreeCodeCamp:
  * From [Understanding Boolean Values](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/understanding-boolean-values)
  * up to [Chaining if-else statements](https://learn.freecodecamp.org/javascript-algorithms-and-data-structures/basic-javascript/chaining-if-else-statements)
