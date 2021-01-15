# JSON?

JSON stands for "**J**ava**S**cript **O**bject **N**otation" and is one of the most common ways of sending data around the internet

JSON is a type of text document that is in the shape of a JavaScript object. However there are some restrictions to what kind of data you can put in a JSON object. In general JSON is only used for strings, numbers, and booleans, but mostly strings.

JSON objects can contain arrays of acceptable datatypes, and other JSON objects as the values for their keys, as well as the datatypes previously mentioned.

# Why JSON?

* used for data *sans* behavior
  * saving/loading to disk or database
  * transmitting information across network
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

(from [the spec](https://tools.ietf.org/html/rfc7159#section-13))

# JSON Collections

A JSON file might contain multiple JSON objects. In this case the JSON file will contain an *array* of JSON objects

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
     IDs: [ 116, 943, 234, 38793 ]
    }
}

```

(beware multi-line strings though: https://github.com/nodejs/node/issues/21657 )


# Lab: Creating a JSON file

JSON files are easy to create since they are just JS objects, that only contain strings. When creating JSON objects **keep in mind** that the keys need to be double quoted.

Let's go ahead and create a JSON file now.

* create a new directory named `json-server`
* inside this directory create a subdirectory called `api`
* inside `api` create a file named `example.json`
* In `example.json` create a JSON object containing:
  * a name
  * a quest
  * a favorite color

## Solution

<details>
<summary></summary>

<div>

```JSON
{
  "name": "Sir Lancelot, the brave",
  "quest": "To seek the Holy Grail",
  "color": "Blue"
}
```

</div>

</details>

# Parsing JSON in JavaScript

Parsing JSON in JavaScript is easy!

Since JSON objects are based off of JavaScript objects it's simple to translate them into true JavaScript objects.

There is a global `JSON` object in JavaScript that can be used to manipulate JSON data. The `JSON.parse(someJson)` method will translate `someJson` into a JavaScript Object

# API Endpoints

API stands for "Application Program Interface"

APIs are used to send data into a front end application

They are an interface between your raw data, and the front end display

# JSON and APIs

Many APIs send data over as JSON, or have the option to send data as JSON based on query parameters.

An API Endpoint in its simplest incarnation could be a directory in your filesystem where you store JSON files

When you receive a request from your client side application your server will then query that directory for a document matching the request, and if it finds one it sends the data back over

# Querying APIs

To query an API you can send a `GET` request to a certain path (which you've defined on your server), or to the location of the endpoint in your filesystem.

You can also send requests through forms, or other inputs to bring back specific subsets of data. Often times there will be some parsing, and conversion necessary on the front end to display the data where, and how you want.

# Postman

Postman is a great tool for seeing exactly what data you will get back from a given request

If you don't already have Postman installed you can get it [here](https://www.postman.com/downloads/). Go ahead and download it now.

* Open up the Postman app, and create a new collection named 'test'
* In this collection create a new `GET` request, and name it 'basic get'
* Select `GET` as the type of request and give it the url `https://jsonplaceholder.typicode.com/posts/1`
* Hit the "Send" button, and see what you get back

There are also many prebuilt collections for commonly used API routes (such as the [GitHub API](https://developer.github.com/v3/)) which you can generally find on the site that hosts the route, or through a quick Google search.

# Lab: Setting Up an API Endpoint

For this lab we will go back to the `json-server` directory.  Currently it should contain one subdirectory that contains a single JSON file. We are going to extend this so that there is a front end that asks the user some questions, accepts answers from them, and greets them differently based on if the answers match up with the values stored in your JSON.

# Setting Up an API: The Set Up

* `npm init -y`
* `npm install express`
* `npm install body-parser`
* Create a `server.js` file in the root level of your project
* Create a `public` directory inside `json-server` with a file named `index.html` inside of it, and a file named `reply.html`

![Lab setup example](/images/json-lab-example.png)

# Setting Up an API: The Stories

* When the user visits the homepage there should be a form with fields for "name," "quest," and "favorite color."
* When the user visits `/check` they should see the raw JSON from the `example.json` file
* When the user fills out, and submits the form
  * And the answers match the values in `example.json`
  * The page should redirect to `/reply`
  * And the new page should say "Alrighty then, off you go. Good luck on your quest!"
* When the user fills out, and submits the form
  *And the answers **do not match** the values in `example.json`
  * The page should redirect to `/reply`
  * And the new page should say "Wrong answer! Into the chasm with you!"