# Inline vs. Block Level Elements

This is where things start to get a little bit tricky - positioning HTML elements using CSS. 
There are two main 'displays', for HTML elements.

1. Block level
	- New line, full width
2. Inline level
	- Same line, width of content

It is important to note that inline elements should only contain data, or other inline elements. Block level elements can contain both block and inline elements. 

![Illustration of HTML displays](http://www.girldevelopitfargo.com/holidayhtmlcss/img/example-blockinline.png "HTML Displays")

# CSS Display Property

All HTML elements should be viewed as a block, as discussed before. Elements are given a specific **display** - this is a CSS property that determines an element's layout, and how it interacts with other elements. In other words, it decides whether an element will be full-width, or in-line with other elements. 

* `display:block;`
	- The element will take up the full width of the page
* `display:inline;`
	- The element will only take up the width of the content within the element. 
* `display:inline-block`
	- Acts as an inline element, but can be given a specific width and height.

# Example of Block vs. Inline Elements

Inherent display properties of commonly-used HTML elements.

|Block Level Elements|
|---|---|
|div|
|p|
|table|
|form|
|ul, ol|
|nav|

|Inline Elements|
|---|---|
|span|
|a|
|i, em|
|b, strong|
|ul, ol|
|button|

# Positioning

There are 4 commonly-used position properties in CSS. These further help to position elements on a page. They also help to further confuse you as a developer. 

1. **Relative** - Elements are relative to the flow of the HTML document. 
	- Elements moved around with the properties top, left, right, bottom. `top:20px;` will move a relatively positioned element 20 pixels from its natural postioning.  
2. **Absolute** - This is positioned relative to its parent or ancestor (closest ancestor that is relatively positioned). 
	- Any element that is positioned absolutely, will be placed (using the top/left/right/bottom CSS properties) specifically within the parent, irrespective of other sibling elements.
3. **Fixed** - Position an element is relation to its viewport (browser window).
4. **Static**- Same as relative, but cannot be moved with top/left/right/bottom. It is relative to the flow of the HTML document.

![CSS Positioning Illustration](http://www.peachpit.com/content/images/ch21_0321703529/elementLinks/21fig10.jpg "Illustration of various positioning techniques using CSS")

[Learn CSS Layout](http://learnlayout.com/position.html)

