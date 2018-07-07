# AJAX

AJAX enables

  * loading data into your web page from a web server...
  * ...**after** the page initially loads!

# AJAX Examples

  * Load the comments on an article *later*, so the rest of the page is usable sooner
  * Once a minute, check for any *new* comments and display them too
  * Load today's weather forecast from DarkSky.net, and update it every hour
  * Load an ad from a *different web server* and switch ads every few minutes
  * Dynamically display *search results* as the user types their query

# AJAX Definition

**Asynchronous JavaScript And XML**

1.  Request data from an external source
2.  Parse the data returned by the request
3.  Load that data into the page **without a refresh**
4.  Data can be any formats, most common:
    * JSON
    * HTML

# AJAX Advantages/Disadvantages

## Advantages

* Page components can be loaded individually
* New data can be loaded asynchronously
* User interacts with the page and sees results immediately

## Disadvantages

* JavaScript must be enabled
* Adds complexity to JavaScript applications
* Without refreshes the page state can get bloated
* Screen-readers cannot read the whole page at once

# AJAX History

* (1998) First implemented by Microsoft for use in Outlook email web client
* (1999-2003) Several other browsers copied Microsoft for compatibility
* (2004) Google used XMLHttpRequest for loading data in Gmail and Google Maps
* (2005) AJAX Name coined by Jesse James Garrett [0]

[0] http://adaptivepath.org/ideas/ajax-new-approach-web-applications/

# Jesse James Garrett Quote

> Ajax isn’t a technology. It’s really several technologies, each flourishing in its own right, coming together in powerful new ways. Ajax incorporates:

> * standards-based presentation using ~~XHTML~~ HTML and CSS
>
> * dynamic display and interaction using the Document Object Model
>
> * data interchange and manipulation using ~~XML and XSLT~~ JSON
>
> * asynchronous data retrieval using XMLHttpRequest
>
> * and JavaScript binding everything together.

### This was the moment that people realized web applications could be a competitor to desktop applications, and could run on every computer in the world.

# XMLHttpRequest (Old Way)

## WARNING: DO NOT READ

```
<button id="fire-away" type="button">Fire the request</button>

<script>
(function() {
  var httpRequest;
  document.getElementById("fire-away").addEventListener('click', runAjax);

  function runAjax() {
    httpRequest = new XMLHttpRequest();

    if (!httpRequest) {
      alert('Giving up :( Cannot create an XMLHTTP instance');
      return false;
    }
    httpRequest.onreadystatechange = alertContents;
    httpRequest.open('GET', response.json);
    httpRequest.send();
  }

  function alertResponse() {
    if (httpRequest.readyState === XMLHttpRequest.DONE &&
        httpRequest.status === 200) {
        alert(httpRequest.responseText);
    } else {
        alert('There was a problem with the request.');
    }
  }
})();
</script>
```

# Browser Fetch API - Remote

* Please type this URL into the address bar of your browser

<https://jsonplaceholder.typicode.com/posts/1>

```javascript
@@@javascript
let postNumber = 1;
fetch('https://jsonplaceholder.typicode.com/posts/' + postNumber)
  .then(function(response) {
    return response.json();
  })
  .then(function(myJson) {
    console.log(myJson);
  });
```

* `fetch()` takes at least one argument, the URL of the resource to fetch
* `fetch` then calls the server, *just like you did* in the address bar above
* The server passes the Response from the server into the first callback function
* `response.json` parses the body of the response as JSON
* The body of the response is then logged to the console

# Browser Fetch API - Local

If you want to request data from a **local** webserver

```javascript
@@@javascript

fetch('city-market.md')
  .then(function(response) {
    return response.text();
  })
  .then(function(myText) {
    console.log(myText);
  });
```

* This happens to be `response.text` because it is a Markdown file
* If it were JSON then `response.json` would be used

# Browser Fetch API - Errors

* The system will raise errors as exceptions by default
* If you want to handle errors catch them like shown below
* Use `.catch(function(error) { do_something_here })`

```javascript
@@@javascript

fetch('https://jsonplaceholder.typicode.com/posts/1')
  .then(function(response) {
    return response.json();
  })
  .then(function(myJson) {
    console.log(myJson);
  })
  .catch(function(error) {
    console.error('Yikes! I should handle this better:\n', error);
  });
```

# JSON (JavaScript Object Notation)

See full lesson here: [JSON lesson](/lessons/javascript/json)

### Example

```json
@@@js
{"userId": 1,
  "id": 1,
  "title": "My most amazing post",
  "body": "This is my first post, isn't it great. Maybe I'll write some more."
}
```

### NOTE:
* No comments
* No functions
* Only data is allowed
  * Objects (Hashes), Arrays, Numbers, Booleans, Strings

# Parsing & Producing JSON

The Fetch API converts text into JSON for you if you call `response.json()`

but if you want to do it yourself...

* Assume textual JSON is in a string named `text`:

```javascript
@@@javascript
let text = '{ "name": "Ada Lovelace", "id": 1, "title": "The Queen of Numbers" }'
```

This converts the String data into a JavaScript object:

```javascript
@@@javascript
let data = JSON.parse(text)
```

And this converts the JavaScript object back into a String:

```javascript
@@@javascript
let newText = JSON.stringify(data)
```
