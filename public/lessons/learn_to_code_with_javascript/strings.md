# String Literals

* *"literal"* means "exactly as it's written" 
* a *string literal* is a string whose characters are spelled out explicitly in your code
* JavaScript string literals are surrounded with either single quotes (`'`) or double quotes (`"`)
  * but not both!

```
@@@ js
"My dog has fleas."
'Vermonters have a hundred words for "snow".'
``` 

# String Escapes

* some characters can't be typed literally, so you need to use *string escapes*
* backslash is the *escape character* in JavaScript strings
* backslash means "the next character means something special"
  * for instance backslash-n means "newline"
  
```
@@@ js
console.log("Roses are red,\nViolets are blue;\nCandy is sweet,\nAnd so are you.")
```

# String Messages

A string understands lots of messages. Here are a few:

```
@@@ js
"drive" + "way"
'Java' + "Script"

"Bert's pal Ernie" + ' sings "Rubber Duckie"'

"titanic".toUpperCase()
"QUIETLY".toLowerCase()

"Java".repeat(10)

"banana".length

"berry".charAt(1)
"berry".charAt(0)
"apple"[3]

"banana".includes("nan")
"banana".endsWith("ana")

"cherry" > "banana"
"apple" > "cherry"

"apple" < "banana"
"apple" < "BANANA"
```

Try all of these out in `node` or the browser console!

Check out [MDN String](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String) docs for more.

# Slicing and Dicing

Every string is made of lots of other strings.

You can pull out parts of a string with the `slice` message.

    @@@ js
    // this means "slice from character 0 to character 4"
    "blueberry".slice(0, 4) 

    // this means "slice from character 4 to the end
    "blueberry".slice(4)

These start and end numbers are called *indexes* (or *indices* if you're feeling fancy).

[MDN: slice](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/slice)

# String Indexing Explained

Humans like to start counting at 1, but computers like to start counting at 0.

This can be confusing, so here's a visualization to help explain it.

Think of the indexes as pointing at the *spaces between* characters, as in this diagram:

     [b] [l] [u] [e] [b] [e] [r] [r] [y] 
    0   1   2   3   4   5   6   7   8   9 
     
So with this picture in your mind, `slice`...
  
   * includes the character to the *right* of the start index
   * includes the character to the *left* of the end index
        * but *excludes* the character to the *right* of the end index

Try various start and end values in the console and see what happens!

