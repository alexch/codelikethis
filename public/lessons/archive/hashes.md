    topic name: "hashes"
    topic name: "objects"
    topic name: "key-value-pairs"
    topic name: "setting-getting"
    topic name: "data-structures"
    link from: "EloquentJavaScript",
         href: "http://eloquentjavascript.net/04_data.html",
         name: "Eloquent JavaScript Chapter 4: Data Structures: Objects and Arrays"
    project name: "zorkington"

# Hash

![corned beef hash](/images/cornedbeefhash.jpeg)

* during breakfast, *hash* is a *delicious processed meat product*
* during coding, a *hash* is an *abstract data type*

<small>(image credit: [Jeffrey W](https://www.flickr.com/photos/jeffreyww/26139552220), [CC-BY](https://creativecommons.org/licenses/by/2.0/) )</small>

# What makes a hash a hash?

a hash is an

* unordered
* indexed (by strings, not numbers)
* collection
* of key/value pairs

In other words, a hash defines a *mapping* from one group of things to another, like a phone book or a dictionary.

## a hash is also known as a...

  * map or mapping
  * dictionary
  * associative array
  * lookup table
  * key/value store

# hash or object?

In JavaScript, a **hash** is officially called an **object**.

> This is confusing since in every other computer language, "hash" and "object" are quite different things.

## Object != Object-Oriented

* Just using an object as a key-value store does not make your code *object-oriented*.
    * For OOP you need a few extra features, especially the keywords `new` and `this` and `class`
    * We discuss OOP in a separate [OO_JS](../oo) track
* In the rest of this lesson we use "object", but elsewhere, you may see "hash" and "object" used interchangeably

# Sidebar: Why is it called a hash?

The most common and useful implementation of this data structure uses something called a *hashing function* to make the lookup efficient. A hashing function allows you to have **huge** amounts of data and still access a single item very quickly.

Think of the Dewey Decimal System: when you look up a book in the card index, it tells you what aisle and shelf to visit to find that book. You don't need to search through the entire library; you just need to search a single shelf.

Because programmers are humans, and humans can be very literal-minded, people named it based on *how* it works, rather than *what* it does or *why* it does it.

*Map* and *Dictionary* are much better metaphors (and in fact there is a recently-introduced JavaScript type called [Map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map) which behaves better than the built-in "object" hash; for instance, its keys are not limited to being strings).

Also, *hash* is a funny word, and programmers love jokes.

