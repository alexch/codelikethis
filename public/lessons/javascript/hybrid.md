# What is JavaScript?

JavaScript is a *hybrid* language. It has some features from each of these three programming styles:

* *procedural*

* *functional*

* *object-oriented*

The overlap between these three can be messy :-(

# procedural style

  - *functions* which may call each other
  - *parameters* and *return values* as the interface to functions
  - *local variables* for mutable state *inside a single function*
  - *global variables* for shared state between *all* functions

# functional style

  - *first-class* functions which may be used *as parameters and values* by other functions
  - *closures* to share state between *certain* functions
    - with strict *[lexical scoping](https://whatis.techtarget.com/definition/lexical-scoping-static-scoping)* rules (to avoid combinatorial complexity of globals)
  - *immutable* data structures, to minimize side effects and maximize concurrency
  - *chaining* and *iterators* and *[collection pipelines](https://martinfowler.com/articles/collection-pipeline/)*

# object-oriented style

  - *instance variables* (aka *properties*) as mutable state that survives a single function call
  - *methods* to attach functions to an instance
  - a *constructor* to initialize your instance with valid values
  - *privacy* (aka *encapsulation* or *data hiding*) so the instance variables are shared only among the instance methods

# Three Styles, Summarized

| Style | Behavior | Local State | Shared State |
|-------|-----------|--------------|--------------|
|procedural | functions  | variables    | globals     |
|functional | functions  | variables | nested scope      |
|object-oriented | methods, <br> classes | variables         | properties, <br> static methods, <br> class definitions  |

Note that:

* Local state is the same for all styles! Parameters and local variables work the same no matter what.
* Methods and closures are each "function plus state"; they differ in where that extra state is stored:
  * methods use state *inside an object* as properties
  * closures use state in *nested scopes* of enclosing functions

# The Honey Badger Don't Care

All of these styles exist to make code more readable / maintainable / debuggable *for humans*...

<!VIDEO FZkjE1_0XtI>

<https://www.youtube.com/watch?v=FZkjE1_0XtI>

...to the CPU, it's all just ones and zeros.
 
