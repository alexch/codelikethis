    topic name: "node"
    topic name: "express"
    topic name: "servers"
    topic name: "git"
    topic name: "heroku"

# Hello, Express!

In this lesson you will create a trivial web application in [Express](https://expressjs.com/) and deploy it to Heroku, where it will be visible to everyone on the Internet. (Since Express is built on top of NodeJS, this lesson is very similar to the [Hello, Node!](./hello_node) lesson.)

# Hello, File!

- In your Terminal, make a directory called `hello-express` with `mkdir hello-express`

- Immediately enter the directory with `cd hello-express`

- run `npm init -y` to create a fresh `package.json` file

- run `npm install express` to load the *express* package into this project

- Launch the Visual Studio Code text editor and open this `code` directory

- Inside this directory make a file named `server.js` and fill it with the following code:

```javascript
const express = require('express')
const app = express()
const port = process.env.PORT || 5000

app.get('/', (request, response) => response.send('Hello, World!'))

app.listen(port, () => console.log(`Listening on port ${port}!`))
```

# Hello, Localhost!

- Go back to the Terminal and run the app with `node server.js`

- Visit <http://localhost:5000/> to see it running on your own computer.

# Hello, Package!

A *package file* contains information about how to build and run your app.

In Code, open the file named `package.json` and add the `start` script line like this:

```json
{
  "name": "hello-express",
  "scripts": {
    "start": "node server.js"
  }
}
```

> Note that the code after `start` is *exactly* what you typed in the shell to run the app locally.

You can test this locally by running `npm start` and refreshing your browser.

# Hello, Git!

Now make a git repo for your app.

> Remember to press CTRL-C to stop the server

> Make sure you are in the correct directory with `pwd`

```bash
pwd           # the response should end with "hello-node"
git init
git add .
git commit -m "first commit"
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

If you are working with a partner, give them a high five.

If you are alone, give yourself a high five.

![high five](../images/high-five.svg)

You deserve it!

<small>image by [Pandark](https://www.deviantart.com/pandark/art/High-Five-350078391) ([CC-BY-SA](http://creativecommons.org/licenses/by-sa/3.0/))
</small>

# Hello, You!

Now go back to Code, and modify the app so instead of saying "Hello, World!" it says something clever and personalized.

Once you've made the change...

1. test it locally
2. add the changed file to git and commit the change
3. re-deploy to Heroku
4. reload the web page and read your new message
5. give yourself a high five!

# Parameters in Express

The special character `:` means "this is a [path parameter](./parameters#path_parameters)"

Example:

|  |  |
|---|---|
| Path:| `/hello/Gandalf` | 
| Route:| `/hello/:friend` | 
| Params:| `{friend: 'Gandalf'}` | 

Express will grab the *value* from the path itself, and put it into the `request.params` object for you to use later.

# Hello, Query Friend!

Now change your "Hello, Express" server to also have the following route:

```javascript
app.get('/hello/:friend', (request, response)=> {
    response.send('Hello, ' + request.params.friend + '!');
});
```

Prove that it works by visiting <http://localhost:5000/hello/Gandalf> (or use your own name)

# Resources

Some other Node/Express tutorials:

* <https://expressjs.com/en/starter/hello-world.html>

* <https://devcenter.heroku.com/articles/getting-started-with-nodejs>

* <https://expressjs.com/>

'