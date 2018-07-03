# AJAX

## Usage

Loading data into your web application from the web server

## Definition

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

### This was the moment that people realized the web could be a competitor to desktop applications, and one that every computer in the world could run.


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

* Please type this URL into your browser

`https://jsonplaceholder.typicode.com/posts/1`

```javascript
@@@javascript

fetch('https://jsonplaceholder.typicode.com/posts/1')
  .then(function(response) {
    return response.json();
  })
  .then(function(myJson) {
    console.log(myJson);
  });
```

* fetch() takes at least one argument, the URL of the resource to fetch
* The server returns the Response from the resource
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

# JSON (JavaScript Object Notation)

### Example

```javascript
@@@javascript
{"userId": 1,
  "id": 1,
  "title": "My most amazing post",
  "body": "This is my first post, isn't it great. Maybe I'll write some more."
}
```

### NOTE:
* Only data is allowed
    * Objects (Hashes)
    * Arrays
    * Numbers
    * Booleans
    * Strings
* No comments
* No functions

# Parsing JSON

* Assume the following is in a string named `text`

```javascript
@@@javascript

{
  "name": "Ada Lovelace",
  "id": 1,
  "title": "The Queen of Numbers",
  "skills": ["mathematics", "abstract thinking", "reasoning", "intuition"],
  "achievments": [
    "Implemented the first computer program",
    "Influenced the design of the first computer",
    "Published several mathematical papers"
  ]
}
```

```javascript
@@@javascript

// Convert the String data into a JavaScript object
let data = JSON.parse(text)

// Convert the JavaScript object back into a String
let newText = JSON.stringify(data)
```
