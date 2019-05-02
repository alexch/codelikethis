    topic name: "text-editor"
    topic name: "console"
    topic name: "terminal"
    topic name: "javascript"
    topic name: "coding"
    topic name: "code"
    topic name: "languages"
    topic name: "www"
    topic name: "nodejs"
    topic name: "argv"
    link name: 'How to Design Programs (preface)',
         href: "https://htdp.org/2018-01-06/Book/part_preface.html"
    link name: "Khan Academy: How Computers Work",
            href: "https://www.khanacademy.org/computing/computer-science/how-computers-work2/v/khan-academy-and-codeorg-what-makes-a-computer-a-computer"
    @description = "JavaScript is the language of the web and is growing ever more important in the world of software. In this introductory workshop you will use JavaScript, HTML, and CSS to deploy a small application from your laptop to the cloud using the command line, Node.js, Heroku, and Github."

# Technical requirements

See the [Installfest](/projects/installfest) project for more instructions.

Software:

* a text editor (VS Code from Microsoft)
* a JavaScript engine (NodeJS)
* Git

Accounts:

* GitHub
  * **Sign up** for an account at <https://github.com/>
  * Add an SSH key to your GitHub account; follow these instructions: <https://help.github.com/articles/connecting-to-github-with-ssh/>
* Heroku
  * **Sign up** for an account at <https://signup.heroku.com>
  * **Install** the Heroku Command Line Interface (CLI) at <https://devcenter.heroku.com/articles/heroku-cli>

> If you do not have these, RAISE YOUR HAND!

# A Taste of JavaScript

You may never have coded before. Today you will.

# What will we learn?

In this class, you will learn about:

*  Code and coding
*  The command line and why we use it
*  How to run your code interactively or from a file
*  How to make a very simple website run on your own computer
*  How to deploy your website to the cloud, where anyone in the world can visit

Follow along online! Put a browser pointed at this site on one side of your screen, and Terminal on the other.

# What if I know some of this already?

* Pair up
* Help your partner, help your neighbor
* Docendo discimus ("By Teaching We Learn")
* Promote yourself to TA

