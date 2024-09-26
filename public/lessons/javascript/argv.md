    project name: "today-i_learned-cli"
    topic name: "command-line"
    topic name: "arguments"
    topic name: "node"
    topic name: "strings"
    topic name: "numbers"
    topic name: "functions"
    topic name: "arrays"
    topic name: "loops"
    link href: "https://code-maven.com/argv-raw-command-line-arguments-in-nodejs"

# ARGV

In every NodeJS program, there is a magic array named `argv`. 

It contains the *command line arguments* to the program.

If the user types this in the Terminal:

    node hello.js Alice Bob

then `process.argv` contains:

```javascript
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
console.log("Hi, " + process.argv[2] + "!")
```

and run it a few times from the Terminal, e.g.

    node hi Alice
    node hi Bob
    node hi "good buddy"

# LAB: Hi, Everybody!

Change `hi.js` to say hi to *every one* of its command line arguments.

For instance:

    node hi Alice Bob Charlie
    Hi, Alice!
    Hi, Bob!
    Hi, Charlie!

# LAB: Add

Write a program named `add.js` that adds all of its command line arguments together.

e.g.

    node add 1 2 3 4
    10

> Hint: Command line arguments come in as strings so you will need to convert them to numbers.

# Add solution

<details>
<summary>Hint 1</summary>
<div>

```js
let numberArray = process.argv.slice(2).map(number => parseInt(number))
```

</div>
</details>

<details>
<summary>Hint 2</summary>
<div>

```js
let sum = 0
```

</div>
</details>

<details>
<summary>Solution</summary>
<div>

```js
let numbers = process.argv.slice(2);

function add(array){
    let sum = 0
    let intArray = numbers.map(number => parseInt(number))

    intArray.forEach(int => sum += int)

    return sum
}

console.log(add(numbers))
```

</div>
</details>
