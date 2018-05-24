# What is Responsive Development?

* Responsive development is an approach to building websites that focuses on effectively displaying content in a user friendly way, regardless of the device it is being viewed on. 
* This concept is becoming increasingly important to understand - global web traffic today is primarily, on average, from mobile devices, and no longer desktop browsers.  


# How is This Achieved?

* CSS3 introduced the concept of media queries, that allows developers to target specific screen widths for their CSS properties.
* Media queries are the backbone of front-end responsive development with HTML and CSS.
* Applying unique CSS to specific screen widths allows us to change the layout and styles of our website, based on the size of a device. 
* Percentage widths further assist to style your website in a way that scales down based on the screen width. 

### Media Query Example:

```
// This will make our `.nav` element position relative only when the screen size is less than or equal to 768px wide. 

.nav{
  position:absolute;
}

@media screen and (min-width:768px){
  .nav{
    position:relative;
  }
}

```
# Mobile-First Development

* Developing mobile first means to start styling out your web page for a mobile device, and then modify the layout for a desktop browser. This helps to reduce load times on mobile devices. 
* The result of this is modifying your CSS as screen sizes increase, rather than modifying your CSS as screen sizes increase. 
* In other words, your media queries will be written for minimum widths, not maximum widths.
* Tip: You can also set media queries in-between two screen sizes








