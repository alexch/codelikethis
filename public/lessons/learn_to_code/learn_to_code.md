# todo: 

* loops
* numbers
* arrays
  *  shuffle!
* hashes
* bonus labs (for students who "get it" before the rest of the room and don't want to sit around bored (or help others))
* functions?
* methods?
* nil
* interpolation?

* diagram: memory (variables+objects)

# Learn To Code

You may have never programmed before. Now you will.

In this class, you will utilize Ruby to learn:

*  The command line and why we use it
*  Learn about Strings, Arrays, Variables, Objects, Loops, Files
*  Object concepts like Classes
*  How to run your Ruby code interactively (irb) or from a file
*  Make a very simple website run on your own computer

---

# What is a computer?

* A smart box
  * desktop
  * laptop
  * cell phone
  * smart phone

# The Universal Machine

* A computer can do anything
  * (at least on the inside)
* This can be intimidating!
* But the basic rules are simple

# The Command Line

* the *TERMINAL* is a window into which you can talk directly to your computer
* [find a picture: war games: shall we play a game?]
* aka *console* or *command line* or *command prompt*

# irb - the Interactive Ruby Browser

## Exercise: Calculator

* open a terminal
* type `irb`
* see the `>` prompt
* type `1 + 1`
* press the `return` key (also called `enter`)
* see the `2`
* yay, a $1000 calculator!

* Bonus: what other math can you do?

* From now on, whenever you see text in the `code font`, try typing it into irb and see what happens!

---

# Computer Anatomy

## Hardware

* CPU ("the brain")
* Memory
* Input/Output
  * keyboard, mouse, touch screen, monitor

bonus: [Von Neumann Machine]()

## Software

* Operating System
* Libraries
* Applications
* Languages

Every piece of software on your computer is a PROGRAM.

# A Program Is Like A Recipe

* a recipe is a collection of *ingredients* and *instructions*
* a program is a collection of *data* and *code*

> When you are writing code, you are not baking cookies, you are writing a recipe for how to make cookies.

# Languages

* every program is written in a LANGUAGE
  * like Java or Python or C or Fortran
  * even HTML and CSS and SQL are languages
  * every computer language has a silly name
* different languages are useful in different areas, but there is a lot of overlap
* today we will learn the RUBY programming language

# Ruby

* Ruby was invented in the 1990s by a very nice Japanese man named Matz
* The motto of Ruby is MINASWAN:

> Matz is nice, and so we are nice.

* Ruby was designed to be fun to write code in, while also being powerful and well-rounded.

---

# Objects

An OBJECT is a location in computer memory where you can store DATA.

[todo: say "values" or "info" instead of "data"?]

There are many kinds of objects, including String, Number, Array, Hash, Time... These are called CLASSES. 

Some day soon you will create your own classes but for now, we will use the built-in ones.

# Numbers

A NUMBER is what it sounds like.

    10
    -12
    3.14

# Strings

A STRING is a collection of characters, like a word or a sentence.

    "apple"
    "banana"
    "Cherry Pie"

# Messages and Operators

An object responds to MESSAGES. You send it messages using OPERATORS.

The most powerful operator is DOT. 

On screen she looks like a period, but here's what she looks like up close:

![picture of Dot the Operator](dot.jpg)

Dot can send any message she likes, by name, to any object.

    "apple".upcase
    
# Other Operators

There are other operators, like PLUS (`+`) and TIMES (`*`), but they only send one message each.

And remember, Dot is more powerful than any other operator!

    2 + 7

is the same as

    2.+ 7

Both send the message `+` to the object `2`.

# Return Values

Every time an object receives a message, it returns a response.

The response is also called the VALUE or the RETURN VALUE.

You can think of it as the answer to a question. 

    2 + 2    # Question: What is 2 + 2?
    4        # Answer: 4

# String Messages

A string understands lots of messages. Here are a few:

    "banana".upcase
    "Cherry".downcase
    "date".capitalize
    "elderberry".reverse
    "fig".length
    "Fig Newton".swapcase

Try all of these out in irb!

# String Operators

A string also understands several other operators:

    "blue" + "berry"
    "yum" * 10
    "elderberry"[8]

`+` `*` and `[]` are pronounced PLUS, TIMES, and SUB

Try these out in irb!

# Combining Messages and Operators

You can combine messages and operators at will.

    "fig".upcase.reverse
    "grape".reverse * 10 + "!!!"

Definitely try these out in irb! It's pretty fun.

# LAB: Playing With Strings And Numbers

Answer the following questions using irb:

* How many seconds are in an hour?
* How many seconds are in a week?
* What is the reverse of "stressed"?
* What does your name look like, repeated 1000 times?
* What is the tenth character of "Matz is nice"? (Trick question!)

---

# Variables

A VARIABLE is a NAME for an object. You give an object a name using the ASSIGNMENT operator (it looks like an equal sign).

    color = "blue"
    fruit = "berry"

Anywhere you can use an object, you can use a variable instead.

    color + fruit
    fruit.upcase
    
# The Warehouse Metaphor

![Warehouse from Raiders of the Lost Ark](warehouse.jpg)

If memory is a giant warehouse...

...and objects are boxes in that warehouse

...then data is the **contents** of a box

...and a variable is a **label** you stick on the outside of the box

# Changing Variables

You can assign and reassign variables at will.

    color = "blue"
    fruit = "berry"
    color + fruit
    
    color = "black"
    color + fruit
    
Changing a variable (using ASSIGNMENT) just changes the name of an object. It does *not* change the data inside the object.

# Changing Values

Most messages do not change the data inside the object.

    color.upcase
    color

But some messages do change the data!
    
    color.upcase!
    color

This can be dangerous so sometimes those messages end with a BANG (exclamation point).

[ later: multiple variables pointing to same object, etc. -- needs memory model diagram / animation ]

# Lab: Play In IRB

Let's spend 15 minutes just playing around in IRB. Some things to try:

* write a poem
* YELL THE POEM
* calculate 2 + 2 and more complicated things
* assign your best friend to a variable
* reverse your best friend's name
* get a new best friend and reverse her too

---

# The Command Line

* the TERMINAL is a window into which you can talk directly to your computer
  * aka *console* or *command line* or *command prompt*
* very low level, based entirely on text and typing, not graphics and mousing
* when you type into the terminal, you are always issuing COMMANDS
  * which is why it's called the Command Line

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

* when you open the Terminal you are in your HOME DIRECTORY
* usually you don't want to store files directly in here

# Making a directory

* `mkdir` ("make dir") creates a new SUBDIRECTORY inside the current directory

# Changing directories

* `cd` ("change dir") moves you into a different directory
* For example, `cd code` would move you into a directory named `code`
* If you ever get lost, type `cd` all on its own and press the return key. It will send you back to your home directory.

# Basic Command Line Glossary

* `pwd` ("print working dir") -- shows the name of the current directory
* `ls` ("list") -- shows the contents of the current directory
* `mkdir` ("make dir") -- creates a new SUBDIRECTORY inside the current directory
* `touch whatever.txt` -- creates an empty file named `whatever.txt` inside the current directory
* `cd` ("change dir") -- move into a different directory

# LAB: make a subdirectory and then enter it

1. open Terminal
2. make a new subdirectory using `mkdir code`
3. change into that directory using `cd code`

# Files

# Text Editor

* a text editor is a program that edits a text file
* a text editor is *like* a word processor
* but a text editor is **not** a word processor
* You probably have *Sublime Text* 
  * others include *TextMate*, *Notepad++*
  * but **NOT** *TextEdit* or *Notepad* or *Microsoft Word*

# Source File

* source code is the essence of a program
* source files are text files that contain source code
* to RUN a program you type `ruby` and then the name of the source file

# LAB: Hello, World

1. Make sure you are in your `code` subdirectory using `pwd`
2. Create a file named `hello.rb` using `touch hello.rb`
3. Open `hello.rb` in your favorite text editor
4. Inside this file, put the following source code:

        puts "Hello, World!"

5. Save the file 
6. Go back to the terminal
7. Run this file using `ruby hello.rb`

What happens? Is this what you expected?


---

# Input and Output

* Computers have many senses -- keyboard, mouse, network card, digital camera, etc. Collectively, these are called INPUT.

* Computers can also express themselves in many ways -- text, graphics, sound, network, printers, etc. Collectively, these are called OUTPUT.

* Input and Output together are called I/O.

# Terminal I/O

* In Ruby, 
    * `puts` means "print a line to the terminal"
    * `gets` means "read a line from the terminal"

* `gets` reads all the characters from the keyboard and puts them into a new string, until you press RETURN

# LAB: Hello, friend!

1. Open `hello.rb` in your text editor
2. Change it to contain the following code:

        puts "What is your name?"
        name = gets
        puts "Hello, " + name + "!"

3. Save the file and switch back to the terminal
4. Run the program using `ruby hello.rb`
5. Type in your name and press the RETURN (or ENTER) key

What happens? Is this what you expected?

# Yikes!

* Uh-oh! We've got trouble... what is that exclamation point doing way down there?

* The first thing to do is DON'T PANIC!
* You are *totally* going to figure this out.
* And even if you don't, you haven't actually broken anything.
* In fact, it's really hard to hurt anything inside a computer, so just stay calm.

# Breathe

* In through the nose...
* Out through the mouth...
* In through the nose...
* Ahhhhhhhh.

# Let's fix this

* Have you figured out what the problem is?
* If not, I'll tell you on the next slide.
* Take a second and try to figure it out first. I'll wait.

# The newline character

* Here's a fun fact:
* In addition to letters, numbers, and punctuation, computers also store other keys inside strings
* Among these CONTROL CHARACTERS is the one that represents the RETURN KEY
* This character's name is NEWLINE
* Every time you use `gets`, Ruby reads *all* the characters, *including the newline*!

# Strip it

* Fortunately, there's an easy fix
* If you send the message `strip` to a string, it will remove all SPACES and NEWLINES from both ends

# LAB: fixing Hello, Friend

* Change the program to look like this:

        puts "What is your name?"
        name = gets.strip
        puts "Hello, " + name + "!"

* Run it and make sure it works OK

# LAB: capitalization

* What happens if you type your name in all lowercase?
* Make the program capitalize your name for you even if you forget.

* Now go crazy and make it do all sorts of silly things to your name

---

# Loops

Computers, like robots, are good at doing things over and over and over again.

A LOOP is when we ask a program to do something many times.

# times

The simplest loop in Ruby is called `times`, and it's a message you can send to a number.

Try this in IRB:

    3.times do
      puts "Hip! Hip! Hooray!"
    end

Let's unpack this:

* `3.times do` means what it sounds like: "do this three times"
* `end` means this is the end of what I want you to do
* and of course, `puts` means "show this on the terminal"

**Note well!** The lines between `do` and `end` are INDENTED. Indentation is very important to you and other humans. It lets our eyes follow the patterns and helps us quickly see what parts of the program go with each other.

# while true

If you want something to keep going forever, use a special loop called `while true`. 

    while true
      puts "Hello"
    end

To stop it, hold down the CONTROL key and press the C key.

---

# Arrays

* todo

---

# Iterators

An iterator is a special kind of loop that acts on the items in a collection.

* todo

---

# Conditions

- if
- while
- or
- and

---

# Functions

* todo

---

# Sinatra

Sinatra is a Web Application Framework. It includes a Web Server and lets you write code to show when people request web pages.

# Hi, Sinatra

1. install Sinatra by running `gem install sinatra` on the command line

2. create a file called `hi.rb` containing this:

        require 'sinatra'

        get '/hi' do
          "Hi!"
        end

3. run `ruby hi.rb`

Now open a Web Browser (like Firefox or Chrome or Safari or Internet Explorer) and enter the following URL into the address bar:

    http://localhost:4567/hi

# Hello, Whoever

Change `hi.rb` to look like this:

    require 'sinatra'

    get '/hi/:who' do
      "Hi " + params[:who] + "!"
    end

Now visit the following URL:

    http://localhost:4567/hi/alice

# LAB: Yeller

Make a route in your Sinatra application so that when someone requests this:

    /yell/ahoy

they see this:

    AHOY!!!

and when someone requests this:

    /yell/dinnertime

they see this:

    DINNERTIME!!!

# Detour: Deploying to Heroku

* todo - link to Railsbridge pages describing account setup & deploy steps


