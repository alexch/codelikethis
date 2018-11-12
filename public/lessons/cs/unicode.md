# Characters

Q: A string is "a series of characters"... but what is a character?

A: a character is a *number* (or *character code*) that stands for a *symbol*.

|symbol|code|name|
|---|---|---|
| `A` | 65 | capital A |
| `B` | 66 | capital B |
| `Z` | 90 | capital Z |
| `_` | 95 | underscore |
| `a` | 97 | lowercase A |
| ??? | 10 | newline |

(Some characters stand for *unprintable* symbols like `newline` or `tab` or `bell`.)

# ASCII and ye shall receive-ski

* ASCII: American Standard Code for Information Interchange
* Invented in 1963

![ASCII Table](../images/ASCII-Table-wide.svg)

<small>(image from [Wikimedia Commons](https://commons.wikimedia.org/wiki/File:ASCII-Table-wide.svg))</small>

# Unicode

* ASCII only goes from 0 to 127
* Unicode is the same as ASCII for values from 0 and 127
    * but Unicode goes a *lot* higher
* Currently more than 130,000 characters, including symbols for
  * 139 modern and historic scripts
  * accents and other diacritics
  * various mathematical ∞, currency £, and cultural ☮ symbols
  * [emoji](https://en.wikipedia.org/wiki/Emoji) 😂
  
# Unicode Strings

JavaScript strings are Unicode

  * technically, JS uses the *UTF-16 encoding* in memory
  * and the *UTF-8 encoding* for text files

That means you can use emoji in your JavaScript programs!

Like this:

```js
"😂".repeat(20)
```


---
<small>

(sadly this doesn't work in Windows PowerShell, but it does work in Atom+node, like this:)

```js
  response.setHeader('content-type', 'text/html');
  response.write('<meta charset="UTF-8">')
  response.write("😂".repeat(20));
  response.end();
```
</small>

# Unicode Encodings

* UTF-32 is a *fixed-width encoding* for Unicode
  * every character is 32 bits long
* UTF-8 is a *variable-width encoding* for Unicode
  * all ASCII characters are one byte long (8 bits)
  * other characters are up to four bytes long (32 bits)
  * used for text files
* UTF-16 is a *variable-width encoding* for Unicode
  * every character is either 16 or 32 bits long
  * used by JavaScript at runtime

[TODO: diagrams]

# Locales

# Collations

