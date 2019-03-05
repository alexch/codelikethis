# Evented I/O: A Gentle Introduction

(Prerequisite: [I/O lesson](/lessons/javascript/input_and_output))

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

    console.log("what is your name?");
    function sayHi(name) {
        console.log('Hi, ' + name + '!');
    }
    process.stdin.once('data', sayHi);
    
This means 

1. ask the user their name
2. define a function named `sayHi` that accepts a parameter named `name` 
3. "hey standard input, once you receive a `data` chunk, pass it in to the `sayHi` function".

# Anonymous Callbacks

An anonymous callback is also a function, but this time it's defined *inline*.

Example:

    console.log("what is your name?");
    process.stdin.once('data', function (name) {
        console.log('Hi, ' + name + '!');
    });
    
Note that the *second argument* to the `once` method is the same as the *entire sayHi function* from the previous slide...
 
* up to and including the close brace `}`... 
* but not including the close paren and semicolon `);`
* and (naturally) not including a function name

# Anonymous Fat-Arrow Callbacks

You will often see the *fat arrow* variant syntax in anonymous callbacks.

Example:

    console.log("what is your name?")
    process.stdin.on('data', (name) => {
        console.log('Hi, ' + name + '!');
    });
    
Note that the second argument to the `once` method is the same as the the previous slide, but with `=>` *after* the parameter list, instead of the word `function` *before* the parameter list.

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

Yes, nested callbacks are confusing. This is an example of *callback hell*.

# Callback Hell

![yo dawg callbacks](/images/yo-dawg-callbacks.png)

# Async-Await and Promises

Nested callbacks are horrible. There is a different way to do it that leads to cleaner code, but requires you to use (and understand!) Promises and Async/Await.

We will cover those topics in depth later, but for now, look at this example:

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

Note that instead of passing the result in to a callback function, `await` returns the result *just like a normal function call* so you can assign it to a variable. 

# Events: pros and cons

Evented programs are often more flexible and high-performance than traditional sequenced programs, but they can be more confusing for humans to write and to read (and to debug!).

Also, sequences naturally *end* when they are finished, but evented programs will just keep doing the same things over and over again, as long as the triggers keep happening.

This means that you need to explicitly call `process.exit()` in NodeJS programs.

# On vs Once

`once` is a special case of a more common method named `on`. The difference is that 

* `on` sets up an event handler that is called back *any time* the event occurs
* `once` sets up the same thing, but then *removes* it after the first call

The following code will *keep saying hello* every time the user enters another line of text.

```js
console.log("What is your name?");
process.stdin.on('data', (chunk) => {
    let name = chunk.toString().trim();
    console.log("Hello, " + name + "!");
});
```