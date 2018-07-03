# AJAX

**Asynchronous JavaScript And XML**

1.  Request data from an external source
2.  Parse the data returned by the request
3.  Load that data into the page **without a refresh**
4.  Data can be many formats such as:
    * HTML
    * XML
    * JSON
    * CSV
    * Plain Text

# AJAX Advantages/Disadvantages

## Advantages

* Page components can be loaded individually
* New data can be loaded asynchronously
* Interactivity is enabled without refresh

## Disadvantages

* JavaScript must be enabled
* Dependent components must load serially
* Screen-readers cannot read the whole page at once

# AJAX History

* (1998) First implemented by Microsoft for use in Outlook email web client
* (1999-2003) Several other browsers copied Microsoft for compatibility
* (2004) Google used XMLHttpRequest for loading data in Gmail and Google Maps
* (2005) AJAX Name coined by Jesse James Gerrett [0]


# Jesse James Gerrett Quote

> Ajax isn’t a technology. It’s really several technologies, each flourishing in its own right, coming together in powerful new ways. Ajax incorporates:

> * standards-based presentation using XHTML and CSS
>
> * dynamic display and interaction using the Document Object Model
>
> * data interchange and manipulation using XML and XSLT
>
> * asynchronous data retrieval using XMLHttpRequest
>
> * and JavaScript binding everything together.


[0] http://adaptivepath.org/ideas/ajax-new-approach-web-applications/

# XMLHttpRequest (Old Way)

*Example of working with an XMLHttpRequest*

```html
@@@html
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

* The user clicks the "Fire the request" button;
* The event handler calls the runAjax() function;
* The request is made and then (onreadystatechange) the execution is passed to alertResponse();
* alertResponse() checks if the response was received and OK, then alert()s the contents of the response.json file.


# Browser Fetch API (new way)

```javascript
@@@javascript

fetch(''https://jsonplaceholder.typicode.com/posts/1'')
  .then(function(response) {
    return response.json();
  })
  .then(function(myJson) {
    console.log(myJson);
  });
```

## Remote Webserver

* Fetch() takes at least one argument, the URL of the resource to fetch
* A Promise is returned containing the Response from the resource
* The body of the response is returned with `response.json`
* The body of the response is then logged to the console using an anonymous function

# Browser Fetch API (new way)

## Local Webserver

If you want to request data from a **local** webserver

```javascript
@@@javascript
fetch('city-market.json)
  .then(function(response) {
    return response.text();
  })
  .then(function(myText) {
    console.log(myText);
  });
```
