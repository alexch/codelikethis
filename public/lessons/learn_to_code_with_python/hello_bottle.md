    topic name: "servers"
    topic name: "git"
    topic name: "heroku"
    topic name: "python"
    topic name: "bottle"

# Hello, Bottle!

In this lesson you will create a trivial web application with [Bottle](http://bottlepy.org/docs/dev/index.html) (a Python web server framework) and deploy it to Heroku, where it will be visible to everyone on the Internet.

Please make sure you have followed the steps in [Python Installfest](/projects/installfest_python) first.

This lesson will prove that your system is set up correctly, and demonstrate modern development practices, including:
 
   * version control
   * continuous integration
   * 12-factor deployment
   * probably some other buzzwords :-)  

# Hello, Bottle!

- In your Terminal, make a directory called `hello-bottle` with `mkdir hello-bottle`

- Immediately enter the directory with `cd hello-bottle`

- run `pip3 install bottle` to install the *bottle* package into your python environment

- Launch the Visual Studio Code text editor in this directory with `code .` (pronounced "Code Dot")
  - if `code .` fails, launch VS Code, then type 
    * MacOS: <kbd>CMD</kbd>-<kbd>SHIFT</kbd>-<kbd>P</kbd>
    * Windows: <kbd>CTRL</kbd>-<kbd>SHIFT</kbd>-<kbd>P</kbd>
  - then type "install" and select " **Install 'code' Command In Path** "
  - then go back to the terminal and try `code .` again

# Hello, File!

- Inside the `code/hello-bottle` directory make a file named `app.py` and fill it with the following code:

``` python
import os
from bottle import route, run, template

@route('/')
def index():
    return '<b>Hello!</b>'

run(host='0.0.0.0', port=os.getenv('PORT', 5000)))
```

# Hello, Localhost!

- Go back to the Terminal and run the app with `python3 hello.py`

- Visit <http://localhost:5000/> to see it running on your own computer.

# Hello, Git!

Now make a git repo for your app.

> Remember to press CTRL-C to stop the server

> Make sure you are in the correct directory with `pwd`

```bash
pwd           # the response should end with "hello-bottle"
git init
git add .
git commit -m "hello world in bottle"
```

# Hello, Version Two!

Go back into your text editor and *add a route* below the `return` line and above the `run` line:

```python
@route('/hello/<name>')
def greet(name):
    return template('<b>Hello, {{name}}!</b>', name=name)
```

In your terminal, quit (<kbd>Ctrl</kbd>-<kbd>C</kbd>) and relaunch (`python3 hello.py`) your server, then visit the following URL:

* <http://localhost:5000/hello/Mike> 

Now make a *second commit* in your git repository:

```bash
git add .
git commit -m "hello name"
```

# Prepare for liftoff...

Next we will create a few configuration files that will help you deploy your application to the cloud.

<!--BOX-->
`Procfile` (to tell Heroku how to launch your app)

```
web: python3 hello.py
```
<!--/BOX-->

<!--BOX-->
`requirements.txt` (to tell Python what packages to install)

```
bottle
```
<!--/BOX-->

<!--BOX-->
`runtime.txt` (to tell Heroku what version of Python to use)

```
python-3.7.1
```

(Check [Heroku's Python Page](https://devcenter.heroku.com/articles/python-support#supported-runtimes) to see if they support Python 3.7.2 yet)

<!--/BOX-->

Once again, make a *git commit* in your local repository:

```bash
git add .
git commit -m "add deployment config files"
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

![high five](../images/high-five.gif)

You deserve it!

<small>photo: <https://dribbble.com/shots/3702481-High-Five-s-for-15Five>
</small>

# Hello, You!

Now go back to Code, and modify the app so instead of just saying "Hello!" it says something clever and personalized.

Once you've made the change...

1. test it locally
2. add the changed file to git and commit the change
3. re-deploy to Heroku
4. reload the web page and read your new message
5. give yourself a high five!

# Resources

* https://devcenter.heroku.com/articles/python-support
* https://devcenter.heroku.com/articles/getting-started-with-python
