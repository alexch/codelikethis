# Set Up a Heroku Account

If you don't have a heroku account you should create one now.

Go to [heroku.com](https://www.heroku.com) follow the signup instructions, and download their CLI tool.

You will also need to download the Git CLI tool

# Prepare Tic-Tac-Toe

Install express `npm install express`

Create a server file in the root of your tic-tac-toe directory (app.js or server.js are good names for this file)

Turn your directory into a git repository be typing `git init` into the terminal.  Make sure you're in the right repository!

# Setting up the Server

This is what your server file should look like:

```javascript
var express = require('express');
var app = express();
var path = require('path');

app.use(express.static(path.join(__dirname)));

app.get('/', function (req, res) {
  res.sendFile(path.join(__dirname + '/index.html'));
});

app.listen(process.env.PORT || 8080);
```

# Add a Start Script

Once you deploy your app to Heroku it will need to know which file to run to serve your app.

We tell it which file to run with a start script in your `package.json`.  Open up the package.json file and look for the section that says `"scripts": {}` You will already have a "test" script in the `scripts` object. Put a comma after it and below it in the object add a line that looks like this `"start": "node server.js"`

```javascript

"scripts": {
  "test": "echo \"Error: no test specified\" && exit 1",
  "start": "node server.js" //or whatever you decided to call your server file
}

```

# Create a New Heroku Project

Add and commit your changes to the git repository. `git add .` then `git commit -m "a commit message goes here"` in the terminal

Creating a new Heroku project is as easy as typing `heroku create` into the terminal

You can now deploy your app to heroku be typing `git push heroku master` into the terminal.

#High Five!
You now have a working web app that anyone in the world can visit!