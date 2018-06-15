# Lets write our first HTML document!

* Create a file named index.html and open it in your text editor
* All HTML documents should begin with a DOCTYPE declaration.  This does not require a **closing tag**.

```
<!DOCTYPE html>
```

# Basic HTML Structure

* The most basic HTML structure includes a DOCTYPE declaration, an HTML tag, a head tag, and a body tag. This looks like the following:

```
<!DOCTYPE html>
<html>
  <head>
  </head>
  <body>
  </body>
</html>
```

* Notice how the head and body sections are **nested** in the HTML tags. 
* HTML does not *need* to be indented, however...
* Nesting is *very* important to make your code easier to read for humans.
* Add the code above into your file

# Let's Add Content!

We will now add some text to our first web page! Inside of the ```<body>``` tag, let's add the following text:

```
Hello World!
```
 
# Let's Open Our First Web Page!

* We will now open our first web page using a web browser
* Enter ```open index.html``` into your terminal
* If that doesn't work, enter ```pwd``` and copy and paste the directory path into your browser (chrome), then click on the index.js file


# Inspect The File With Chrome

* On Mac - ⌘ + Shift + C. On Windows / Linux - Ctrl + Shift + C OR F12
* Or: Right click on the page and select 'inspect'
* If it isn't clear, find and click on the elements tab 
* Notice how the HTML tags are displayed
* You can do this for any website to examine how it is structured