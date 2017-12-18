# The Command Line

* the **TERMINAL** is a window into which you can talk directly to your computer
  * aka *console* or *command line* or *command prompt*
* very low level, based entirely on text and typing, not graphics and mousing
* when you type into the terminal, you are always issuing **COMMANDS**
  * which is why it's called the Command Line
  
# Opening the Terminal

* to open your Terminal:
  * Mac OS: launch the "Terminal" application
  * Windows: launch "Command Prompt" or "Windows PowerShell" or "bash"
    * **[TODO: troubleshoot Windows terminal instructions]**
* **Important:** make your terminal *as tall as possible*
  * errors are often long and you want to start reading at the very top

# Directories

* a DIRECTORY is a location on your hard disk
  * also called a FOLDER
* directories can contain FILES
* directories can also contain other directories (called SUBDIRECTORIES)

# The Current Directory

* inside the Terminal, you are *always* inside a directory
* it is very important not to get lost! You must try to remember which directory you are in.
* If you forget, you can use a special command called `pwd`

# Home Directory

* when you first open the Terminal you are in your HOME DIRECTORY
* usually you don't want to store files directly in here

# Listing Directory Contents

* when you type `ls` ("list") it shows the contents of the current directory

# Making a directory

* when you type `mkdir` ("make dir") it creates a new SUBDIRECTORY inside the current directory
        
        mkdir code
        
# Changing directories

* `cd` ("change dir") moves you into a different directory
* For example, `cd code` would move you into a directory named `code`
* If you ever get lost, type `cd` all on its own and press the return key. This will send you back to your home directory.

# Basic Command Line Glossary

* `pwd` ("print working dir") -- shows the name of the current directory
* `ls` ("list") -- shows the contents of the current directory
* `mkdir` ("make dir") -- creates a new SUBDIRECTORY inside the current directory
* `cd` ("change dir") -- move into a different directory
* `touch whatever.txt` -- creates an empty file named `whatever.txt` inside the current directory

*These apply to Unix shells, but most work in Windows too*

# LAB: make a subdirectory and then enter it

1. open Terminal
2. make a new subdirectory using `mkdir code`
3. change into that directory using `cd code`
4. list its contents using `ls` (and note that it's empty)

# Files

* a file is a place on disk for storing stuff
* "stuff" here could be anything at all
  * documents, pictures, sounds, applications...
* every file lives inside a directory

# Text Editor

* a text editor is a program that edits a text file
* a text editor is *like* a word processor
* but a text editor is **not** a word processor
* You probably have *Atom* 
  * others include *TextMate*, *Notepad++*, *Sublime Text*
  * but **NOT** *TextEdit* or *Notepad* or *Microsoft Word*

# Source File

* source code is the essence of a program
* source files are text files that contain source code
* to **RUN** a JavaScript program you type `node` and then the name of the source file

* The Recipe Metaphor
  * source file = recipe
  * running = cooking

# LAB: Hello, World

1. Make sure you are in your `code` subdirectory using `pwd`
2. Create a file named `hello.js` using `touch hello.js`
3. Open `hello.js` in your favorite text editor
4. Inside this file, put the following source code:

        console.log("Hello, World!");

5. Save the file 
6. Go back to the terminal
7. Run this file using `node hello.js`

What happens? Is this what you expected?

