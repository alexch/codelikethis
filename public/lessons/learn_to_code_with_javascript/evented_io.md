# Evented I/O: A Gentle Introduction

(Prerequisite: [I/O lesson](/lessons/learn_to_code_with_javascript/input_and_output.md))

This is a **very** big topic, but briefly...

# Sequences 

Traditional programs are written using *sequences*, which are performed in order like a traditional recipe, performed by a single chef:

0. preheat oven to 350&deg;
1. roll out dough on baking sheet
2. cut out cookies and remove excess dough
3. put baking sheet in the oven
4. wait 12 minutes and remove baking sheet from oven
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
* when 12 minutes have elapsed, remove baking sheet from oven
* when cookies are cool, decorate each cookie

# Events are not necessarily in order!

The source code of the evented cookie baking program in the previous slide could *just as well* be written like this:

* when cookies are cool, decorate each cookie
* when the dough is on the baking sheet, start cutting out cookies
* when all cookies are cut out, remove excess dough
* when starting, preheat oven to 350&deg;
* when dough is mixed, roll it out onto the baking sheet
* when 12 minutes have elapsed, remove baking sheet from oven
* when excess dough is removed, put the baking sheet in the oven
* Start!

# Named Callbacks

A named callback is simply a function.

Example:

    console.log("what is your name?")
    function sayHi(name) {
        console.log('Hi, ' + name + '!');
    }
    process.stdin.once('data', sayHi);

# Anonymous Callbacks

An anonymous callback is defined *inline*.

Example:

    console.log("what is your name?")
    process.stdin.once('data', function (name) {
        console.log('Hi, ' + name + '!');
    });
    
Note that the *second parameter* to the `once` method is the same as the *entire sayHi function* from the previous slide...
 
* up to and including the close brace `}`... 
* but not including the close paren and semicolon `);`

# Anonymous Fat-Arrow Callbacks

You will often see the *fat arrow* variant syntax in anonymous callbacks.

Example:

    console.log("what is your name?")
    process.stdin.once('data', (name) => {
        console.log('Hi, ' + name + '!');
    });
    
Note that the second parameter to the `once` method is the same as the the previous slide, but with `=>` *after* the parameter list, instead of the word `function` *before* the parameter list.

# Nesting

To *force* events to happen *in order* you may need to *nest* your callbacks.

    console.log('what is your name?')
    process.stdin.once('data', (name) => {
        console.log('what is your quest?')
        process.stdin.once('data', (quest) => {
        console.log('what is your favorite color?')
            process.stdin.once('data', (color) => {
                console.log('Hello ' + name + '! ' +
                'Good luck with ' + quest + ', ' +
                'and here is a ' + color + ' flower for you.');
                process.exit();
            });
        });
    });

# Callback Hell

![yo dawg callbacks](/images/yo-dawg-callbacks.png)

# Async-Await and Promises

Nested callbacks are horrible. There is a different way to do it that leads to cleaner code, but requires you to use (and understand!) Promises and Async/Await.

Example:

```ecmascript 6
async function start() {
  let name = await ask('What is your name? ');
  let quest = await ask('What is your quest? ');
  let color = await ask('What is your favorite color? ');
  console.log('Hello ' + name + '! ' +
    'Good luck with ' + quest + ', ' +
    'and here is a ' + color + ' flower for you.');
}
```

> note: for this to work, the `ask` function must return a Promise

# Events: pros and cons

Evented programs are often more flexible and high-performance than traditional sequenced programs, but they can be more confusing for humans to write and to read (and to debug!).

Also, sequences naturally *end* when they are finished, but evented programs will just keep doing the same things over and over again, as long as the triggers keep happening. 

This means that you may need to explicitly call `process.exit()` in NodeJS programs.

# On vs Once

If you have a simple sequence in mind, and want to emulate it using an evented system, you could use the following technique:

Set up your event responders to happen only once.

In NodeJS, this is accomplished by sending the `once` message in place of the `on` message.

    @@@ js
    console.log("What is your name?");
    process.stdin.once('data', (chunk) => {
        let name = chunk.toString().trim();
        console.log("Hello, " + name + "!");
        process.exit();  // don't forget to stop!
    });

