
# Welcome to Bootstrap!

Bootstrap is a mobile first, open-source, front-end development framework that helps developers and designers to easily build responsive websites. 

* Originally created by a developer and designer at Twitter in 2010 
* Allows you to apply a vast library of styles and layouts to your website, simply by adding specific classes to your HTML elements. * These base styles normalize the overall UI of your website across modern browsers.
* This establishes a standard look and feel for specific elements such as buttons, tables, typography, forms, and more. 

![Image of Bootstrap logo](https://www.vectorlogo.zone/logos/getbootstrap/getbootstrap-card.png "Bootstrap Logo")

# The 12 Column Layout

Bootstrap employs a *12 column layout* to help easily establish a styles for a responsive website. By adding classes to your HTML elements, you can set how many columns each div will span (out of 12). These classes are as follows:

```
col-lg-12 // class used for large devices like laptops ~ 1024px
col-md-12 // class used for medium devices like tablets ~ 992px
col-sm-12// class used for small devices like mobile phones ~ 768px
```

* Lg, md, and sm designate the screen size, while the number indicates how many columns the element will span. 
* Tip: If more than 12 columns are designated inside a *row* (ex. an element 5 columns wide and an element 10 columns wide), extra columns will wrap to a new line;

![Bootstrap 12 column grid](https://mobomo.s3.amazonaws.com/uploads/2017/09/BlogArticle-BootstrapGrid.png "Bootstrap Grid System")

## Example

if I want a sidebar on my website, I may want it to take up 3 columns, or one quarter of the page width (25%). If I want my sidebar to take up 3 columns, I would assign it the class `col-sm-3`. This says that on a small screen (less than 768px) or larger, the div will take up 3 columns. However, it is poosible you may want your sidebar to be a quarter of the page width on a desktop, but be full-width on a mobile device. In this instance you would add the classes `col-sm-3 col-md-12`. This applies the following CSS:

```
@media screen and (min-width:768px){
  .sidebar{
    width:100%;
  }
}
@media screen and (min-width:992px){
  .nav{
    width:25%;
  }
}
```

<IMG OF BOOTSTRAP SIDEBAR>

# The Bootstrap Grid

Since websites are not newspapers, content is not exclusively broken out into columns. You will likely want to place your columns inside of *rows* as well. This is straight-forward with Bootstrap - simply nest your column divs in an element with the class `row`! 

* IMPORTANT: Rows need to be wrapped within a `.container` (fixed-width) or a `.container-fluid` (full-width) element.
* Padding is automatically added to columns to add a 'gutter' in between elements. 
* The left and right padding of the first and last elements is then removed via negative margins that are applied to rows. Because of this, elements need to be nested in the following order: `container > row > columns`.


![bootstrap columns and rows](https://i.imgur.com/FaYuui8.png "Bootstrap Rows")

