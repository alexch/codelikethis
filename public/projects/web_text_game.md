# Web Text Game

In a previous project, you created a game with a textual user interface.

* [Tic Tac Toe](tic_tac_toe)
* [Zorkington](zorkington)

In this project, you will make a version of that program that runs *inside a web page*... but it still has a text UI.

## Wireframes

```
Zorkington
 __________________________________________________________
/ 182 Main St.                                             \
| You are standing on Main Street between Church and South |
| Winooski.                                                |
| There is a door here. A keypad sits on the handle.       |
| On the door is a handwritten sign.                       |
|                                                          |
|                                                          |
\__________________________________________________________/

What would you like to do?
 ________________________________________________   _______
| open door                                      | / Do it \
\________________________________________________/ \_______/

```

# Hints

* Make a git branch for your new program (`git checkout -b web-ui`)
* Feel free to "revert" (`git checkout .`) if you get lost halfway through a feature
* You will want to *refactor* your program to separate the *input and output* from the *validation* and *logic*. See below for example.


# Refactoring I/O Example

For example, if your code looks like this:

```
@@@ js
process.stdin.on('data', (chunk) => {
    let input = chunk.toString();
    if (input === 'open door') {
        console.log('The door is locked.');
    }
});
```

Then first change it to this:

```
@@@ js

listenForCommand();

function listenForCommand() {
    process.stdin.on('data', (chunk) => {
        let input = chunk.toString();
        processCommand(input);
    });
}

function processCommand(input) {
    input = input.trim();
    if (input === 'open door') {
        outputMessage('The door is locked.');
    }
}

function outputMessage(message) {
    console.log(message);
}
```

Then run it *from the command line* to make sure you didn't break anything during this step. Do a `git commit` after this, as a checkpoint.

This will make it easier to rewrite `outputMessage` and `listenForCommand` to work with your Web UI instead of the command line.

[TODO: make a clearer path from console to web... e.g. feature flag or environment inspection to use same program from either command-line or web, or a two-file solution (one entry point for node, another for web, and the same backend file for logic)]

