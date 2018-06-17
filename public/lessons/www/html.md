# Intro to HTML

* Stands for Hyper-Text Markup Language.
* Every HTML file = one web page.
* Invented by Tim Berners-Lee
* Based on SGML
* Standard language used for creating web pages.
* Composed of tags
* Used in tandem with CSS and JavaScript
* HTML is for structuring content. It does not perform complex computations. 

# What Is It?

HTML is a coding language composed of various types of *tags*, also known as *elements*. These are what are used to build web pages. They are the Lincoln Logs of the Internet.

* HTML is used to **build** web pages by using **tags**.
* Web browsers "read" HTML and render it as pretty visual elements for humans.

# Standard Page Structure

```html
@@@html
<!DOCTYPE html>
<html>
  <head>
    <title>My House</title>
  </head>
  <body>
    <p>My house is a very very very fine
     house, with two cats in the yard.</p>
    <p>Life used to be <strong>so
     hard</strong>; now everything is
     easy cause of you.</p>
  </body>
</html>
```

# Elements (aka Tags)

Lets break down the page structure above. You can see above, all HTML tags are surrounded by angle brackets. You can also see that every tag has what is known as a **closing tag**. These are the tags that have a preceeding forward slash. For the most part, every HTML tag needs to have a closing tag.

# Examples of Structural Tags (Layout)

|tag|meaning|
|---|---|
|\<head>|head (contains metadata)|
|\<body>|page body|
|\<div>|division|
|\<h1>|Heading (level 1)|
|\<p>|Paragraph containing text|
|\<span>|Text without a line break|
|\<img>|Image tag|


# Examples of Style Tags

|tag|example|
|---|---|
|\<b>|<b>bold</b>|
|\<i>|<i>italic</i>|
|\<strong>|<strong>strong</strong>|
|\<em>|<em>emphasis</em>|
|\<br>|Line break|
|\<hr>|Horizontal rule (dividing line)|
|\<width> / \<height>|self-explanatory|
|\<blockquote>|also self-explanatory|
|etc|

# Attributes

Attributes further define HTML elements and their purpose. For example, an image tag may have the following attributes:

```<img src="/images/cat-pic.jpg" title="Cat Pic" alt="Picture of a fuzzy cat">```

* `src` defines where the image file is located.
* `alt` is alternative text to be displayed if the image cannot be. 
* Attributes are not always required. However in the example above, a source is needed for the image to be displayed.
* Others include `style` (for inline CSS), `title` (for hover-over tooltips), `href` (hyperlink reference)
* Attribute names should always be lowercase

# Style vs Layout vs Semantics

This war has raged inside HTML since the beginning of the WWW. 

Some tags exclusively describe _how_ it's contents should be displayed (ex. `<b>`), where as some _describe_ it's contents (ex. `<strong>`). Web content isn't just about appearence. It matters how it is intepreted. 

* Semantics are all about meaning - what is the purpose?
* Not all HTML elements convey meaning - not all HTML elements are semantic (ex. div). 
* Imagine a blind person using a screen reader - how might they understand the difference between a `<strong>` and a `<b>` tag?
* Not all elements **style** content, and not all elements define **structure** or layout.

# HTML Has Flaws

* Difficult to parse
* Poor whitespace rules
* Case insensitive, except when it's not
  * For example, Ç is &amp;Ccedil; and ç is &amp;ccedil;
* Open and close tag names should match but often aren't required to
  * For example, &lt;b>bold &lt;i>italic&lt;/b>&lt;/i>
* Muddled distinctions
  * between *semantics* (what the tag's content *means*) and *style* (how the tag's content is *displayed*)
  * between *elements* and *attributes* and *content*
