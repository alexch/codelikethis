# CSS

* CSS = Cascading Style Sheet
* CSS, by itself, does nothing. 
* Responsible for determining how your HTML **looks**

# Why Does CSS Exist?

* CSS formats your webpage. Without it, there is only content, and no structure or styles. 
* Can be written within HTML, or using an external style sheet (the correct way)
* Creating external style sheets prevents you from having to write code multiple times, and makes it easy to modify.

# Styling text with CSS

* Using CSS **properties**, you can modify the appearence of your HTML. 
* This can done by targeting HTML **elements**.

# Example:

Let's say we have the following HTML:

```html
@@@html
<!DOCTYPE html>
<html>
  <head>
    <title>My Cat</title>
  </head>
  <body>
  	<h1>My Cat Bob</h1>
    <p>My cat is named Bob. He is a lazy cat.</p>
  </body>
</html>
```

Now lets look at the following CSS:

```
h1{
	color:red;
	font-size:24px;
}

p{
	color:blue;
	font-size: 12px;
}
```
What is the CSS doing here?

# Selectors and Properties

* CSS is constructed of **selectors** and **properties**.
* Selectors determine where the styles are applied.
* Properties determine what those styles are.
* CSS begins with a selector, followed by curly braces.
* Declare your styles inside the curly braces. 

# Examples of Selectors

|selector|meaning|
|---|---|
|p, div, etc.|element selector|
|.class|class selector|
|#id|ID selector|
|*|Wildcard|

# Examples of Properties

|property|meaning|
|---|---|
|color|text color|
|border|Defines border width, style, and color|
|text-align|justifies text|
|font-size|size of font|
|font-family|defines font|

# Page layout with CSS 

  * Imagine every HTML element as a 'box'.
  * Every box consists of four different 'layers': Margin, Border, Padding, and Content.
  * Margins and padding help to position and align content inside an HTML element. 
  * Padding and margins are transparent. Think of it as empty space. 
  * Borders can be colored, or image-based. They can also be 'styled' (dashes, dots, etc.)

![Illustration of the CSS box model](https://pressupinc.com/wp-content/uploads/2014/01/box-model.png "CSS Box Model")

# @import

* You can put all your CSS in one file

OR...

* You can load one CSS file into another using `@import`

[todo: example]

https://developer.mozilla.org/en-US/docs/Web/CSS/%40import

