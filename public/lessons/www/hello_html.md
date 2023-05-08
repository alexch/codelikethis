            topic name: "html"
            topic name: "element-structure"
            topic name: "developer-tools"

# Lets Write Another HTML document!

* Create a file named index.html and open it in your text editor
* All HTML documents should begin with a DOCTYPE declaration.  This does not require a **closing tag**.

```html
<!DOCTYPE html>
```

# Basic HTML Structure

* The most basic HTML structure includes a DOCTYPE declaration, an HTML tag, a head tag, and a body tag. This looks like the following:

```html
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

We will now add some text to our first web page! Inside of the `<body>` tag, let's add the following text:

```
Hello, world!
```

So it looks like this:
```html
<!DOCTYPE html>
<html>
  <head>
  </head>
  <body>
    Hello, world!
  </body>
</html>
```

# Let's Open Our Web Page!

* We will now open our web page using a web browser
* Enter `open index.html` into your terminal
  * or on Windows, use `start index.html`
  * or enter `pwd` and copy and paste the directory path into your browser (chrome), then click on the `index.html` file

# Use a VSCode Extension

There are several plugins for VSCode designed to help you serve static webfiles. Let's use one to make viewing our webpage a little easier.

* Go ahead and click the "Extensions" (or press <kbd>ctrl</kbd> + <kbd>shift</kbd> + X)
* Search for 'Live Server' and install the extension of that name developed by Ritwick Dey.
* Close and reopen VSCode.
* You should now have a button in the lower right corner of VSCode that says 'go live'
* Click it to launch your site (locally at least)

# Inspect The File With Chrome

* In your browser, open the "Developer Tools" window
  * On Mac - `⌘ + Shift + C`
  * On Windows / Linux - `Ctrl + Shift + C` or `F12`
  * Or: *right click* on the page and select 'inspect'
* If it isn't clear, find and click on the elements tab
* Notice how the HTML tags are displayed
* You can do this for **any website** to examine how it is structured
  * or to change its colors, or remove ads, or...?

# Lab: Add more Sections

Now that you've got your basic HTML document  set up, let's add a few more sections!

* Each section should consist of at least one image, and some placeholder text
* You can easily generate placeholder text through [lorem ipsum generators](https://loremipsum.io/ultimate-list-of-lorem-ipsum-generators/)
* The basic idea is to have a page that needs to scroll to have different sections in view. So don't be stingy with the text!

