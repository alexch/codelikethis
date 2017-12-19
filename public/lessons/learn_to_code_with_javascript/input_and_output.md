# Input and Output

* Computers have many senses -- keyboard, mouse, network card, camera, joystick, etc. Collectively, these are called INPUT.

* Computers can also express themselves in many ways -- text, graphics, sound, networking, printing, etc. Collectively, these are called OUTPUT.

* Input and Output together are called **I/O**.

# Terminal I/O

* In JavaScript, 
    * `console.log` means "print a line to the terminal"
    
* In NodeJS,
    * `process.stdin` means "input coming from the terminal"
    
    * Reading a line in NodeJS is weird; here's one way to do it
    
```
@@@ js
process.stdin.on('data', (chunk) => { console.log(chunk); })
```

# LAB: Hello, friend!

1. Open `hello.js` in your text editor
2. Change it to contain the following code:

        @@@ js
        console.log("What is your name?");
        process.stdin.on('data', (chunk) => {
            let name = chunk.toString(); 
            console.log("Hello, " + name + "!"); 
        });

3. Save the file and switch back to the terminal
4. Run the program using `node hello.js`
5. Type in your name and press the RETURN (or ENTER) key

What happens? Is this what you expected?

# Yikes!

* Uh-oh! We've got trouble... what is that exclamation point doing way down there?

* The first thing to do is DON'T PANIC!
* You are *totally* going to figure this out.
* And even if you don't, you haven't actually broken anything.
* In fact, it's really hard to break a computer, so just stay calm.

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
* Every time you read a line, the computer reads *all* the characters, *including the newline*!

# Trim it

* Fortunately, there's an easy fix
* If you send the message `trim` to a string, it will remove all SPACES and NEWLINES from both ends

# LAB: fixing Hello, Friend

* Change the program to look like this:

        @@@ js
        console.log("What is your name?");
        process.stdin.on('data', (chunk) => {
            let name = chunk.toString().trim();
            console.log("Hello, " + name + "!");
        });

* Run it and make sure it works OK

# LAB: Capitalization

* What happens if you type your name in all lowercase?
* Make the program capitalize your name for you even if you forget.

**Hint**: remember `slice` ?

# LAB: Crazy Name

* Now go crazy and make it do all sorts of silly things to your name!

# Evented I/O: A Gentle Introduction

This is a very big topic, but briefly...

# Sequences 

Traditional programs are written using *sequences*, which are performed in order like a traditional recipe, performed by a single chef:

0. preheat oven to 350&deg;
1. roll out batter on baking sheet
2. cut out cookies and remove excess batter
3. put baking sheet in the oven
4. wait 20 minutes and remove baking sheet from oven
5. place cookies on a tray and wait 10 more minutes for cookies to cool
6. decorate the cookies with icing and sprinkles

# Sequences in Parallel

Even though the recipe is written in a strict order, many of these steps can happen simultaneously or in parallel. 

For instance, you don't have to wait for the oven to be preheated before rolling out the dough.

Or, you could have one cook rolling, cutting, and baking, and another cook removing and decorating. 

# Events

NodeJS programs are written using *events*, which is like a bunch of cooks, each performing one part of the recipe.

* when starting, preheat oven to 350&deg;
* when dough is mixed, roll it out onto the baking sheet
* when the dough is on the baking sheet, start cutting out cookies
* when all cookies are cut out, remove excess dough
* when excess dough is removed, put the baking sheet in the oven
* when 20 minutes have elapsed, remove baking sheet from oven
* when cookies are cool, decorate each cookie

Evented programs are often a more flexible and high-performance than traditional sequenced programs, but they can be more confusing for humans to write and to read (and to debug!).

Also, sequences naturally *end* when they are finished, but evented programs will just keep doing the same things over and over again, as long as the triggers keep happening. 

# On vs Once

If you have a simple sequence in mind, and want to emulate it using an evented system, you could use the following technique:

Set up your event responders to happen only once.

In NodeJS, this is accomplished by sending the `once` method in place of the `on` method.

    @@@ js
    console.log("What is your name?");
    process.stdin.once('data', (chunk) => {
        let name = chunk.toString().trim();
        console.log("Hello, " + name + "!");
        process.exit();  // don't forget to stop!
    });

# LAB: Full Name

* Write a program named `name.js` that asks two things:
  1. Your first name
  2. Your last name
* Then it says hello to the user by her *full name*.
* Run the program by typing `node name.js` on the command line.

# CONGRATULATIONS!

> You just wrote a program!

You are now officially a coder. HIGH FIVE!

# Lab: Name Length

* Change `name.js` so it also prints the number of characters in the user's name.
* For instance:

        What is your first name?
        Grace
        What is your last name?
        Hopper
        Hello, Grace Hopper! 
        Your name is 11 characters long.

# Lab: Infinite Names

* Change `name.js` so it keeps asking for names forever...
  * ...unless and until someone says their name is "bye!"
  * then it stops and exits back to the terminal

