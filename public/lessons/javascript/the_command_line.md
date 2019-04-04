    link href: "https://vimeo.com/152746852",
         name: "Terminal 101",
         description: "intro to unix command-line by a former Turing School student"
    link href: "https://www.learnenough.com/command-line-tutorial"
    topic name: "terminal"
    topic name: "command-line"
    topic name: "node"
    topic name: "text-editor"
    topic name: "directories"
    link href: "https://www.macworld.co.uk/how-to/mac-software/mac-terminal-projects-tutorial-3613813/",
         name: "30 Terminal tips, tricks and projects for Mac"

# The Command Line

* the **TERMINAL** is a window into which you can talk directly to your computer
  * aka *console* or *command line* or *command prompt* or *shell*

![Shall we play a game?](../images/wargames-terminal.jpg)

<small>from WarGames, (1983)</small>

* when you type into the terminal, you are issuing **COMMANDS** to the computer
* a *CLI* (Command Line Interface) is different from the *GUI* (Graphical User Interface) you are used to
  * more primitive
  * more powerful

# Historical Terminal

Computers used to not have screens! They were connected to devices like this:

![tty](tty.jpg)

the Terminal app is a direct descendant of a TeleType printer or TTY.

See [this twitter thread](https://twitter.com/b0rk/status/980825751456047104) for more history [and TTY pix](https://twitter.com/pdutta/status/980855463343476737).

<small>picture of Teletype Corporation ASR-33 on display at the Computer History Museum by ArnoldReinhold [[CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0)] via [Wikimedia](https://commons.wikimedia.org/wiki/File:ASR-33_at_CHM.agr.jpg)</small>

# Opening the Terminal

* to open your Terminal:
  * Mac OS: launch the "Terminal" application
  * Windows: Starting in Windows Vista, there are two command shells: Windows Powershell, and Command Prompt. Launch Command Prompt (cmd).
* **Important:** make your terminal as **tall** as possible
  * when reading a program's output you want to start reading *at the top*...
  * ...and if your window is too short then the top lines will *scroll away* and you will miss them
  * Make it look like this:

![terminal next to browser](../images/terminal-and-browser.png)
![terminal next to browser](../images/terminal-and-browser-win.png)


# Lab: Interactive Calculator

1. open a terminal
2. type `node` -- that's you *commanding* the computer to launch *node*
1. press the <kbd>Return</kbd> key (also called <kbd>Enter</kbd>)
1. see the `>` prompt
1. type `1 + 1`
1. press the `return` key again
1. see the `2`

* Yay! Your computer is an expensive calculator!
* **Bonus**: what other math can you do?

## node is an interactive JavaScript interpreter

* From now on, whenever you see text in the `code font`, try typing it into the terminal and see what happens!

# A Tale of Two Prompts

> WARNING: Before you start typing, look at the prompt!

* *the shell* is the command line interpreter that the terminal starts with
  * its prompt is usually
    *  `Davids-Macbook-Pro:~ David$` (Mac)
    *  `jessee@jesseews:~$` (Ubuntu Linux)
    *   `C:\Users\alice>` (Windows)
* *node* is a command line that is launched *from the shell*
  * its prompt is usually `>`

From inside `node`, if you want to get back to the shell...

  * type <kbd>CONTROL</kbd>-<kbd>C</kbd> twice
  * or type `.exit` and <kbd>Enter</kbd>

# Directories

* a DIRECTORY is a location on your hard disk
  * also called a FOLDER
* directories can contain FILES
* directories can also contain other directories (called SUBDIRECTORIES)

# The Current Directory

* inside the Terminal, you are *always* inside a directory
* it is very important not to get lost! You must try to remember which directory you are in.

# Where am I?

It is very easy to get lost in a maze of directories.

To find out which directory you are in, type

    pwd

This stands for "print working directory" or "present working directory" (not "password").

# Home Directory

* when you first open the Terminal you are in your HOME DIRECTORY
* usually you don't want to store files directly in here
* for this class, we recommend:
  * create a `code` directory inside your home directory
  * create a new directory inside `code` for each lesson or project
> WARNING: On some windows systems, Command Prompt will open to `C:\Windows\System32`

# Listing Directory Contents

* when you type `ls` ("list") it shows the contents of the current directory
  * **On Windows** you need to type `dir` instead
  
* if you type `ls -al` ("list all long") it also shows *hidden* files and *extra info* like the modification date
  * **On Windows** you need to type `dir /A:SH` instead 

# Making a directory

* when you type `mkdir` ("make directory") it creates a new SUBDIRECTORY inside the current directory

```bash
mkdir code
```

# Changing directories

* `cd` ("change dir") moves you into a different directory
* For example, `cd code` would move you into a subdirectory named `code`
* If you ever get lost, type `cd` all on its own and press the return key. This will send you back to your home directory.
  * (unix shell only, not Windows)

# Basic Command Review

* `pwd` ("print working dir") -- shows the name of the current directory
* `ls` ("list") -- shows the contents of the current directory
* `mkdir` ("make dir") -- creates a new SUBDIRECTORY inside the current directory
* `cd` ("change dir") -- move into a different directory

> These apply to Mac & Unix shells, Windows equivalents are below.
* `cd` ("change dir") -- With no directory, it lists the current directory. Otherwise, it changes to the specified directory
* `dir` ("directory") -- shows the contents of the current directory
* `mkdir` ("make dir") `` creates a new SUBDIRECTORY inside the current directory


# LAB: make a subdirectory and then enter it

1. open **Terminal** or **Command Prompt**
2. make a new subdirectory using `mkdir code`
3. change into that directory using `cd code`
4. make sure you're really there using `pwd`
   * **On Windows** use `cd`
5. list its contents using `ls` (and note that it's empty)
   * **On Windows** use `dir`
# Files

* a file is a place on disk for storing stuff
* "stuff" here could be anything at all
  * documents, pictures, sounds, applications...
* every file lives inside a directory

# Text Editor

* a text editor is a program that edits a text file
* a text editor is *like* a word processor
* but a text editor is **not** a word processor
* You probably have *VS Code* <https://code.visualstudio.com/>
  * others include *TextMate*, *Notepad++*, *Sublime Text*, *Vim*, *Emacs*, *Atom*
  * but **NOT** *TextEdit* or *Wordpad* or *Microsoft Word*

# Source File

* source code is the essence of a program
* source files are text files that contain source code
* to **RUN** a JavaScript program you type `node` and then the name of the source file

```bash
$ node hello.js
Hello, World!
```

* The Recipe Metaphor
  * source file ≈ recipe
  * running a program ≈ cooking

# LAB: Hello, World

1. Make sure you are in your `code` subdirectory using `pwd` or `cd`
2. Open this directory in your text editor
    * for VSCode, use `code .` ("code dot")
3. Create a file named `hello.js` using the *File > New* menu
4. Inside this file, put the following source code:

        console.log("Hello, World!");

5. Save the file
6. Switch back to the terminal (using <kbd>Alt</kbd>-<kbd>Tab</kbd> or <kbd>Cmd</kbd>-<kbd>Tab</kbd> or clicking)
  * If you are using VS Code, you can click **Terminal &rarr; New Terminal**
7. Run this file using `node hello.js`

What happens? Is this what you expected?

# Command-Line Shortcuts

These work in `bash`:

![bash shortcuts](../images/bash-cursor-shortcuts.jpg)

Also:

* use <kbd>Esc</kbd> instead of <kbd>Alt</kbd> for the above
* <kbd>Esc</kbd>-<kbd>Backspace</kbd> (delete previous word)
* up/down arrow (scroll through history)
* <kbd>End</kbd> and <kbd>Home</kbd> (jump to end or beginning of line)
* <kbd>Tab</kbd> for auto-completion of filenames (e.g. typing `node h`<kbd>Tab</kbd> will emit `node hello.js`)

<small>(image source: [Clément Chastagnol](https://clementc.github.io/blog/2018/01/25/moving_cli/))</small>

# LAB: Next Steps

Want to learn enough command line to be dangerous?
Check out <https://www.learnenough.com/command-line-tutorial> by Michael Hartl (founder of [Tau Day](https://tauday.com/) and all around solid geek).

Want to be a command-line hacker like in War Games?
Play this game: <http://overthewire.org/wargames/bandit/> where you use *your real command line* `ssh` tool to connect to sandboxed hosts and infiltrate them.

Want to learn the history of software user interfaces and operating systems? 
Read [In The Beginning Was The Command Line](http://cristal.inria.fr/~weis/info/commandline.html) by Neal Stephenson

