    topic name: "comparisons"
    topic name: "booleans"
    topic name: "conditionals"
    topic name: "assignment"
    topic name: "operators"
    topic name: "functions"
    topic name: "values"

# Conditional Logic

In order to make a **DECISION**, a program needs to use **LOGIC** expressions and **CONDITIONAL** statements.

# True or False?

Execute following using a JavaScript file, or `node`

* `1 < 2`
* `2 + 2 < 4`
* `2 + 2 <= 4`
* `"anonymous".endsWith("us")`
* `"every journey".startsWith("a step")`

# Comparison Operators

**Comparison Operators** allow for the comparison of two values.

Every *comparison* **EVALUATES** to `true` OR `false`

|Operator | Comparison               |
|---------|--------------------------|
| `<`     | less than                |
| `>`     | greater than             |
| `<=`    | less than or equal to    |
| `>=`    | greater than or equal to |
| `==`    | equal to                 |
| `!=`    | not equal                |
| `===`   | identical                |
| `!==`   | not identical to         |

[MDN: comparison operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Comparison_Operators)

# Conditional Statements

The key word `if` is used to create a **CONDITIONAL**

The **EXPRESSION** following the `if` is the **TEST**

When the **TEST** evaluates to **TRUE** the code in the body runs

```js
let age = 17;
if (age < 18) {
  console.log('Sorry, you cannot vote yet.');
}
```

[MDN: Conditional Statements](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/if...else)

# What is True

Any **VALUE** or **EXPRESSION** that **EVALUATES** to a non-false value is **EQUIVALENT** to **TRUE**

```js
// examples of true values and expressions
true
'Hello'
'false'
123 > 42
'     '
'456'.length
Infinity + Infinity
{ name: 'Grace Hopper' }
['blue', 'green']
```

* [MDN: What is Truthy](https://developer.mozilla.org/en-US/docs/Glossary/Truthy)

# What is False

The only **VALUES** considered **EQUIVALENT** to **FALSE** are listed below

```js
false
null
undefined
''
0
-0
NaN
```

[MDN: What is False](https://developer.mozilla.org/en-US/docs/Glossary/Falsy)

# If..Else

The keyword `else` allows for a **CONDITIONAL** to **BRANCH**.

```js
let age = 17;

if ( age >= 18 ) {
  console.log('You are allowed to vote.');
} else {
  console.log('Sorry, you cannot vote yet.');
}
```

# If..Else Nesting

It is possible to nest **CONDITIONAL** statements, but it can become confusing.

```js
let age = 17;

if (age >= 18 /* first test */) {
  if (hasPermission /* second test */) {
    console.log('You have special permission.');
  } else /* first else */ {
    console.log('You are allowed to vote.');
  } 
} else /* second else */ {
  console.log('Sorry, you cannot vote yet.');
}
```

# If..Else..If

The keywords `else if` allow for the chaining of **CONDITIONAL**s, which can be easier to understand.

```js
let age = 17;

if (age >= 18) {
  console.log('You are allowed to vote.');
} else if (hasPermission) {
  console.log('You have special permission.');
} else {
  console.log('Sorry, you cannot vote yet.');
}
```

# Logical Operators

You can make more complicated logical expressions using conjunctions:

|Conjunction|Operator                   |Example                        |Meaning                   |
|-----------|---------------------------|-------------------------------|--------------------------|
| AND       | `&&`                      | `X && Y`                      | "Are both X and Y true?" |
| OR        | <code>&#124;&#124;</code> | <code>X &#124;&#124; Y</code> | "Is either X or Y true?" |
| NOT       | `!`                       | `!X`                          | "reverse the value of X" |

[MDN: Logical Operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Logical_Operators)

# Logical Operator Examples

```js
if (age >= 18 || hasPermission) {
  console.log('You are allowed to vote.');
} else {
  console.log('Sorry, you cannot vote yet.');
}
```

[MDN: Logical Operators](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Logical_Operators)

# LAB: Good Friend, Bad Friend

Create a file named `hello-friend.js`, that:

* Forcefully rebukes a person **IF** they are an enemy like:
  * `darth vader`, `voldemort`, `palatine`, or `lex luthor`
* Otherwise, greets a person warmly with their name as a friend.
* **IF** the name is exactly "darth vader", reply "Noooooo! That's impossible!"

```js
function respond(name) {
  if (/* the name is an enemy */) {
    /* check if their name is 'darth vader' */
    /* tell them to go away */
  } else {
    /* greet them warmly by their name */
  }
}
```

# Good Friend, Bad Friend Solution

<details>
<summary>Solution</summary>
<div>
<pre>
<code class="language-javascript">
function respond(name) {
  if (name === 'darth vader') {
    console.log('Noooooo! That is impossible!')
  } else if (name === 'voldemort' || name === 'palpatine' || name === 'lex luthor') {
    console.log('Be gone, you villain!!!')
  } else {
    console.log('Hello ' + name + ', you are a wonderful friend!');
  }
}

start();
</code>
</pre>
</div>
</details>

# Good Friend, Bad Friend List

Update the code in `good-friend.js` from the prior lab to use a list of enemy names, such as:

* `darth vader`, `voldemort`, `palatine`, or `lex luthor`

How could you use a `while` or `for` loop, in combination with conditionals to do this?

```js
let enemyList = ['darth vader', 'voldemort', 'palatine', 'lex luthor'];

function respond(name) {
  if (/* the name is on the enemy list */) {
    /* check if their name is 'darth vader' */
    /* tell them to go away */
  } else {
    /* greet them warmly by their name */
  }
}
