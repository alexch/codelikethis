# CSS

  * Cascading Style Sheets (CSS)
  * CSS, by itself, does nothing.
  * Responsible for determining how your HTML **looks**

# Why Does CSS Exist?

  * CSS formats your webpage. Without it, there is only content, and no structure or styles.
  * Can be written within HTML, or using an external style sheet (the correct way)
  * Creating external style sheets prevents you from having to write code multiple times, and makes it easy to modify.

# Styling Text With CSS

  * Using CSS **properties**, you can modify the appearence of your HTML.
  * This can done by targeting HTML **elements**.

# Inline Style

  * Adding the style onto the HTML element directly
  * Uses the `style` attribute of an element
  * Declarations go within the `style` attribute value

```html
@@@html
<h1 style="color: red; font-size: 32px;">
```

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

Here is an example of CSS:

```css
@@@css

h1 {
  color:red;
  font-size:24px;
}

p {
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

| selector     | meaning          |
|--------------|------------------|
| p, div, etc. | element selector |
| .class       | class selector   |
| #id          | ID selector      |
| *            | Wildcard         |

# Examples of Properties

| property    | meaning                                |
|-------------|----------------------------------------|
| color       | text color                             |
| border      | Defines border width, style, and color |
| text-align  | justifies text                         |
| font-size   | size of font                           |
| font-family | defines font                           |

# Compound Selectors 1

Selectors can target elements nested within other elements

```css
@@@css

p img {
  max-width: 320px;
  height: auto;
}
```

# Compound Selectors 2

Selectors can target specific elements with a class

```css
@@@css

h1 .title {
  display: block;
  margin: 0, auto;
  padding-top: 1em;
}
```

# Compound Selectors 3

Selectors can target specific elements with an ID

```css
@@@css

h1 #introduction {
  display: block;
  margin: 0, auto;
  padding-top: 1em;
}
```

# Cascading Syles

```css
@@@css

h1 {
  color: red;
}

.title {
  color: yellow;
}

#introduction {
  color: blue;
}
```

```html
@@@html
<h1>Hi there, I am RED</h1>
<h1 class="title">Hi there, I am YELLOW</h1>
<h1 class="title" id="introduction">Hi there, I am BLUE</h1>
```

# The Important Declaration

Using `!important` in a declaration overrides all other declarations

## Example

```css
@@@css

h1 {
  color: red;
}

.title {
  color: yellow !important;
}

#introduction {
  color: blue;
}

```

# Style Override Precedence

5. Element Selectors
4. Class Selectors
3. ID Selectors
2. In line CSS
1. Important!

# Style Specificity Precedence

* More specific selectors will override less specific

```css
@@@css
.main p {
  // Least specific
  background-color: yellow;
}

.header .title h1{
  // Somewhat specific
  background-color: red;
}

.nav .menu .option li{
  // Most specific
  background-color: blue;
}
```

# Including CSS into HTML

There are several ways to add style to an HTML page

  * `<style>` Embedded CSS
  * `<link>` Tag to a CSS file
  * `<h1 style="color: red; font-size: 32px;">` Inline
  * `<link>` Tag to a CSS file
  * `<style>` Tags with `@import` of a CSS file

# CSS Style Tags

```html
@@@html
<!DOCTYPE html>
<html>
  <head>
    <title>My Cat</title>
    <style type="text/css" media="screen">
     div {
       float: left;
       width: 49%;
       height: 100px;
       border: solid red 1px;
     }

     button {
       float: left;
       clear: both;
     }
    </style>
  <body>
  	<h1>My Cat Bob</h1>
    <p>My cat is named Bob. He is a lazy cat.</p>
  </body>
</html>
```

# Linking to CSS

```html
@@@html
<!DOCTYPE html>
<html>
  <head>
    <title>My Cat</title>
    <link href="styles/style.css" rel="stylesheet" type="text/css">
  </head>
  <body>
  	<h1>My Cat Bob</h1>
    <p>My cat is named Bob. He is a lazy cat.</p>
  </body>
</html>
```

# @import

  * You can put all your CSS in one file
  * You can load one CSS file into another using `@import`

## Example

```html
@@@html
<style type="text/css" media="screen">
  @import 'my_special_css_file.css';
</style>
```

https://developer.mozilla.org/en-US/docs/Web/CSS/%40import

# The Element Box Model

  * Imagine every HTML element as a 'box'.
  * Every box consists of four different 'layers': Margin, Border, Padding, and Content.
  * Margins and padding help to position and align content inside an HTML element.
  * Padding and margins are transparent. Think of it as empty space.
  * Borders can be colored, or image-based. They can also be 'styled' (dashes, dots, etc.)

![Illustration of the CSS box model](https://pressupinc.com/wp-content/uploads/2014/01/box-model.png "CSS Box Model")

* More information: [MDN: CSS Box Model](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Box_Model/Introduction_to_the_CSS_box_model "MDN CSS Box Model, additional information")
* Even more information: [Shay Howe, opening the box model](https://learn.shayhowe.com/html-css/opening-the-box-model/ "Learn CSS with Shaw Howe, opening the box model")
