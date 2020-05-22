    topic name: "forms"
    topic name: "http-methods"
    topic name: "html-elements"
    topic name: "values"
    topic name: "event-handlers"

# Forms contain inputs

a `<form>` is an HTML element that contains input elements

  * when the user enters data into these input elements
  * and clicks the "Submit" button
  * then the browser will wrap up all those values and send it to the server

[MDN: form](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form)

# Form Example

```html
<form method='post'>
  Name: <input type='text' name='name' value='Alice'>
  <br />
  Password: <input type='password' name='password'>
  <br />
  <input type='submit'>
</form>
```


<form method='post'>
  Name: <input type='text' name='name' value='Alice' />
  <br />
  Password: <input type='password' name='password' />
  <br />
  <input type='submit' />
</form>

# Forms are semantic

* a form wraps *input* elements for submission
  * but may also *include* or *be included within* other styled elements
* most of the time your `<form>` element will correspond to a block element (viz. the border of the form)
  * but by default `<form>` is an *inline* element
  * and instead of making it a block element, it's usually better to wrap it in a `div` 
  * and apply styles to the wrapper and leave the `form` alone

# Form attributes

```html
<form method='get' action='/login'>
```

* `method` corresponds to the *first word* in the HTTP protocol
  * "GET" is the standard (default) method; there are also POST, PUT, HEAD, DELETE, [etc.](https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html)
* `action` is the server path to submit the form to
  * if it's blank then it uses the *same path as the current page* (which is usually not what you want)

# Form Methods: GET vs. POST

* `GET` means "return me a page (based on these parameters)"
* `POST` means "take these parameters (and return me a page)"

Basically, `GET` is for *reading* and `POST` is for *writing*

but that distinction is often blurry

Also,

  * `GET` sends all parameters via the *request URL*
  * `POST` sends some or all parameters via the request body* 

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
  * but before the data is sent to the server
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

# Forms as Input

Forms are a great way to accept user input in your webpages. The simplest way to handle user input is to create a form with an `<input type="text" />` element, and an `<input type="submit" />` element.

When the form is submitted you use JavaScript to read the value of the text field, and do whatever manipulations, or actions you need to do based on that input.

# Lab: Say Hello

In this lab you will set up an input form where you can enter a name, and the page will display text greeting that name.

  - Set up a form with a text input, and submit button
  - When a user inputs their name and hits submit the page displays a personalized greeting for that name
  -  Format the name so that it's always capitalized
  - Bonus Challenge: Can you get it to say hello to some names, and tell others to go away?


# Say Hello Solution

<details>
<summary>Hint 1</summary>
<div>

Text inputs have a `value` property which is equal to the text that's currently in the input area. This value comes into JavaScript as a string, and all standard string methods work on it.

</div>
</details>

<details>
<summary>Hint 2</summary>
<div>

When working with forms part of the default `submit` action is to refresh the page, which means you loose any DOM manipulation you might have applied. You can prevent default behaviours from taking place by calling `event.preventDefault()`

</div>
</details>

<details>
<summary>Solution</summary>
<div>

```html
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title
</head>

<body>
  <form id='name' onsubmit="sayHello(event)">
    <input id="name-input" type='text' />
    <input type='submit' />
  </form>

  <h1 id='display'></h1>

  <script>

    let nameInput = document.getElementById('name-input')
    let display = document.getElementById('display')

    function sayHello (event) {
      event.preventDefault()
      let name = nameInput.value
      let formattedName = name[0].toUpperCase() + name.toLowerCase().slice(1)
      display.textContent = "Hello, " + formattedName + "!"
    }
    
  </script>
</body>
</html>
  ```

</div>
</details>

# References

 <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form> - docs
 <https://developer.mozilla.org/en-US/docs/Learn/HTML/Forms> - guide
