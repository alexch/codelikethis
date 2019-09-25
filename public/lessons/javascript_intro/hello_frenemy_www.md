# Hello Friend Web Version

Your Hello.js file can now filter out friends and enemies and respond accordingly. Awesome!

Unfortunately it only exists on your local machine, and onle runs in the terminal.

Let's share it with the world!

# Structuring your directory
  Make a new subdirectory for your hello.js program and go ahead and move that file into there

  Inside that same directory create a new file called `index.html`

  >In a blank HTML file you can type `!` and then hit `tab` to get a basic HTML template.

# Serving your Files

We are going to use a javascript library called `node-static` to serve your static files so we can view them in the browser.

* First type `npm init -y` into the terminal. Accept all the default settings.
  * IMPORTANT: make sure you are in the correct directory first
  
  * You should now have a file called `package.json` in your directory

* Type `npm install node-static` into the terminal

* Type `npx node-static .` to serve your files to localhost.
  * Go to localhost:8080 in your browser. What do you see?

# Adding Content
Your browser probably just opened up to a blank page. This is because we haven't added any content yet, but that's easy to fix.

Create a `<div>` element with an `id` property and add a little text content.

Your `index.html` file should now look something like this

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
</head>
<body>
  <div id="myID">Hello!</div>
</body>
</html>
```

# Importing your code

To get your code into your web page you will need to add a `<script>` tag to the bottom of the `<body>` section of your HTML and give it a property of `src="hello.js"`

```html
<body>

  <script src="hello.js"></script>
</body>
```

Congratulations! Your code will now run in the browser

# Changing Input/Output

Your code is still writing to the terminal, but we want it to greet you on the page.

Instead of using `console.log()` as your output lets target your `<div>` and overwrite its text content (`yourDiv.textcontent=...`) with your friend/enemy message.

# Getting the Name

Now we are going to get the name to be passed into your hello.js file from the URL

If the user types `localhost:8080/name` into the browser we want the page to respond to that name.

Let's `console.log` out `window.location.pathname`

What did you get?

# Put it all Together

Once we get the name we can pass it into the program

Use your Javascript file to manipulate the DOM to display the desired message for the given name

Restart your server and test it out!

>You may need to do a hard refresh of the page before your changes take effect. `Ctrl` + `shift` + `r` to do a hard refresh on a PC; `cmd` + `shift` + `r` on Mac