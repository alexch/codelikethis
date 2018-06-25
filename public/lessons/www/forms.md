# Forms

The `<form>` tag means:

  * when the user enters data into these input elements
  * and clicks the "Submit" button
  * then the browser will wrap up all those values and send it to the server

# Form Example

<form method='post'>
  Name: <input type='text' name='name' value='Alice'>
  <br>
  Password: <input type='password' name='password'>
</form>

# Forms are semantic

* a form wraps *input* elements for submission
  * but may also *include* or *be included within* other styled elements
* most of the time your `<form>` element will correspond to a block element (viz. the border of the form)
  * but by default `<form>` is an *inline* element
  * and instead of making it a block element, it's usually better to wrap it in a `div` 
  * and apply styles to the wrapper and leave the `form` alone

# Form Methods: GET vs. POST

todo

# References

 <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form> - docs
 <https://developer.mozilla.org/en-US/docs/Learn/HTML/Forms> - guide
