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

# Local Package Installation Requirements

You will need to have the following to include React as a local package in your HTML file.

- A package manager like **NPM** or **Yarn**
- A package bundler like **Webpack** or **Browserify**
- A compiler like **Babel**

# Local Package Installation Setup

We will start with installing React using NPM

```sh
npm init -y
npm install --save react react-dom
```

# Local Package Installation 1

Download the React, ReactDOM, and Babel Scripts from the Content Delivery Network (CDN)

### React Development
- https://unpkg.com/react@16/umd/react.development.js

### ReactDOM Development
- https://unpkg.com/react-dom@16/umd/react-dom.development.js

### Babel Standalone
- https://unpkg.com/babel-standalone@6.15.0/babel.min.js

# Local Package Installation 2

Put the content of the scripts into a directory called `src` in the project root

```shell
mkdir js
mv path/to/downloads/react.development.js ./src/
mv path/to/downloads/react-dom.development.js ./src/
mv path/to/downloads/babel.min.js ./src/
```

# Local Package Installation 3

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

# Local Package Installation 4

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

# Finished Local Package Installation

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

# React Setup with NPM

Rather than importing react directly into your html you can include react in your dependencies, and write react code in your javascript files.

# NPM Install

There are several packages to install to get your react app setup properly

1. `npm init -y` to initialize your `package.json` file
2. `npm install react react-dom babel` and optionally `react-scripts`
  * `react scripts` isn't necessary to get your react app up and running, but it will give you some pre-built scripts to make setup much easier
  * Be aware though; react-scripts has very specific ideas about how you should structure your directory. If you're missing anything, or things aren't named as expected react-scripts will tell you so when you try to run `react-scripts start`
3. Create a `public` subdirectory
  * inside your public directory create an `index.html` file
  * in your index.html set up your basic html structure (! + tab) and create a div in the body called `root`
4. In your main directory create a `src` subdirectory
  * inside `src` create a file named `index.js`
  * import react and react dom into index.js
  
  ```js
  import React from 'react'
  import ReactDOM from 'react-dom'
  ```
  
  * You can now extend the `React.Component` class to create stateful react components, and the `ReactDOM.render(element, component)` method to render your component(s) to the page.
  * setup a start script in your package.json `"start" : "react-scripts start"
  * see a development version of your app by running `npm start` It will be served at localhost:3000 by default.

# Using 'Create React App'

There is also a package called `create-react-app` which will automatically install all your required dependencies, and set up a directory for your react app automatically.  Using Create React App is simple:

1. Install Create React App **globally** `npm install -g creat-react-app`
2. In the directory you want to create your react app in; from the command line type `npx create-react-app app-name`

This will create a **new** directory for the front end of your app called `app-name`. Inside that there will be another package.json file with all the scripts you need to create a react app, run it locally, and build a production version of that site.

Keep all your react components in the `src` folder, and you're good to go!