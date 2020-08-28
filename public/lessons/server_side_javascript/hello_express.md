    topic name: "node"
    topic name: "express"
    topic name: "servers"
    topic name: "git"
    topic name: "heroku"

# Hello, Express!

In this lesson you will create a trivial web application in [Express](https://expressjs.com/) and deploy it to Heroku, where it will be visible to everyone on the Internet.

# Hello, File!

- In your Terminal, make a directory called `hello-express` with `mkdir hello-express`

- Immediately enter the directory with `cd hello-express`

- run `npm init -y` to create a fresh `package.json` file

- run `npm install express` to load the *express* package into this project

- Launch the Visual Studio Code text editor and open this `hello-express` directory

- Inside this directory make a file named `server.js` and fill it with the following code:

```javascript
const express = require('express')
const app = express()
const port = process.env.PORT || 5000

app.get('/', (request, response) => {
  response.send('Hello, World!');
})

app.listen(port, () => console.log(`Listening on port ${port}!`))
```

# Hello, Localhost!

- Go back to the Terminal and run the app with `node server.js`

- Visit <http://localhost:5000/> to see it running on your own computer.

# Hello, Package!

A *package file* contains information about how to build and run your app.

In Code, open the file named `package.json`, it will have a section like this:

```json
"scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
```

Add a start script like this:

```json
"scripts": {
    "start": "node server.js",
    "test": "echo \"Error: no test specified\" && exit 1"
  },
```

> Note that the code after `start` is *exactly* what you typed in the shell to run the app locally.

You can test this locally by running `npm start` and refreshing your browser.

# Hello, Git!

Now make a git repo for your app.

> Remember to press CTRL-C to stop the server

> Make sure you are in the correct directory with `pwd`

```bash
git init

git add .

git commit -m "initial commit"
```

# Hello, Heroku!

Heroku uses git for its deploys. Whenever you push a new version of your git repo to Heroku, it automatically deploys the app to the cloud.

```sh
heroku create

git push heroku master
```

If all goes well, you will see a URL on your console, something like this:

```
remote: https://damp-retreat-99529.herokuapp.com/ deployed to Heroku
```

Visit this URL in a web browser using copy-and-paste, or use this handy shortcut from the console:

```bash
heroku open
```

# High Five!

Give yourself a high five.

![high five](/images/high-five.svg)

You deserve it!

<small>image by [Pandark](https://www.deviantart.com/pandark/art/High-Five-350078391) ([CC-BY-SA](http://creativecommons.org/licenses/by-sa/3.0/))
</small>

# Lab: Hello, You!

Now go back to VSCode, and modify the server code so instead of saying "Hello, World!" it says something clever and personalized.

Once you've made the change...

* test it locally
* add the changed file to git and commit the change
* re-deploy to Heroku
* reload the web page and read your new message
* give yourself a high five!


# Parameters in Express

The special character `:` means "this is a [path parameter](./parameters#path_parameters)"

Example:

|  |  |
|---|---|
| Path:| `/hello/Gandalf` | 
| Route:| `/hello/:friend` | 
| Params:| `{friend: 'Gandalf'}` | 

Express will grab the *value* from the path itself, and assign it to `request.params` for you to use later.

# Lab: Visualize It

In your `server.js` file, set up a route `/:key`, that when visited,
prints `request.params` to the command line.

Then visit `http://localhost:5000/value`

You should see the params printing to the terminal

<details>
<summary>Solution</summary>
<div>

```javascript
app.get('/:key', (request,response)=>{
  console.log(request.params) // prints {key: 'value'}
})
```
</div>

</details>


# Lab: Hello, Query Friend!

Now change your `server.js` code so that when you visit a path containing someone's name, it greets the user by that name.

e.g. visiting `http://localhost:5000/Gandalf` prints "Hello, Gandalf!" on the web page.

<details>
<summary>Hint</summary>
You can set up a path parameter in express with a colon `:` followed by the variable name
e.g. `/:friend` provides a variable in the `params` object with the key of `friend`

</details>

<details>
<summary>Solution</summary>
Add the following route to your `server.js` file
<div>

```js
app.get('/:friend', (req, res) => {
  res.send('Hello, ' + req.params.friend + "!")
})
```

</div>

</details>

# Resources

Some other Node/Express tutorials:

* <https://expressjs.com/en/starter/hello-world.html>

* <https://devcenter.heroku.com/articles/getting-started-with-nodejs>

* <https://expressjs.com/>

