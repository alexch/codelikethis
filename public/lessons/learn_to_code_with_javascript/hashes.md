# Hash

a *hash* is an *abstract data type*

![corned beef hash](../images/cornedbeefhash.jpeg)

# What makes a hash a hash?

a hash is an

* unordered 
* indexed
* collection
* of key/value pairs

In other words, a hash defines a *mapping* from one group of things to another, like a phone book or a dictionary.

# a hash is also known as a...

  * map or mapping
  * dictionary
  * associative array
  * lookup table
  * key/value store

# hash or object?
  
and in JavaScript, a hash is officially called an

  * object

> This is confusing since in every other computer language, "hash" and "object" are quite different things.

# Setting and Getting Hash Values with square brackets

    @@@ js
    let states = {}

    states["CA"] = "California"
    states["MA"] = "Massachusetts"
    states["NY"] = "New York"

    states["MA"]                // "Massachusetts"
    states["MA"].toUpperCase()  // "MASSACHUSETTS"

# Setting and Getting Hash Values with dots

    @@@ js
    let states = {}

    states.CA = "California"
    states.MA = "Massachusetts"
    states.NY = "New York"

    states.MA                // "Massachusetts"
    states.MA.toUpperCase()  // "MASSACHUSETTS"

# Dots vs. Brackets

Dots are a bit prettier than square brackets, but less versatile:

    @@@ js
    > capitals = {}
    {}
    
    > capitals.New York = "Albany"
    capitals.New York = "Albany"
                 ^^^^
    SyntaxError: Unexpected identifier
    
    > capitals."New York" = "Albany"
    capitals."New York" = "Albany"
             ^^^^^^^^^^
    SyntaxError: Unexpected string
    
    > capitals["New York"] = "Albany"
    'Albany'
    > capitals
    { 'New York': 'Albany' }

# Hash literals

a Hash can be defined *literally* (inline) with curly braces, like this:

    @@@ js
    states = {
               CA: "California",
               MA: "Massachusetts",
               NY: "New York"
             }

    states["MA"]  // "Massachusetts"

# Why is it called a hash?

The most common and useful implementation of this data structure uses something called a *hashing function* to make the lookup efficient. (A hashing function allows you to have **huge** amounts of data and still access a single item very quickly.)

Because programmers are humans, and humans can be very literal-minded, people named it based on *how* it works, rather than *what* it does or *why* it does it.

*Map* and *dictionary* are much better names (and in fact there is a recently-introduced JavaScript type called [Map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) which behaves better than the built-in "object" hash; for instance, its keys are not limited to being strings).

Also, *hash* is a funny word, and programmers love jokes.

# JS Object Hash Rules

* All keys are strings

* **Beware** of using these as keys, since they get converted to strings in unexpected ways:

    * `null`
    * `undefined`
    * `""` 
    * `false` or `true`
    * `0` (or any number)

# `delete`

To remove a key-value pair from a hash, use the keyword `delete`.

    @@@js
    states = {
                CA: "California",
                MA: "Massachusetts",
                NY: "New York"
             }
    { CA: 'California', MA: 'Massachusetts', NY: 'New York' }
    > delete states.MA
    true
    > states
    { CA: 'California', NY: 'New York' }

# fake delete

You can get a similar effect by setting the value to `null` or `undefined`, but beware: the key remains!

    @@@js
    > states.CA = null
    null
    > states.NY = undefined
    undefined
    > states
    { CA: null, NY: undefined }

> You probably shouldn't do this.

# Hash methods

todo

