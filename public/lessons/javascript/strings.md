    topic name: "strings"
    topic name: "comparisons"
    topic name: "characters"
    topic name: "string-methods"
    link href: "https://hackernoon.com/what-every-programmer-should-know-about-string-a6611537f84e"

# String Literals

- The word **LITERAL** means "exactly as written"
- A **String literal** is a string, whose characters are written out explicitly in your code
- JavaScript string literals are **surrounded** with either single quotes (`'`) or double quotes (`"`)

```js
'My dog has fleas'
"Vermont has a hundred words for 'snow'"
```

---

# Escaping Strings

- Some characters cannot be typed **literally**, you need to use an **escape character** to represent it
- Backslash (<kbd>\\</kbd>) is the *escape character* in JavaScript strings
- A backslash means **the next character means something special**
  - For instance backslash-n (`\n`) means **newline**

```js
console.log('Roses are red,\nViolets are blue;\nCandy is sweet,\nAnd so are you.')
```

---

# Lab: String Formatting

How could you format the following string to print in the format below?

`'Roses are red, Violets are blue; Candy is sweet, And so are you.'`

```txt
'Roses are red,
  Violets are blue;
    Candy is sweet,
      And so are you.'
```

---

# String Messages

A string understands lots of **messages**.

Here are some of them.

```js
'drive' + 'way'
'Java' + "Script"
'banana'.length
'titanic'.toUpperCase()
'QUIETLY'.toLowerCase()
'Hello'.concat(', world!')
'All dogs are good dogs'.replaceAll('dogs', 'puppers')
'Java'.repeat(10)
'berry'.charAt(0)
'berry'.charAt(1)
'banana'.includes('nan')
'banana'.endsWith('ana')
'blueberry'.replace('blue', 'black')
```

Try them out in an interactive `node` shell, or a JavaScript file in an editor.

Check out [MDN String](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String) docs for more.

---

# Lab: Combining Concepts

Practice combining operators and methods.

Given the following String, can you send messages to it to match the formatting below?

```js
'this is a fantastic string'
```

```txt
THIS
IS
A
FANTASTIC
STRING
```

> Remember the messages you saw in the prior slide.

<details>
<summary>Hint 1</summary>

<div>
You can chain multiple methods off of each other by calling them one after another. e.g.

<pre><code class="language-javascript">"Hello".repeat(3).toUpperCase()<code></pre>

</div>
</details>

<details>
<summary>Hint 2</summary>

<div>

There is a message that can substitute all the `subString` values in a string with the `newValue`.

<pre><code class="language-javascript">.replaceAll(subString, newValue)<code></pre>

</div>
</details>

<details>
<summary>Hint 3</summary>

<div>

The newline character can be used to create line breaks.
<pre><code class="language-javascript">'\n'<code></pre>

</div>
</details>

---

# String Slicing

You can extract sub-parts of a string using `slice`

```js
// "slice from character 0 to character 4"
"blueberry".slice(0, 4) 

// "slice from character 4 to the end
"blueberry".slice(4)
```

The first number is which character to start from.

The second number is which character to end on.

[MDN: slice](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/slice)

---

# String Indexing

Indexes are the positions of characters within a String.

```txt
| B | L | U | E | B | E | R | R | Y |
0   1   2   3   4   5   6   7   8   9
```

Then `'blueberry'.slice(0, 4)`
  
- Includes the characters to the **right** of the start index
- Includes the characters to the **left** of the end index
- And **excludes** the character to the **right** of the end index

---

# Lab: Breaking Up Strings

Use the **Starting String** below, some operators, and multiple uses of `.slice()` to create the **Target Final String**.

Starting String

```js
'strawberry banana milk shake'
```

Target Final String

```js
'blueberry shake'
```

> Hint: You can create variables using `let` to store sub-strings.

---

# Characters

A string is composed of a sequence of characters.

A character is a Number, or **character code**, that stands for a **symbol**.

|symbol|code |name         |
|------|-----|-------------|
| `A`  | 65  | capital A   |
| `B`  | 66  | capital B   |
| `Z`  | 90  | capital Z   |
| `_`  | 95  | underscore  |
| `a`  | 97  | lowercase A |
| ???  | 10  | newline     |

> Some characters stand for symbols like `newline` or `tab`

---

# ASCII Characters

- ASCII: American Standard Code for Information Interchange
- Invented in 1963 in the United States

![ASCII Table](/images/ASCII-Table-wide.svg)

> Credit [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:ASCII-Table-wide.svg))

---

# Unicode Characters

- ASCII only goes from 0 to 127
- Unicode is the same as ASCII for values from 0 and 127
- Currently more than 130,000 characters, including symbols for
  - 139 modern and historic scripts
  - Accents and other diacritics
  - Various mathematical ∞, currency £, and cultural ☮ symbols
  - Also, [emoji](https://en.wikipedia.org/wiki/Emoji) 😂😂😂😂

---
  
# Unicode Strings

JavaScript strings are Unicode

> That means you can use emoji in your JavaScript programs!

Like the following:

```js
'😂'.repeat(10)
// '😂😂😂😂😂😂😂😂😂😂'

'😂'.codePointAt(0)
// 128514

String.fromCodePoint(128514)
// '😂'
```

> This **may** not work by default in Windows Cmd or PowerShell

---

# Comparing Strings

JavaScript strings respond to the `<` and `>` operators.

```js
> 'apple' > 'cherry'
false
> 'banana' < 'cherry'
true
```

> Strings are compared **one character at a time** using the **Unicode values** of each character.

---

# Lab: Apple vs. Apricot

Which of these Strings is considered greater than the other?

```js
'apple' > 'apricot'
```

> Think through this comparison first, then check it in JavaScript.

---

# Comparing Strings: Explanation

When comparing`'apple' > 'apricot'`, JavaScript does this behind the scenes:

```js
'apple'.charCodeAt(0) > 'apricot'.charCodeAt(0);
// value: 97

'apple'.charCodeAt(1) > 'apricot'.charCodeAt(1);
// value: 112

'apple'.charCodeAt(2) > 'apricot'.charCodeAt(2);
// value: 114
```

> In the above, 112 is less than 114, so the comparison stops there and returns `false`.

---

# Comparing Strings: Cont

In both ASCII and Unicode, uppercase characters (codes 65 to 90) and lowercase letters (codes 97 to 122) are different.

> That means that **all** uppercase strings are considered less than **all** lowercase strings.

```js
> 'apple' < 'banana'
true
> 'apple' < 'BANANA'
false
```
