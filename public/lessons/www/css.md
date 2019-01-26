    topic name: "css"
    topic name: "styling"
    topic name: "inline-styling"
    topic name: "properties"
    topic name: "selectors"
    topic name: "compound-selectors"
    topic name: "pseudo-class-selectors"
    topic name: "html-linking"
    topic name: "html-elements"
    topic name: "element-box-model"
    topic name: "style-overrides"
    link href: "https://meyerweb.com/eric/tools/css/reset/"
    link href: "http://learnlayout.com/box-model.html"
    lab href: "https://learn.freecodecamp.org/responsive-web-design/basic-css",
        name: 'FreeCodeCamp "Responsive Web Design - Basic CSS"'


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
<h1 style="color: red; font-size: 32px;">
```

# Example:

Let's say we have the following HTML:

```html

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
| `p`, `div`, etc. | element selector |
| `.class`     | class selector   |
| `#id`        | ID selector      |
| `*`          | Wildcard ("any") |

# Examples of Properties

| property    | meaning                                |
|-------------|----------------------------------------|
| `color`       | text color                             |
| `border`      | Defines border width, style, and color |
| `text-align`  | justifies text                         |
| `font-size`   | size of font                           |
| `font-family` | defines font                           |

# Compound Selectors 1

Selectors can target elements nested within other elements

```css
p img {
  max-width: 320px;
  height: auto;
}
```

# Compound Selectors 2

Selectors can target specific elements with a class

```css
h1 .title {
  display: block;
  margin: 0, auto;
  padding-top: 1em;
}
```

# Compound Selectors 3

Selectors can target specific elements with several layers of nesting

```css
main .introduction > p {
  background-color: lightgray;
  margin: 10px auto;
}
```

"apply these styles to all `p`s that are direct children of a `div` of class `introduction` inside the `main` section"

# Psuedo-Class Selectors

You can target the state of an element using `psuedo-class` selectors

  * Hover
  * Visited
  * Checked
  * Active
  * Many others

[Full List on MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes "Full list of CSS psuedo-classes on Mozilla Developer Network")

[MDN Psuedo-Class Tutorial](https://developer.mozilla.org/en-US/docs/Learn/CSS/Introduction_to_CSS/Pseudo-classes_and_pseudo-elements "MDN Psuedo-Class Tutorial")

```css
a:hover {
  background-color: red;
}

a:clicked {
  background-color: blue;
}

a:active {
  background-color: green;
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
  </head>
  <body>
  	<h1>My Cat Bob</h1>
    <p>My cat is named Bob. He is a lazy cat.</p>
  </body>
</html>
```

# Linking to CSS

```html
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

# Cascading Syles

```css

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
<h1>Hi there, I am RED</h1>
<h1 class="title">Hi there, I am YELLOW</h1>
<h1 class="title" id="introduction">Hi there, I am BLUE</h1>
```

# The !Important Declaration

Using `!important` in a declaration overrides all other declarations

## Example

```css

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

* 5. Element Selectors
* 4. Class Selectors
* 3. ID Selectors
* 2. Inline CSS
* 1. !important

# Style Specificity Precedence

* More specific selectors will override less specific

```css
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

# TODO

- `px` and `pt` and `em` and `rem`
- fonts: which fonts are always available? what are web fonts?
- fontawesome (inline icons as font glyphs)
- space vs. greater-than (descendant vs. child) in css selectors

- "every config file eventually becomes Turing-complete" see also <http://beza1e1.tuxen.de/articles/accidentally_turing_complete.html> and
<https://stackoverflow.com/questions/648246/at-what-point-does-a-config-file-become-a-programming-language>

- reset.css
- print.css
