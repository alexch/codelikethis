# JSON

JavaScript Object Notation

* a *proper subset* of JavaScript
* basically, it's plain JavaScript without functions or variables
  * (or comments, or single-quoted strings, or a few other limitations)
* used for data *sans* behavior
  * saving/loading to disk or database
  * transmitting information across network

# Why JSON?

* efficient to parse and compress
* human-readable, for the most part
* well-defined rules for whitespace and [character encoding](https://tools.ietf.org/html/rfc7159#section-8)
  * always Unicode, usually UTF-8
* very flexible data format
  * allows arbitrary nesting of arrays and objects (hashes)

# Example JSON object

```javascript
  {
    "Image": {
        "Width":  800,
        "Height": 600,
        "Title":  "View from 15th Floor",
        "Thumbnail": {
            "Url":    "http://www.example.com/image/481989943",
            "Height": 125,
            "Width":  100
        },
        "Animated" : false,
        "IDs": [116, 943, 234, 38793]
      }
  }
```

Its Image member is an object whose Thumbnail member is an object and
whose IDs member is an array of numbers.

(from [the spec](https://tools.ietf.org/html/rfc7159#section-13))

# Example JSON array

```javascript
[
    {
       "precision": "zip",
       "Latitude":  37.7668,
       "Longitude": -122.3959,
       "Address":   "",
       "City":      "SAN FRANCISCO",
       "State":     "CA",
       "Zip":       "94107",
       "Country":   "US"
    },
    {
       "precision": "zip",
       "Latitude":  37.371991,
       "Longitude": -122.026020,
       "Address":   "",
       "City":      "SUNNYVALE",
       "State":     "CA",
       "Zip":       "94085",
       "Country":   "US"
    }
]
```

(from [the spec](https://tools.ietf.org/html/rfc7159#section-13))

# Viewing JSON in Browser

* Its mime-type is `application/json` which most browsers will display all on one line :-(
* There are browser extensions that will render it better
  * Chrome: [JSON Viewer](https://github.com/tulios/json-viewer) (click on "Chrome Web Store" button to install)


![json viewer screenshot](https://raw.githubusercontent.com/tulios/json-viewer/master/screenshot.png)

# Viewing JSON in NodeJS Console

* JSON *is* JavaScript
* so if you _copy_ a JSON blob and _paste_ it into the Node REPL
* it will look like this:

```

$ node
> { "Image": { "Width":  800, "Height": 600, "Title":  "View from 15th Floor", "Thumbnail": { "Url":    "http://www.example.com/image/481989943", "Height": 125, "Width":  100 }, "Animated" : false, "IDs": [116, 943, 234, 38793] } }
{ Image:
   { Width: 800,
     Height: 600,
     Title: 'View from 15th Floor',
     Thumbnail:
      { Url: 'http://www.example.com/image/481989943',
        Height: 125,
        Width: 100 },
     Animated: false,
     IDs: [ 116, 943, 234, 38793 ] } }

```

(beware multi-line strings though: https://github.com/nodejs/node/issues/21657 )

# Parsing & Producing JSON

* Assume the following is in a string named `text` :

```js
let text = '{ "name": "Ada Lovelace", "id": 1, "title": "The Queen of Numbers" }'
```

The following code converts the String data into a JavaScript object:

```js
let data = JSON.parse(text)
```

And this converts a JavaScript object back into a String:

```js
let newText = JSON.stringify(data)
```
# Using POSTMAN

https://www.getpostman.com/

