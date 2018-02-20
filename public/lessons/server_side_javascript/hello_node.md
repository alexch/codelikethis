# Hello, Node!

In this lesson you will create a trivial web application in NodeJS and deploy it to Heroku, where it will be visible to everyone on the Internet.

# Hello, File!

- In your Terminal, make a directory called `hello_node` with `mkdir hello_node`

- Immediately enter the directory with `cd hello_node`

- Launch the Atom text editor in this directory with `atom .` (pronounced "Atom Dot")
  - if `atom .` fails, launch Atom and select **Install Shell Commands** from either the *File* or the *Atom* menu

- Inside this directory make a file named `index.js` and fill it with the following code:

```js
@@@ js
var http = require('http');
var port = process.env.PORT || 5000;
http.createServer(function(request, response){
  response.write('Hello from NodeJS!');
  response.end();
}).listen(port);
```

# Hello, Localhost!

- Go back to the Terminal and run the app with `node index.js`

- Visit <http://localhost:5000/> to see it running on your own computer.

# Hello, Procfile!

A *Procfile* tells Heroku what commands to run when it launches your app.

Go back to Atom and create a file named `Procfile` (there is *no extension* on this filename) and fill it with this:

```
web: node index.js
```

> Note that the code after `web:` is *exactly* what you typed to run the app locally.

# Hello, NPM!

You also need a `package.json` file. The easiest way to get one is to run

`npm init -f`

```sh
PS C:\Users\alex\code\hello_node> npm init -f
npm WARN using --force I sure hope you know what you are doing.
Wrote to C:\Users\alex\code\hello_node\package.json:

{
  "name": "hello_node",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}
```

# Hello, Git!

Now make a git repo for your app.

> Remember to press CTRL-C to stop the server

> Make sure you are in the correct directory with `pwd`

```sh
@@@sh
pwd           # the response should end with "hello_node"
git init
git add .
git commit -m 'first commit'
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

```js
heroku open
```

# High Five!

If you are working with a partner, give them a high five.

If you are alone, give yourself a high five.

![high five](../images/high-five.gif)

You deserve it!

<small>photo: <https://dribbble.com/shots/3702481-High-Five-s-for-15Five>
</small>

# Hello, You!

Now go back to Atom, and modify the app so instead of saying "Hello from NodeJS!" it says something clever and personalized.

Once you've made the change...

1. test it locally
2. add the changed file to git and commit the change
3. re-deploy to Heroku
4. reload the web page and read your new message
5. give yourself a high five!

# Resources

Some other Node tutorials:

* <https://devcenter.heroku.com/articles/getting-started-with-nodejs>

* <https://www.nodejsera.com/nodejs-tutorial-day1-thebeginning.html>

* <https://ilovecoding.org/lessons/create-a-simple-http-server-with-nodejs>

see also <https://nodejs.org/en/docs/guides/anatomy-of-an-http-transaction/>
