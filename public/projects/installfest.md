# Installfest

Welcome to Burlington Code Academy!

Before the class starts, please install the following:

* VS Code text editor
* Node.js
* Git
* MongoDB & Compass
* create-react-app

and sign up for accounts on:

* GitHub
* Heroku

> Are you on a recent model Mac? Skip to the [Mac Homebrew](#mac-homebrew) section to install Node and Git, then come back here for GitHub and Heroku.

## VS Code Text Editor

  * **Install** VS Code from Microsoft <https://code.visualstudio.com>
  * Here's a [VS Code Overview](https://medium.freecodecamp.org/an-overview-of-visual-studio-code-for-front-end-developers-49a4aa0771fb) for you to read later
  * **OPTIONAL:** Launch VS Code, then type
      * MacOS: <kbd>CMD</kbd>-<kbd>SHIFT</kbd>-<kbd>P</kbd>
      * Windows: <kbd>CTRL</kbd>-<kbd>SHIFT</kbd>-<kbd>P</kbd>
   * then type "install" and select " **Install 'code' Command In Path** "
   * Now you can type `code .` from the terminal to open the current directory!

## Node.js (JavaScript)

  * **Install** Node.js from <https://nodejs.org/>
  * version 15.X.X Current is preferred (the button on the right side)
    * run `node -v` in terminal to check
    * if you can't install v15, anything past 12.X.X LTS is probably okay

## Git

* **Install** git from  <https://git-scm.com/downloads>

## GitHub

  * **Sign up** for an account at <https://github.com/>

## Heroku

  * **Sign up** for an account at <https://signup.heroku.com>
  * **Install** the Heroku Command Line Interface (CLI) at <https://devcenter.heroku.com/articles/heroku-cli>

---

# Windows Only

## Cmder

1. Visit <https://cmder.net>
2. Click "Download Full"
3. Save the ZIP file and unzip it into your *home directory* or into `C:\cmder`
  * if your username is `Alice` you should now have `C:\Users\Alice\cmder\Cmder.exe`
4. **Right**-click `Cmder` and select "Create Shortcut"
5. **Click and Drag** that shortcut to the desktop
6. **Double-click** the shortcut to open the terminal
7. Press <kbd>Win</kbd>-<kbd>Alt</kbd>-<kbd>P</kbd> (or select "Settings..." from the window's menu) and make sure the "startup task" is set to `{cmd::Cmder as Admin}`

## VS Code Terminal
1. Open VS Code
2. Press <kbd>Crtl</kbd>-<kbd>Shift</kbd>-<kbd>P</kbd>, and type in `Default Shell`
3. Choose  `cmd` or `Git Bash`

---

# MacOS Only

## Mac Homebrew

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

# MongoDB and Compass

MongDB and it's GUI Compass will be used later in the course when we dive in to databases.

## Windows only

Go to MongoDB's website and download the community version of their software [here.](https://www.mongodb.com/try/download/community) Choose the current version with platform set to `Windows` and package set to `msi.` Download and run the automatic installer. Make sure the "Install Compass" box is checked (it should be by default)

## Mac

Check the documentation on [this page](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-os-x/) for Mac install instructions.

Run the following commands in your terminal to install mongoDB:

* `brew tap mongodb/brew`
* `brew install mongodb-community@4.4`

And run the following command to test it:

* `brew services start mongodb-community@4.4`

If you run into any issues please let one of our instructors or TAs know

# Create React App

Run the following command in your terminal:

* `npm install -g create-react-app`
