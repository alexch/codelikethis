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
