# Bootstrap Components

* Built into Bootstrap are a number of reusable elements, conveniently styled out with accompanying JS to easily add components such as navigations, alerts, dropdowns, buttons, responsive tables, lists, responsive media objects, and more! 
* There are over 20 different Bootstrap components that can be found here: https://getbootstrap.com/docs/4.0/components/alerts/

# Alerts

* When an action is completed on your site, such as a form submission, you may want to bring the user to a page with an alert message. To add a role, you can simply include the following code, and change the class.

```
<div class="alert alert-primary" role="alert">
  This is a primary alert—check it out!
</div>
```
* The following classes are available for different colored alerts. 

|Class|Alert Color|
|---|---|
|alert-primary|blue|
|alert-secondary|grey|
|alert-success|green|
|alert-danger|red|
|alert-warning|yellow|
|alert-info|teal|

![Illustration of Various Bootstrap Alerts](https://cdn-images-1.medium.com/max/922/1*XzRZIxZYhgLUfWvu_0mkXQ.png "Bootstrap Alert Components")

# Buttons

* Similarly, buttons can be added with the same colors. The classes for buttons are similar to the alert classes for continuity. The following code will add a button to your web page:

```
<button type="button" class="btn btn-primary">Primary</button>
```

* As you can see, this also uses the language 'primary', as a descriptor. This will result in a button that is the same color as the alert-primary component. The following classes/button styles are available for use in Bootstrap 4:

|Class|Button Color|
|---|---|
|btn-primary|blue|
|btn-secondary|grey|
|btn-success|green|
|btn-danger|red|
|btn-warning|yellow|
|btn-info|teal|

* You can also modify the class so the button is 'hollow', or rather, has a transparent background, with a colored border and text. This is done simply by changing `btn-primary` to `btn-outline-primary`.

* Note that Bootstrap uses the semantic `<button>` element, rather than just a div with the class 'btn-primary'. This is necessary for all of the default Bootstrap styling to be applied, so try not to forget! Bootstrap typically uses semantic HTML elements when possible.

![Illustration of Various Bootstrap Buttons](https://www.jquery-az.com/wp-content/uploads/2018/01/4-11-Bootstrap-4-button-modal.png "Bootstrap Button Components")

# Cards

* Cards can be useful when trying to create a blog-like layout, with images and text within the same wrapper. The following markup is used to add a card element to your Bootstrap website:

```
<div class="card">
  <img class="card-img-top" src="..." alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
  </div>
</div>
```

* This card will appear full width, unless you add additional styles or classes to the card element, such as `col-sm-6`. In a previous lesson we covered the column based classes and how to set a given width to a element. 

![Illustration of Various Bootstrap Buttons](http://apycom.com/bootstrap-components/data/upload/2017/05/decks2.jpg "Bootstrap Button Components")


# Carousel

* Bootstrap offers pre-packaged image carousels that can be added to the header (or elsewhere) on your website. This component has a lot of different options and attributes, such as pagination (slide indicators), controls (left/right arrows for scrolling through photos), thumbnails, and captions.

* Carousels tend to me a more intricate and complicated Bootstrap component, so lets break down the relatively simple markup below:

```
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="..." alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="..." alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="..." alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
```

* This code will add a carousel, with three different images. `d-block` and `w-100` are classes that override the default image behavior in your browser, and force the image to be full-width and responsive. 
* You can see the `carousel-control` elements, which add left and right arrows to the slideshow. 
* The `sr-only` classes are for screen readers.
* More classes and attributes for the carousel component can be found at: https://getbootstrap.com/docs/4.0/components/carousel/

![Illustration of the Bootstrap Carousel](https://www.sshakil.com/public/uploads/article_image/1509116298.jpg "Bootstrap Carousel Component")

# Jumbotron

* The jumbotron component adds a hero image to the top of your website. This markup is relatively simple, but very useful, as a majority of websites today use hero images on their homepage. 

```
<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Fluid jumbotron</h1>
    <p class="lead">This is a modified jumbotron that occupies the entire horizontal space of its parent.</p>
  </div>
</div>
```

# Navs

* Navs are another relatively in-depth and complicated Bootstrap component. A number of different classes help to set various nav styles (tabs, horizontal links, vertical links, active links, disabled links, etc.)
*  Nav elements in Bootstrap represent just the navigation links, and not the overall `navbar` class, which adds a wrapper in which you are able to add a logo, links (inside a `nav` element), styles, and even forms (such as a search bar, for example).

* The following markup may seem a bit complicated, however there are fairly simple classes and styles being applied here. Lets break this down

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Features</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Pricing</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown link
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    </ul>
  </div>
</nav>

* In the above example, you will first see the wrapper element `<nav>`, with the classes 'navbar-expand-lg', and `navbar-light`. This tells the navbar to be full width, and have a light grey background.

* Next you can see the button with the class `navbar-toggler`. This is hidden on desktop, but allows the navigation to easily switch to a mobile-friendly hamburger navigation at a specified break point, or screen size. When the breakpoint is hit, the desktop navigation is hidden, the button is revealed, and the navigation turns into a dropdown that can be toggled. 
* There is native background JS that controls mobile/desktop navigation switching, so you do not need to write custom code to make this functionality occur. 

* The `<li class="nav-item dropdown">` element is a dropdown, allowing you to easily add a secondary dropdown navigation to your individual nav links.

* Navigations get much more in depth with various classes, controls, and styles. The above code is enough to get started with a simple and elegant navbar on your Bootstrap website. For more information, visit: https://getbootstrap.com/docs/4.0/components/navbar/

# Bootstrap Examples and Themes

* Bootstrap offers a number of simple, modular page layouts that you can use and tweak for your own needs. This is certainly helpful for quickly deploying a complete Bootstrap website in a timely manner. 
* This way, you don't need to write all the markup from scratch - Bootstrap developers have already done a majority of the legwork for you. 
* These examples can be found at: https://getbootstrap.com/docs/4.0/examples/

* Themes, which are basically fully styled and coded websites, can be purchased from https://themes.getbootstrap.com/. However, I do not recommend this, as you should now be able to replicate just about every theme, using the resources and components above, for free. 



