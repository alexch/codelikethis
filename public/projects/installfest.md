# Installfest

Welcome to Burlington Code Academy!

Before the class starts, please install the following:

* VS Code text editor
* Node.js
* Git
* GitHub
* Heroku

> Are you on a recent model Macintosh? Skip to the [Mac Homebrew](#mac-homebrew) section to install Node and Git, then come back here for GitHub and Heroku.

## VS Code Text Editor

  * **Install** VS Code from Microsoft <https://code.visualstudio.com>
  * Here's a [VS Code Overview](https://medium.freecodecamp.org/an-overview-of-visual-studio-code-for-front-end-developers-49a4aa0771fb) for you to read later

## Node.js (JavaScript)

  * **Install** Node.js from <https://nodejs.org/>
  * version 10.10.0 is preferred
    * run `node -v` in terminal to check
    * if you can't install v10, anything past 6.0 is probably okay

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

## NodeJS and Git

Open Terminal and type the following:

```
brew install node
brew install git
```

If all goes well, sign up for GitHub and Heroku using the instructions above.
