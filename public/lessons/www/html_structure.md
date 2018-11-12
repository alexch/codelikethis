# Tables

* Tables are comprised 4 elements: `<table>`, `<tr>`, `<th>`, and `<td>`
* Tables are a way of structuring data into rows and columns.

# Example Table structure:

```html
<h1>Grocery List</h1>
<table>
  <tr>
    <th>Fruit</th>
    <th>Grains</th>
    <th>Dairy</th>
  </tr>
  <tr>
    <td>Apples</td>
    <td>White Rice</td>
    <td>Milk</td>
  </tr>
  <tr>
    <td>Bananas</td>
    <td>Oatmeal</td>
    <td>Yogurt</td>
  </tr>
</table>
```
# The Result

<h1>Grocery List</h1>
<table>
  <tr>
    <th>Fruit</th>
    <th>Grains</th>
    <th>Dairy</th>
  </tr>
  <tr>
    <td>Apples</td>
    <td>White Rice</td>
    <td>Milk</td>
  </tr>
  <tr>
    <td>Bananas</td>
    <td>Oatmeal</td>
    <td>Yogurt</td>
  </tr>
</table>

# Lists

* Two main types of HTML lists: *ordered* and *unordered*.
* `<ul>` describes a unordered list
  * this list
  * is unordered
* `<ol>` describes an ordered list.
  1. this list
  2. is ordered

```html
<ul>
  <li>Pizza</li>
  <li>Pasta</li>
  <li>Bread</li>
</ul>
```

# The Result

<ul>
  <li>Pizza</li>
  <li>Pasta</li>
  <li>Bread</li>
</ul>

# Commenting with HTML

* Commenting is important in **any** form of coding.
* Comments help both you and others to better understand the intent of the code.
* Especially helpful when reviewing large amounts of code.

Comments in HTML are not read by browsers. They use the following syntax:

`<!-- This is a comment! -->`

* Note that no closing tag is necessary. Comments can also be used to temporarily disable a block of code. For example:

```html
<!-- I don't want this to be shown because it is silly
<body>
	<div>
		<p>I do not want this content to be shown</p>
		<img src="/images/dog-pic.jpg" alt="this is a doggo" title="Doggo">
	</div>
</body>
-->
```

* This code is ignored, as it is within a comment tag.
