# Bootstrap Components

* Built into Bootstrap are a number of reusable elements, conveniently styled out with accompanying JS to easily add components such as navigations, alerts, dropdowns, buttons, responsive tables, lists, responsive media objects, and more! 
* There are over 20 different Bootstrap components that can be found here: https://getbootstrap.com/docs/4.0/components/alerts/

# Navs

* A number of different classes help to set various nav styles (tabs, horizontal links, vertical links, active links, disabled links, etc.)
*  Nav elements in Bootstrap represent just the navigation links, and not the overall `navbar` class, which adds a wrapper in which you are able to add a logo, links (inside a `nav` element), styles, and even forms (such as a search bar, for example).

```html
@@@html
<nav class="nav nav-pills nav-fill">
  <a class="nav-item nav-link active" href="#">Active</a>
  <a class="nav-item nav-link" href="#">Link</a>
  <a class="nav-item nav-link" href="#">Link</a>
  <a class="nav-item nav-link disabled" href="#">Disabled</a>
</nav>
```
* Navigations get much more in depth with various classes, controls, and styles. For more information, visit: https://getbootstrap.com/docs/4.0/components/navbar/

# Coloring 

* Bootstrap has eight colors designed to indicate to the user what they should do without words
* These colors are added to component classnames and will add the color to the component
* This is customizable
* These colors are:

|Class| Color|
|---|---|
|primary|blue|
|secondary|grey|
|success|green|
|danger|red|
|warning|yellow|
|info|teal|
|light|white|
|dark|dark gray|

# Alerts

* When an action is completed on your site, such as a form submission, you may want to bring the user to a page with an alert message. To add a role, you can simply include the following code, and change the class.
* Note that the `alert` is in addition to `alert-primary`

```html
@@@html
<div class="alert alert-primary" role="alert">
  This is a primary alert—check it out!
</div>
```
![Illustration of Various Bootstrap Alerts](https://cdn-images-1.medium.com/max/922/1*XzRZIxZYhgLUfWvu_0mkXQ.png "Bootstrap Alert Components")

# Buttons

* Similarly, buttons can be added with the same colors. The classes for buttons are similar to the alert classes for continuity. The following code will add a button to your web page:

```html
@@@html
<button type="button" class="btn btn-primary">Primary</button>
```

* You can also modify the class so the button is 'hollow', or rather, has a transparent background, with a colored border and text. This is done simply by changing `btn-primary` to `btn-outline-primary`.

```html
@@@html
<button type="button" class="btn btn-outline-primary">Primary</button>
```

* Note that Bootstrap uses the semantic `<button>` element, rather than just a div with the class 'btn-primary'. This is necessary for all of the default Bootstrap styling to be applied, so try not to forget! Bootstrap typically uses semantic HTML elements when possible.

![Illustration of Various Bootstrap Buttons](https://www.jquery-az.com/wp-content/uploads/2018/01/4-11-Bootstrap-4-button-modal.png "Bootstrap Button Components")

# Jumbotron

* The jumbotron component adds a hero image to the top of your website. This markup is relatively simple, but very useful, as a majority of websites today use hero images on their homepage. 

```html
@@@html
<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Fluid jumbotron</h1>
    <p class="lead">This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
  </div>
</div>
```

# Cards

* Cards can be useful when trying to create a blog-like layout, with images and text within the same wrapper. 

* Cards will appear full width, unless you add additional styles or classes to the card element, such as `col-sm-4`. 

![Illustration of Various Bootstrap Buttons](http://apycom.com/bootstrap-components/data/upload/2017/05/decks2.jpg "Bootstrap Button Components")

# Cards Code Examples

* add `style="width: 18rem;"` tag or a class of `col-3` to the first div for each to set the width to a specific size

```html
@@@html
<div class="card">
  <div class="card-header">
    Featured
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">Cras justo odio</li>
    <li class="list-group-item">Dapibus ac facilisis in</li>
    <li class="list-group-item">Vestibulum at eros</li>
  </ul>
</div>
```
```html
@@@html
<div class="card">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="card-link">Card link</a>
    <a href="#" class="card-link">Another link</a>
  </div>
</div>
```

# Bootstrap Examples and Themes

* Bootstrap offers a number of simple, modular page layouts that you can use and tweak for your own needs. This is certainly helpful for quickly deploying a complete Bootstrap website in a timely manner. 
* This way, you don't need to write all the markup from scratch - Bootstrap developers have already done a majority of the legwork for you. 
* These examples can be found at: https://getbootstrap.com/docs/4.0/examples/

* Themes, which are basically fully styled and coded websites, can be purchased from https://themes.getbootstrap.com/. However, I do not recommend this, as you should now be able to replicate just about every theme, using the resources and components above, for free. 



