# Install Fest Instructions

Welcome to your Burlington Code Academy software program!

We will use several tools during class, please see the instructions for installing the specific tools you will need based on your operating system.

Please note that we can support students using the following operating systems:
  - Windows 10+
  - Apple MacOS Mojave 10.14+

## Windows Installation

The instructions below will walk you through installing the following tools:

1. Node.js JavaScript Engine
2. Git Version Control System
3. Visual Studio Code Text Editor
4. Cmder Terminal Emulator
5. MongoDB and Mongo Compass GUI
6. Heroku Command-line Tools

You will also be show how to sign up for a user account on the following services:

1. GitHub
2. Heroku

### Node.js JavaScript Engine

1. Visit the Node.js® homepage at <https://nodejs.org/en/>
2. Click and download the installer for the **Current** version
3. Run the managed installer from your Downloads folder
4. Select the default options for installation location and packages

### Git Version Control System

#### Git Command Line Tool Installation

1. Visit the Git downloads page at <https://git-scm.com/downloads>
2. Click on the link for Windows
3. Run the installer from your downloads folder
4. Select the default options

#### Github User Account

1. Visit the Github Signup page at <https://github.com/join>
2. Create a user account and select a unique user name.
3. **Optional**: Read about [Getting started with Github](https://docs.github.com/en/github/getting-started-with-github)

### Visual Studio Code Text Editor

**NOTE**: The tool we are going to use is `Visual Studio Code` which is a free open-source editor with a strong developer community, made by Microsoft. 

This is a different tool than `Microsoft Visual Studio` which is a non-free proprietary tool for enterprise software teams. 

**Please make sure to download and install the correct tool, [Visual Studio Code](https://code.visualstudio.com/)**

1. Download the Installer <https://code.visualstudio.com/download>
2. Run the installer, accepting the default options
3. Run the VS Code Application from the start menu or shortcut.
4. **Optional**: Read the [Node.js in VS Code Tutorial](https://code.visualstudio.com/docs/nodejs/nodejs-tutorial)

#### Helpful VS Code Extensions for Node.js

The following extensions for VS Code are helpful, but optional. You can learn how to install extensions [from the official documentation](https://code.visualstudio.com/docs/editor/extension-marketplace).

* [Bracket Pair - Colorizer 2](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2)
* [Prettier - Code Formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
* [Visual Studio IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode)

### Cmder Terminal Emulator

1. Visit <https://cmder.net>
2. Click "Download Full"
3. Save the ZIP file and unzip it into your *home directory* or into `C:\cmder`
  * if your username is `Alice` you should now have `C:\Users\Alice\cmder\Cmder.exe`
4. **Right**-click `Cmder` and select "Create Shortcut"
5. **Click and Drag** that shortcut to the desktop
6. **Double-click** the shortcut to open the terminal
7. Press <kbd>Win</kbd>-<kbd>Alt</kbd>-<kbd>P</kbd> (or select "Settings..." from the window's menu) and make sure the "startup task" is set to `{cmd::Cmder as Admin}`

### MongoDB and Mongo Compass

#### MongoDB Service

1. Visit the MongoDB installation page at <https://docs.mongodb.com/manual/tutorial/install-mongodb-on-windows/>
2. Download the MongoDB Community Server at: <https://www.mongodb.com/try/download/community>
3. Run the installer from your Downloads folder
4. Choose the "Complete" setup type from the installation wizard
5. On the "Service Configuration" pane, select "Run Service as Network Service User"

#### MongoDB Compass

**NOTE**: MongoDB Compass is usually installed automatically when MongoDB Community Edition is installed via the official installer. Only follow the instructions below if something goes wrong during the Community Edition installer and Compass failed to install.

1. Visit the MongoDB Compass installation instructions <https://docs.mongodb.com/compass/master/install/>
2. Download MongoDB Compass from <https://www.mongodb.com/try/download/compass>
3. Run the installer from your Downloads folder
4. Accept the default values for installation location and options

### Heroku Command Line Tools

#### Heroku User Account

For the Heroku Command Line Tools to work correctly you will need a Heroku user account.

1. Visit https://signup.heroku.com/
2. Create a new user account
3. **Optional**: Read about [Getting started with Node.js on Heroku](https://devcenter.heroku.com/articles/getting-started-with-nodejs)

#### Heroku Command Line Tools Installation Steps

1. Visit the Heroku Command Line Tools documentation page at <https://devcenter.heroku.com/articles/heroku-cli>
2. Download the installer for Windows at <https://cli-assets.heroku.com/heroku-x64.exe>
3. Run the installer from your Downloads folder and accept the default options, you may be asked to login to Heroku, so if you have not yet signed up for the service, do so.
4. Login to the Heroku service from the command-line tool by running the command below in a terminal window, you will need an active user account prior to running this command.

        heroku login

---

## Apple MacOS Installation

The instructions below will walk you through installing the following tools:

1. Visual Studio Code
2. Apple Command Line Tools
3. Homebrew package manager
4. Node.js JavaScript Engine
5. Heroku Command-line Tools
6. MongoDB and Mongo Compass GUI

You will also be show how to sign up for a user account on the following services:

1. GitHub
2. Heroku

### Visual Studio Code Text Editor

**NOTE**: The tool we are going to use is `Visual Studio Code` which is a free open-source editor with a strong developer community, made by Microsoft. 

This is a different tool than `Microsoft Visual Studio` which is a non-free proprietary tool for enterprise software teams. 

**Please make sure to download and install the correct tool, [Visual Studio Code](https://code.visualstudio.com/)**

1. Download the Installer <https://code.visualstudio.com/download>
2. Expand the Application within your `Downloads` folder.
3. Move the `Visual Studio Code.app` package to your `/Applications` directory
3. Run the VS Code Application from the `/Applications` directory, **do not run it from within your `Downloads` folder** as you will not be able to use all the features
4. Add VS Code to your Dock by right-clicking on the icon to bring up the context menu and choosing Options, Keep in Dock
5. Install the `code` command-line tool by performing the following
      * Open VS Code if you have not yet done so.
      * Open the `Command Palette` by typing the following <kbd>CMD</kbd>-<kbd>SHIFT</kbd>-<kbd>P</kbd>
      * Type `install code command` and then typing <kbd>RETURN</kbd>
      * You may be asked to confirm you want to install the `code` command
      * See the [official documentation for additional help](https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line)
6. **Optional**: Read the [Node.js in VS Code Tutorial](https://code.visualstudio.com/docs/nodejs/nodejs-tutorial)

#### Helpful VS Code Extensions for Node.js

The following extensions for VS Code are helpful, but optional. You can learn how to install extensions [from the official documentation](https://code.visualstudio.com/docs/editor/extension-marketplace).

* [Bracket Pair - Colorizer 2](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2)
* [Prettier - Code Formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
* [Visual Studio IntelliCode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode)

### Apple Xcode Command-Line Tools

You will be using the default Terminal.app program to access command-line tools and execute programs throughout the course. If you have never opened the Terminal.app program before, visit [this documentation page from Apple to learn how to do so.](https://support.apple.com/guide/terminal/open-or-quit-terminal-apd5265185d-f365-44cb-8b09-71a064a42125/2.11/mac/11.0)

Some of the command-line tools which used to be installed by default on MacOS are not installed optionally by using the `xcode-select --install` command within the Terminal.app.

Follow the instructions below to install the tools required to be able to use additional developer tools, including MacOS Homebrew.

1. Open the MacOS **Terminal** and type

        xcode-select --install

2. In the dialog box, click the **Install** button
4. You may be asked to enter your user login password
3. Wait several minutes for the download and installation to complete

### MacOS Homebrew

Homebrew is a package manager for MacOS that lets you install tools directly from the Terminal. Once it's installed, it's generally easier to use Homebrew than to use a web browser and graphical installer app.

These instructions are for recent versions of MacOS (MacOS v10.14 Mojave or newer). If these do not work for you, don't worry we can assist you in installing the tools another way.

#### Install Homebrew

1. Visit https://brew.sh
2. Find the section labeled "Install Homebrew"
3. Copy the **entire line** beneath "Install Homebrew"
4. Open a **Terminal.app** window and paste the copied text
5. The text will look like this, please refer to the text from the <https://brew.sh> homepage

        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

4. Enter your password and hit <kbd>Return</kbd> as prompted, **you will not see the characters as you type your password**, this is default behavior in command-line applcations.

### Node.js (JavaScript)

We prefer to use the `brew` command to install Node.js. If you have not yet installed Homebrew in the instructions above, please do so.

#### Install Node.js using Homebrew

1. Open a Terminal.app window and type the following, followed by <kbd>Return</kbd>

        brew install node

2. Confirm that Node.js is installed by typing the command below, followed by <kbd>Return</kbd>

        node --version

3. You should see a version string such as v16.1.0 or similar

        v16.1.0

#### Alternative Install of Node.js

If you cannot install Homebrew or have a problem installing Node.js using Homebrew, you can instead use the Node.js foundation installation steps.


1. Visit the Node.js homepage at <https://nodejs.org/en/>
2. Version v16.1.x **Current** is preferred (the button on the right side)
3. Check that a version of Node.js is installed
4. Open a Terminal.app window and type the command below followed by <kbd>Return</kbd>

        node --version

5. You should see a version string such as v16.1.0 or similar

        v16.1.0

### Git Version Control System

#### Git Command Line Tool

The version control tool Git is installed when you completed the command `xcode-select --install`. If for some reason you were unable to install the Xcode command-line tools, then you can install Git manually by following the instructions below.

1. Visit the Git Downloads page at  <https://git-scm.com/downloads>
2. Download the installer for MacOS
3. Run the installer from the Downloads folder, you may be asked for your password
4. Confirm that Git is installed by running the command below followed by <kbd>Return</kbd>

          git --version

5. You should see something like the following, any version above v2.0 is fine

          git version 2.30.0

#### Github User Account

1. Visit the Github Signup page at <https://github.com/join>
2. Create a user account and select a unique user name.
3. **Optional**: Read about [Getting started with Github](https://docs.github.com/en/github/getting-started-with-github)

### Heroku Command Line Tools

#### Heroku User Account

For the Heroku Command Line Tools to work correctly you will need a Heroku user account.

1. Visit https://signup.heroku.com/
2. Create a new user account
3. **Optional**: Read about [Getting started with Node.js on Heroku](https://devcenter.heroku.com/articles/getting-started-with-nodejs)

#### Heroku Command Line Tools Installation Steps

1. Visit the Heroku Command Line Tools documentation page at <https://devcenter.heroku.com/articles/heroku-cli>
2. Install the tolls for MacOS by running the command below in a Terminal.app window

        brew tap heroku/brew && brew install heroku

3. Confirm that the Heroku command-line tools are installed by running the command below

        heroku --version

4. You should see something like the following output, any version above `v7.50.0` is fine

        heroku/7.54.0 darwin-x64 node-v12.21.0

5. Login to the Heroku service from the command-line tool by running the command below, you will need an active user account prior to running this command.

        heroku login

### MongoDB and Compass

MongDB and it's GUI Compass will be used later in the course when we dive in to databases.

Check the documentation on [this page](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-os-x/) for Mac install instructions.

#### MongoDB Service

1. Run the following commands one after the other in your terminal to install mongoDB

          brew tap mongodb/brew
          brew install mongodb-community

2. Then run the following command to test it:

          brew services start mongodb/brew/mongodb-community

3. If you run into any issues please let one of our instructors or TAs know

#### MongoDB Compass Graphical Interface

1. Visit the MongoDB Compass installation instructions <https://docs.mongodb.com/compass/master/install/>
2. Download MongoDB Compass from <https://www.mongodb.com/try/download/compass>
3. Run the installer from your Downloads folder
4. Accept the default values for installation location and options
