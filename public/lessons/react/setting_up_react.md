# Setup for React

This lesson will describe how to:
- Use React in an HTML page
- Configure your editor to highlight React JSX code
- Test the output of JSX in the browser

# Adding React to an HTML Page

React can be added like any other library by using a `<script>` link in the header

The `<script>` link can be to a Content Delivery Network (CDN) or a local package.

# Using the CDN Links

Add the following links to the `<head>` of the HTML file.

### React Development
- https://unpkg.com/react@16/umd/react.development.js

### ReactDOM Development
- https://unpkg.com/react-dom@16/umd/react-dom.development.js

### Babel Standalone
- https://unpkg.com/babel-standalone@6.15.0/babel.min.js

# Example HTML File Head

```html
  <head>
    <meta charset="UTF-8" />
    <title>Hello World</title>
    <script src="https://unpkg.com/react@16/umd/react.development.js"></script>
    <script src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"></script>
    <script src="https://unpkg.com/babel-standalone@6.15.0/babel.min.js"></script>
  </head>
```

# Local Package Installation

You will need to have the following to include React as a local package in your HTML file.

- A package manager like **NPM** or **Yarn**
- A package bundler like **Webpack** or **Browserify**
- A compiler like **Babel**

# Local Package Installation

We will start with installing React using NPM

```sh
npm init -y
npm install --save react react-dom
```

# Local Package Installation

Download the React, ReactDOM, and Babel Scripts from the Content Delivery Network (CDN)

### React Development
- https://unpkg.com/react@16/umd/react.development.js

### ReactDOM Development
- https://unpkg.com/react-dom@16/umd/react-dom.development.js

### Babel Standalone
- https://unpkg.com/babel-standalone@6.15.0/babel.min.js

# Local Package Installation

Put the content of the scripts into a directory called `src` in the project root

```shell
mkdir js
mv path/to/downloads/react.development.js ./src/
mv path/to/downloads/react-dom.development.js ./src/
mv path/to/downloads/babel.min.js ./src/
```

# Local Package Installation

Create an `index.html` file and source all three files in the head

```html
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Hello World</title>
    <script src="src/react.development.js"></script>
    <script src="src/react-dom.development.js"></script>
    <script src="src/babel.min.js"></script>
  </head>
  <body>
    <div id="output"></div>
  </body>
</html>
```

# Local Package Installation

Now simply write some react in a `<script></script>` tag

Example:

```js
<script type="text/babel">
  ReactDOM.render(
  <h1>Hello, local React!</h1>,
  document.getElementById('output')
  );
</script>
```

# Local Package Installation

### Finished simple index.html

```html
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Hello World</title>
    <script src="src/react.development.js"></script>
    <script src="src/react-dom.development.js"></script>
    <script src="src/babel.min.js"></script>
  </head>
  <body>
    <div id="output"></div>
    <script type="text/babel">
      ReactDOM.render(
      <h1>Hello, local React!</h1>,
      document.getElementById('output')
      );
    </script>
  </body>
</html>
```

# Editor Configuration

The VS Code editor extension 'Sublime Babel' will highlight the syntax for React, JSX, and ES6+ Code.

- Visit `https://marketplace.visualstudio.com/vscode`
- Search for "sublime babel"
- Extension page for [Sublime Babel](https://marketplace.visualstudio.com/items?itemName=joshpeng.sublime-babel-vscode)
- Install the extenstion from the Visual Studio Marketplace or directly within the VS Code editor.
