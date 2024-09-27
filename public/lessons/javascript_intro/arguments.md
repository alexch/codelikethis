# ARGV

In every NodeJS program there is an array named `argv`. 

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

# What is an argument?

An argument is a variable that gets passed into a function to have some operation performed on it.

```javascript
function sayHello(name) {
  console.log('Hello, ' + name)
}

sayHello('Bill')
```
In the preceding code block `name` is a variable which stands in for the argument, while `'Bill'` is an argument to the `sayHello` function

# LAB: Command-Line Hello

Open up your `hello.js` file and extend it to accept names from the argument vector

```js
let name = process.argv[2]
```

and run it a few times from the Terminal, e.g.

    node hello Alice
    node hello Bob
    node hello "good buddy"

# LAB: Hi, Everybody!

Change `hello.js` to respond to *every one* of its command line arguments.

For instance:

    node hi Alice Bob
    Hello, Alice!
    Hello, Bob!

# Hi, Everybody! solution

<details>
<summary>Hint</summary>
<div>

```js
let namesArray = process.argv.slice(2)
```

</div>
</details>

<details>
<summary>Solution</summary>
<div>

```js
let namesArray = process.argv.slice(2);

function hello(array) {
    array.forEach(function(name){
        console.log("Hello, " + name + "!")
    })
}

hello(namesArray)
```

</div>
</details>

# LAB: Add

Write a program named `add.js` that adds all of its command line arguments together.

e.g.

    node add 1 2 3 4
    10

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

funtion add(array){
    let sum = 0
    let intArray = numbers.map(number => parseInt(number))

    intArray.forEach(int => sum += int)

    return sum
}

console.log(add(numbers))
```

</div>
</details>
