# Installfest

Welcome to Burlington Code Academy!

Before the class starts, please install the following:

* VS Code text editor
* Python 3
* Git
* GitHub
* Heroku

> Are you on a recent model Macintosh? Skip to the [Mac Homebrew](#mac-homebrew) section to install Python and Git, then come back here for GitHub and Heroku.

## VS Code Text Editor

  * **Install** VS Code from Microsoft <https://code.visualstudio.com>
  * Here's a [VS Code Overview](https://medium.freecodecamp.org/an-overview-of-visual-studio-code-for-front-end-developers-49a4aa0771fb) for you to read later

## Python

* **Install** Python 3 from python.org - the latest version at this writing is 3.7.2

### MacOS

* Download and install from https://www.python.org/downloads/mac-osx/ (or see below if you use Homebrew)

### Windows

* Download and install from: https://www.python.org/downloads/windows/
  * make sure to check the "Add Python 3.7 to PATH" checkbox

For ease of use and compatibility with Unix, you may want to make a `python3` script as follows:

1. open a terminal and run `where python` to find the python installation directory
2. inside that directory make a file named `python3.bat` containing the lines:
    
```
@ECHO OFF
%~dp0python %*
```

## Git

* **Install** git from...
  * for Mac and Linux: <https://git-scm.com/downloads>
  * for Windows: <https://gitforwindows.org/>

## GitHub

  * **Sign up** for an account at <https://github.com/>
  * **Install** the GitHub Desktop app at <https://desktop.github.com/>
  * Add an SSH key to your GitHub account; follow these instructions: <https://help.github.com/articles/connecting-to-github-with-ssh/>

## Heroku

  * **Sign up** for an account at <https://signup.heroku.com>
  * **Install** the Heroku Command Line Interface (CLI) at <https://devcenter.heroku.com/articles/heroku-cli>
  * Use the `heroku login` command to log in to the Heroku CLI from your terminal

---

# Mac Homebrew

Homebrew is a package manager for MacOS that lets you install tools directly from the Terminal. Once it's installed, it's generally easier to use Homebrew than to use a web browser and graphical installer app.

These instructions are for recent versions of MacOS. If these do not work for you, don't worry; cancel out and follow the instructions above instead.

## XCode Command-Line Tools

1. Open **Terminal** and type

        xcode-select --install
2. On the dialog box, click the **Install** button
3. Wait several minutes for the download to complete

## Homebrew

1. Visit https://brew.sh
2. Copy the *entire line* underneath "Install Homebrew"
3. Open **Terminal** and paste
4. Enter your password and hit <kbd>Return</kbd> as prompted

## Python and Git

Open Terminal and type the following:

```bash
brew install git
brew install python3
```

If you get a permission error, or if `pip3 --version` does not look like this:

```bash
$ pip3 --version
pip 18.1 from /usr/local/lib/python3.7/site-packages/pip (python 3.7)
```

then fix the permissions and try again:

```bash
sudo chown -R $(whoami) $(brew --prefix)/*
brew reinstall python3
```

If all goes well, sign up for GitHub and Heroku using the instructions above.