> The best way to learn is to teach. <br>- [Latin proverb](https://en.wikipedia.org/wiki/Docendo_discimus)

# What is code?

Generally, *code* is something that stands for something else.

Specifically, *source code* is a series of instructions that tell a computer what to do.

> With computers, "code" is not about **secrets** -- it's about **symbols**.

# What is coding?

* coding is fun!
* coding is frustrating!
* coding is creative!
* coding is communication
  * between you and a computer
  * between you and other coders
  * between you and future you

# What is coding NOT?

* coding is **not** advanced mathematics
  * some logic (if / then / and / or / etc.)
  * mostly just counting ("do this 10 times")
* coding is **not** solitary
  * most coding happens in a team
  * all professional coding happens with clients / users / designers / managers etc.
  * pair programming is awesome
* coding is **not** about finding the right answer
  * there's always more than one way to do it
  * every solution has tradeoffs
  * there is always a better way, and never a perfect way
  * often the hardest part of coding is *defining* the problem, not solving it

> "The only perfect program is an empty file." - Alex

# A Program Is Like A Recipe

* a recipe is a collection of *ingredients* and *instructions*

![Grandma's Cookie Recipe](../images/cookie-recipe.gif)

* a program is a collection of *data* (ingredients) and *code* (instructions)

> When you are coding, you are not baking cookies; you are writing a recipe for how to make cookies.

Writing a recipe involves trying out the recipe (baking a test batch), then tweaking the recipe and trying again and again until you get it right.

<small>(recipe from popcornpottery.com)</small>

# Languages

* every program is written in a **language**
  * like Java or Python or C or Fortran
  * even HTML and CSS and SQL are languages
  * computer languages all have very silly names
* computer languages are **very specific** compared to natural languages
* different languages are useful in different areas, but there is a lot of overlap
* today we will play with the JavaScript programming language

# Errors Are Awesome

* Don't be afraid of errors
* Your computer is trying to help you fix your program
  * It's just *really* bad at communicating

> If your code is a two-year-old child, then an error is a temper tantrum.

(It can take effort to figure out the underlying reason why they're upset and fix it.)

* It's not all gibberish
* Try to read it -- really try! -- and pull out the pearls from the pig slop

See also: [What went wrong?](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/What_went_wrong) from MDN

# JavaScript, child of the World Wide Web

* JavaScript was invented (in 1995) to allow "scripting" on web pages
* Prior to JavaScript, any input was sent to a *web server* via a *form*, and the user had to wait for a *new web page* to download before seeing any results or changes
* JavaScript allows a web page to respond immediately and interactively

For example:

```html
<button onclick='clicked()'>Click Me!</button>
<script>
let clicks = 0;
function clicked() {
  clicks = clicks + 1;
  event.target.textContent = clicks;
}
</script>
```

<button onclick='clicked()'>Click Me!</button>
<script>
let clicks = 0;
function clicked() {
  clicks = clicks + 1;
  event.target.textContent = clicks;
}
</script>

# The Command Line

* the **terminal** is a window into which you can talk directly to your computer
  * aka *console* or *command line* or *command prompt* or *shell*
* when you type into the terminal, you are issuing **commands** to the computer
* a *CLI* (Command Line Interface) is different from the *GUI* (Graphical User Interface) you are used to
  * a CLI is more primitive **and more powerful** than a GUI

# Historical Terminal

Computers used to not have screens! They were connected to devices like this:

![tty](../images/tty.jpg)

The Terminal app is a direct descendant of a TeleType printer or TTY.

When you type into the console and hit <kbd>Enter</kbd> you are pretending to type a line onto a TTY; the scrolling terminal is like a roll of printer paper.

See [this twitter thread](https://twitter.com/b0rk/status/980825751456047104) for more history [and TTY pix](https://twitter.com/pdutta/status/980855463343476737).

<small>picture of Teletype Corporation ASR-33 on display at the Computer History Museum by ArnoldReinhold [[CC BY-SA 3.0](https://creativecommons.org/licenses/by-sa/3.0)] via [Wikimedia](https://commons.wikimedia.org/wiki/File:ASR-33_at_CHM.agr.jpg)</small>

# Lab: Opening the Terminal

* to open your Terminal:
  * **Mac OS**: launch the "Terminal" application
  * **Windows**: launch the "Cmder" application (pronounced "Commander"), make a new console (<kbd>Ctrl</kbd>-<kbd>T</kbd>) and select
    * Startup command: `{bash::bash}`
    * Startup directory: `C:\Users\yourname`
  * *Windows (alternate)*: Launch the Windows Command Prompt (`cmd.exe` or `PowerShell`) -- but beware, the commands are slightly different than in bash

* **Important:** make your terminal as **tall** as possible and *don't overlap windows*
  * when reading a program's output you want to start reading *at the top*...
  * ...and if your window is too short then the top lines will *scroll away* and you will miss them
  * Make it look like this:

![terminal next to browser](../images/terminal-and-browser.png)

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

![Diagram: Node Train: Command Line](https://docs.google.com/drawings/d/e/2PACX-1vSKCgLe4wp1JroIot-SsVP-TKqHsySU-06oOGe3zYWBZ4jOc77quoRH2XhyNKBBuLx4IgbLim2NZLqK/pub?w=953&amp;h=522)

An "engine" is a type of program that either [*executes* or *empowers*](https://en.wikipedia.org/wiki/Software_engine) other programs.

NodeJS (aka `node`) is an engine that runs JavaScript programs -- either from files, or interactively from the command line.

# A Tale of Two Prompts

> WARNING: Before you start typing, look at the prompt!

* *the shell* is the lowest level command line
  * its prompt usually looks like this:
    *  `Davids-Macbook-Pro:~ David$` (Mac)
    *  `david@davidspc:~$` (Ubuntu Linux)
    *   `C:\Users\david>` (Windows)
* *node* is a command-line program that is launched *from the shell*
  * its prompt is usually just a greater-than `>` character

From inside `node`, if you want to get back to the shell...

  * type <kbd>Ctrl</kbd>-<kbd>C</kbd> twice
  * or type `.exit` and <kbd>Enter</kbd>

# Basic Commands (Mac / Unix / Bash)

* `pwd` ("print working dir") -- shows the name of the current directory
* `ls` ("list") -- shows the contents of the current directory
* `mkdir` ("make dir") -- creates a new subdirectory inside the current directory
* `cd` ("change dir") -- move into a different directory

> Windows shells have slightly different commands; if these commands don't work for you, ask a TA how to use "bash" instead.

# Home Directory

* the shell is always "inside" a directory
    * To find out which directory you are in, type `pwd`
    * This stands for "print working directory"
    * Most of the time the prompt also shows the current directory
* when you first open the Terminal you are in your **home directory**
* if you store files directly in your home directory, it will soon get cluttered
* for this class, we recommend:
  * create a `code` directory inside your home directory
  * create a new directory inside `code` for each project

# LAB: make a subdirectory and then enter it

1. Open **Terminal** or **Command Prompt**
1. Confirm that you are in your home directory
2. Make a new subdirectory using `mkdir code`
3. Change into that directory using `cd code`
4. Make sure you're really there using `pwd`
   * **On Windows** use `cd`
5. List its contents using `ls` (and note that it's empty)
   * **On Windows** use `dir`

# Source File

* source code is the essence of a program
* source files are text files that contain source code
* to **run** a JavaScript program you type `node` and then the name of the source file, like this:

```bash
$ node hello.js
Hello, World!
```

* The Recipe Metaphor
  * source file ≈ recipe
  * running a program ≈ cooking

# LAB: Hello, World

1. Make sure you are in your `code` subdirectory using `pwd` and/or `cd`
2. Open this directory in your text editor
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

# LAB: Changing Ingredients

* Remember the cooking analogy? The code is the instructions; now let's allow the user (you!) to change the ingredients
* Change line 1 to the following:

        let count = parseInt(process.argv[2])

* run the program with new inputs from the command line like this:

        node countdown 5
        node countdown 100

# ARGV

* `process` is a built-in *library object* provided by NodeJS
* `process.argv` is an *array* containing the *command-line arguments*
* For example, on my system, if I type `node countdown 99`, `argv` contains...

| index | meaning | value |
|---|---|---|
| 0 | location of the NodeJS engine | `'/usr/local/Cellar/node/11.10.0/bin/node'` |
| 1 | location of the current program | `'/Users/alex/code/countdown'` |
| 2 | "first" command-line argument | `'99'` |

* Computers (usually) start counting at zero, so `process.argv[2]` gets the third item from the array `process.argv`
