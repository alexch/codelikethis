# Forms

a `<form>` is an HTTP element that

  * contains input elements
  * wraps up their names and values into a bundle
  * sends that bundle to a web server as parameters

[MDN: form](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form)

# Form attributes

```
@@@html
<form method='get' action='/login'>
```

* `method` corresponds to the *first word* in the HTTP protocol
  * "GET" is the standard (default) method; there are also POST, PUT, HEAD, DELETE, [etc.](https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html)
* `action` is the server path to submit the form to
  * if it's blank then it uses the *same path as the current page* (which is usually not what you want)

# Form elements

```html
<form method='GET' action='/search'>
  <label>Search by Author: <input type="search" name="author"></label>
  <input type='submit' value='Search'>
</form>
```

* `<label>` marks some text as belonging to a certain input element
* `<input name='q' type='search'>` is a text field
  * (that removes line breaks and may look different)
* `<input type='submit' value='Search'>` is a **button** whose **label** is the string "Search"
  * (yes, the names are confusing; the submit button goes way back to HTML 1.0)

There are many more types of form elements (or "widgets") that let the user enter data in a wide variety of formats.

# Intercepting forms with JavaScript

* your JavaScript code can add a *submit event handler*
  * also known as "onsubmit"
* this function will be called after the user clicks "Submit"
  * but *before* the data is sent to the server
* this lets you *modify* the data sent to the server, or execute code *before* sending the data to the server, or just *cancel* the server call altogether
* if you intend a form to only be used by JavaScript, do one or both of these:
  * `<form href='#'>` in your HTML
  * `event.preventDefault();` in your JS event handler

# Form submission: how does it work?

![client-server illustration](https://developer.mozilla.org/files/4291/client-server.png)

1. The user enters some values into the form elements
2. **Either**...
  * the user clicks "Submit"
  * or the user presses <kbd>Enter</kbd> in a text field
  * or JavaScript calls `form.submit()` on the form DOM element
3. The client sends an HTTP request
  * including parameters like `q=apple&submit=Search`
  * (yes, the submit button's text label becomes the value)

# Form submission in detail

* Read more here: <https://developer.mozilla.org/en-US/docs/Learn/HTML/Forms/Sending_and_retrieving_form_data>
* see also [Query String Escaping](https://en.wikipedia.org/wiki/Query_string) aka [URL encoding](https://en.wikipedia.org/wiki/Percent-encoding)
* and [this lesson on parameters](parameters) goes into more detail on how the parameters are encoded/decoded in HTTP

# Form reply: body

After the server receives and processes the request, it can return any HTTP response.

Usually that request is a full HTML page (for display to the user) or a JSON document (for use by your client-side app).

# Form reply: redirect

Sometimes the response is a **302 redirect** which helps keep your endpoints and address bar clean:

  1. form page, visible *before* the user starts entering values
  2. form submit handler, which redirects to...
  3. results page

...but many times it's an all-in-one handler which redraws the original page.

# Form reply: error

Sometimes the response is an error. 

Either the client 

It's important for you to design your app to be *robust*, meaning that if an error happens, it will *fail gracefully*. 

Usually this means informing the user that the request could not be completed, and giving them the option to try again immediately, or asking them to try again later.

In the Fetch API, you can provide an `catch` callback which will receive network errors if and when they happen; you can also check `if (!response.ok) {` inside your main `then` callback.

see https://www.tjvantoll.com/2015/09/13/fetch-and-errors/
