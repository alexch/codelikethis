# Create React App

There is a very useful package called `create-react-app` which will automatically install all your required dependencies, and set up a directory for your react app automatically.

# Using Create React App

1. Install Create React App **globally** `npm install -g creat-react-app`
2. From the command line type `npx create-react-app app-name`

This will create a directory for the front end of your app called `app-name`. Inside that there will be a package.json file with all the scripts you need to create a react app, run it locally, and build a production version of that site.

# Directory Structure

There are two main parts of the `create-react-app` directory

- the `src` folder
- the `public` folder

> If you create a production build with `npm run build` you will additionally have a `build` folder. More on that when we talk about serving React projects next week!

# Core Concept: the `src` folder

The `src` folder is where the meat of your React project lives

- Create a JS file for each component
- Import components where needed
- The `App.js` file lays out the whole page
- `index.js` draws the content to the page
- CSS for your project also goes in here

# Core Concept: the `public` folder

The `public` folder is where your react component gets drawn to.

- Contains `index.html`
- Displays the front end of the app
- Keep images you want to display in here
- Don't tweak the HTML!

# Lab: Create a React Component

Let's create our first React Component!  If you haven't already installed `create-react-app` go ahead and do that now `npm install -g create-react-app`

- `cd` into your code folder
- create a React app named `first-reapp`
- Change your app so it displays an `h1` with the text "Hello, React!"

>Note: After you open VSCode it will ask if you want to use eslint from node modules. React has it's own eslint extension to properly highlight react components so use it.

# Core Concept: functional v. class based components

`create-react-app` generates functional React components

- functions that return JSX
- the return value of the function is drawn to the page
- the name of the function is the name of the component
- component names should be capitalized

You can also use class based components by extending the React Component

- `class MyComponent extends React.Component{...`
- has access to state, and lifecycle methods
- the return value of the `render` method is drawn to the page
- the name of the class is the name of the component
- component names should be capitalized. **Always.**
