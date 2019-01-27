    project name: "today_i_learned_cli"
    topic name: "command-line"
    topic name: "arguments"
    topic name: "node"
    topic name: "strings"
    topic name: "numbers"
    topic name: "functions"
    topic name: "arrays"
    topic name: "loops"

# ARGV

In every NodeJS program, there is a magic array named `argv`. 

It contains the *command line arguments* to the program.

If the user types:

    node hello.js Alice Bob

then `process.argv` contains:

```js
[ 
    '/usr/local/bin/node',
    '/Users/alex/code/hello.js',
    'Alice',
    'Bob'
]
```

# Why ARGV?

ARGV is a historical name. It means "Argument Vector" and has been around since the early 1970s.

# LAB: Command-Line Hello

Write a new program called `hi.js` that contains:

```js
console.log("Hi, " + process.argv[2])
```

and run it a few times, e.g.

    node hi.js Alice
    node hi.js Bob

# LAB: Hello, Everyone!

Change `hi.js` to say hi to *every one* of its command line arguments.

For instance:

    node hi.js Alice Bob Charlie
    Hi, Alice!
    Hi, Bob!
    Hi, Charlie!

# LAB: Add

Write a program named `add.js` that adds all of its command line arguments together.

e.g.

    node add.js 1 2 3 4
    10

> Hint: Do you remember how to cleanly convert a string to a number?

# Links

* <https://code-maven.com/argv-raw-command-line-arguments-in-nodejs>
