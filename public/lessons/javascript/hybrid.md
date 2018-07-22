# What is JavaScript?

JavaScript is a *hybrid* language. It has some features from each of these three programming styles:

* *procedural*
  - *functions* which may call each other
  - *parameters* and *return values* as the interface to functions
  - *local variables* for mutable state *inside a single function*
  - *global variables* for shared state between *all* functions
 
* *functional*
  - *first-class* functions which may be used *as parameters and values* by other functions
  - *closures* to let functions share state between *certain* functions
    - with strict *[lexical scoping](https://whatis.techtarget.com/definition/lexical-scoping-static-scoping)* rules (to avoid combinatorial complexity of globals)
 
* *object-oriented*
  - *instance variables* (aka *properties*) as mutable state that survives a single function call
  - *methods* to attach functions to an instance
  - *privacy* (aka *encapsulation*) so the instance variables are shared only among the instance methods)

The overlap between these three can be messy :-(

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

# The CPU Don't Care

All of these styles exist to make code more readable / maintainable / debuggable *for humans*...

<!VIDEO FZkjE1_0XtI>

<https://www.youtube.com/watch?v=FZkjE1_0XtI>

...to the CPU, it's all just ones and zeros.
 
