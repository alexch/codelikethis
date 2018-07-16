# Forms

The `<form>` tag means:

  * when the user enters data into these input elements
  * and clicks the "Submit" button
  * then the browser will wrap up all those values and send it to the server

# Form Example

```
<form method='post'>
  Name: <input type='text' name='name' value='Alice'>
  <br>
  Password: <input type='password' name='password'>
  <br>
  <input type='submit'>
</form>
```

<form method='post'>
  Name: <input type='text' name='name' value='Alice'>
  <br>
  Password: <input type='password' name='password'>
  <br>
  <input type='submit'>
</form>

# Forms are semantic

* a form wraps *input* elements for submission
  * but may also *include* or *be included within* other styled elements
* most of the time your `<form>` element will correspond to a block element (viz. the border of the form)
  * but by default `<form>` is an *inline* element
  * and instead of making it a block element, it's usually better to wrap it in a `div` 
  * and apply styles to the wrapper and leave the `form` alone

# Form Methods: GET vs. POST

See [server-side lesson](/lessons/server_side_javascript/forms_and_parameters)

# Intercepting forms with JavaScript

* your JavaScript code can add a *submit event handler*
  * also known as "onsubmit"
* this function will be called after the user clicks "Submit"
  * but before the data is sent to the server
* this lets you *modify* the data sent to the server, or execute code *before* sending the data to the server, or just *cancel* the server call altogether
* if you intend a form to only be used by JavaScript, do one or both of these: 
  * `<form href='#'>` in your HTML
  * `event.preventDefault();` in your JS event handler

# References

 <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form> - docs
 <https://developer.mozilla.org/en-US/docs/Learn/HTML/Forms> - guide
