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

# Parts of a Computer

* Input (keyboard, mouse, network)
* Storage (disk drive aka *filesystem*)
* Memory (RAM)
* Processor (CPU)
* Output (screen, sound, network)

# The Command Line

* the **terminal** is a window into which you can talk directly to your computer
  * aka *console* or *command line* or *command prompt* or *shell*

![Shall we play a game?](/images/wargames-terminal.jpg)

<small>from WarGames, (1983)</small>

* when you type into the terminal, you are issuing **commands** to the computer
* a *CLI* (Command Line Interface) is different from the *GUI* (Graphical User Interface) you are used to
  * a CLI is more primitive **and more powerful** than a GUI

# Historical Terminal

Computers used to not have screens! They were connected to devices like this:

![tty](/images/tty.jpg)

The Terminal app is a direct descendant of a TeleType printer or TTY.

When you type into the console and hit <kbd>Enter</kbd> you are pretending to type a line onto a TTY; the scrolling terminal is like a roll of printer paper.

See [this twitter thread](https://twitter.com/b0rk/status/980825751456047104) for more history [and TTY pix](https://twitter.com/pdutta/status/980855463343476737).

<small>picture of Teletype Corporation ASR-33 on display at the Computer History Museum by ArnoldReinhold [[CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0)] via [Wikimedia](https://commons.wikimedia.org/wiki/File:ASR-33_at_CHM.agr.jpg)</small>

# Lab: Opening the Terminal

* to open your Terminal:
  * **Mac OS**: launch the "Terminal" application
  * **Windows**: launch the "Cmder" application (pronounced "Commander"), make a new console (<kbd>Ctrl</kbd>-<kbd>T</kbd>) and select
    * Startup directory: `C:\Users\yourname`
  * *Windows (alternate)*: Launch the Windows Command Prompt (`cmd.exe` or `PowerShell`) -- but beware, the commands are slightly different than in bash

* **Important:** make your terminal as **tall** as possible and *don't overlap windows*
  * when reading a program's output you want to start reading *at the top*...
  * ...and if your window is too short then the top lines will *scroll away* and you will miss them
  * Make it look like this:

![terminal next to browser](/images/terminal-and-browser.png)
![terminal next to browser](/images/terminal-and-browser-win.png)

# Lab: Interactive Calculator

1. open a terminal
1. look at the prompt -- it should end with a `$` or `>` symbol
1. type `node` -- that's you *commanding* the computer to launch *node*
1. press the <kbd>Return</kbd> key (also called <kbd>Enter</kbd>)
1. see the `>` prompt
1. type `1 + 1`
1. press the <kbd>Return</kbd> key again
1. see the `2`

* Yay! Your computer is an expensive calculator!
* **Bonus**: what other math can you do?

# Node is a JavaScript Engine

![Diagram: Node Train: Command Line](/images/train.png)

An "engine" is a type of program that either [*executes* or *empowers*](https://en.wikipedia.org/wiki/Software_engine) other programs.

NodeJS (aka `node`) is an engine that runs JavaScript programs -- either from files, or interactively from the command line.

# A Tale of Two Prompts

> WARNING: Before you start typing, look at the prompt!

* *the shell* is the command line interpreter that the terminal starts with
  * its prompt is usually
    *  `Davids-Macbook-Pro:~ David$` (Mac)
    *  `david@davidspc:~$` (Ubuntu Linux)
    *   `C:\Users\david>` (Windows)
* *node* is a command line program that is launched *from the shell*
  * its prompt is usually `>`

From inside `node`, if you want to get back to the shell...

  * type <kbd>Ctrl</kbd>-<kbd>C</kbd> twice
  * or type `.exit` and <kbd>Enter</kbd>

# When in doubt, try it out!

From now on, whenever you see text in the `code font`, try typing it into the terminal and see what happens! For example:

```javascript
'pod' + 'cast'
```

If that doesn't print `'podcast'`, look at the prompt; you may be inside your shell instead of inside node.

# Directories

* a *directory* is a location on your hard disk
  * also called a *folder*
* directories can contain *files*
* directories can also contain other directories (called *subdirectories*)

# Where am I?

* Inside the Terminal, you are always "inside" a directory.
* It is very easy to get lost in a maze of directories.
* To find out which directory you are in, type: <kbd>p</kbd><kbd>w</kbd><kbd>d</kbd><kbd>Return</kbd>
  * This stands for "print working directory" (not "password").
  * Most of the time you can also look at the prompt to see what the current directory is.

# Home Directory

* when you first open the Terminal you are in your HOME DIRECTORY
* if you store files directly in your home directory, it will soon get cluttered
* for this class, we recommend:
  * create a `code` directory inside your home directory
  * create a new directory inside `code` for each lesson or project
> WARNING: On some windows systems, Command Prompt will open to `C:\Windows\System32`

> WARNING: On some windows systems, Command Prompt will open to `C:\Windows\System32`. You can get back to your home directory by typing `cd %HOME%`

# Listing Directory Contents

* when you type `ls` ("list") it shows the contents of the current directory
  * **On Windows** you may need to type `dir` instead

* if you type `ls -al` ("list all long") it also shows *hidden* files and *extra info* like the modification date
  * **On Windows** you may need to type `dir /A:SH` instead

# Lab: Home Decor

1. Using your GUI, navigate to your home directory and open it in a file manager window.
<br>(Your file manager is called "Finder" in MacOS, or "Explorer" in Windows. There are various ones on linux.)
2. Using your terminal, list your home directory's contents.
3. Look carefully at them both. What's the same? What's different?

# Making a directory

* when you type `mkdir` ("make directory") it creates a new *subdirectory* inside the current directory

```bash
mkdir code
```

# Changing directories

* `cd` ("change dir") moves you into a different directory
* For example, `cd code` would move you into a subdirectory named `code`
* If you ever get lost, type `cd` all on its own and press the return key. This will send you back to your home directory.
  * (unix shell only, not Windows)

# Basic Command Review (Unix)

* `pwd` ("print working dir") -- shows the name of the current directory
* `ls` ("list") -- shows the contents of the current directory
* `mkdir` ("make dir") -- creates a new subdirectory inside the current directory
* `cd` ("change dir") -- move into a different directory

> These apply to Mac / Unix / Linux / bash

# Basic Command Review (DOS)

* `cd` ("change dir") -- With no directory, it lists the current directory. Otherwise, it changes to the specified directory
* `dir` ("directory") -- shows the contents of the current directory
* `mkdir` ("make dir") -- creates a new subdirectory inside the current directory

> These apply to Windows / DOS / PowerShell

# LAB: make a subdirectory and then enter it

1. open **Terminal** or **Command Prompt**
1. Confirm that you are in your home directory
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
* to **RUN** a JavaScript program you type `node` and then the name of the source file, like this:

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
  <br>(If you are using VS Code, you can click **Terminal &rarr; New Terminal** for the built-in terminal panel)
7. Run this file using `node hello.js`

What happens? Is this what you expected?

# LAB: Countdown

1. Inside your `code` directory, create a file named `countdown.js`
2. Inside this file, put the following source code:

        let count = 10;

        while (count > 0) {
          console.log(count + '...');
          count = count - 1;
        }

        console.log('Blastoff!');

3. Save the file
4. In your terminal, run `node countdown.js`

# Analyzing Countdown

![Countdown Breakdown](https://docs.google.com/drawings/d/e/2PACX-1vT5Z2Po-THntSfzUutbzDljBAxqCEE9gh7HTzRAalMMqpSol8BTqUnjsD6vexS-EFrO5FCNBKHqwbxQ/pub?w=960&amp;h=720)

> Consider this a sneak peek; we will cover all of these concepts in later lessons

# Command-Line Shortcuts

These work in `bash`:

![bash shortcuts](/images/bash-cursor-shortcuts.jpg)

Also:

* you can use <kbd>Esc</kbd> instead of <kbd>Alt</kbd> for the above
* <kbd>Esc</kbd>-<kbd>Backspace</kbd> (delete previous word)
* up/down arrow (scroll through history)
* <kbd>End</kbd> and <kbd>Home</kbd> (jump to end or beginning of line)
* <kbd>Tab</kbd> for auto-completion of filenames (e.g. typing `node h`<kbd>Tab</kbd> will emit `node hello.js`)

<small>(image source: [Clément Chastagnol](https://clementc.github.io/blog/2018/01/25/moving_cli/))</small>

# More Resources:

Want to learn enough command line to be dangerous?
Check out <https://www.learnenough.com/command-line-tutorial> by Michael Hartl (founder of [Tau Day](https://tauday.com/) and all around solid geek).

Want to be a command-line hacker like in War Games?
Play this game: <http://overthewire.org/wargames/bandit/> where you use *your real command line* `ssh` tool to connect to sandboxed hosts and infiltrate them.

Want to learn the history of software user interfaces and operating systems?
Read [In The Beginning Was The Command Line](http://cristal.inria.fr/~weis/info/commandline.html) by Neal Stephenson
