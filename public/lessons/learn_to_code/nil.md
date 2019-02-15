# Nil

*nil* is a magic object

# There Is No Spoon

*nil* is the object that means "there is no object"

> Q: What is the sound of one hand clapping?

> A: `nil` 

# Experiment

    fruit = "apple"
    fruit = nil
    fruit.reverse

*Read the error!*

# Errors are good

They tell you

* you made a mistake
* what that mistake was
* (sometimes) how to fix it

Interpret this error:

    fruit.reverse
    NoMethodError: undefined method `reverse' for nil:NilClass

# null pointer errors

* null pointer errors are very common
* the trick is reading the error and figuring out
    1. *where* it happened (*which line*)
    2. *which variable* was null
* often once you know *which*, knowing *why* is obvious
* or at least tracing back the logic is possible

# If You're Going To Fail...

Two philosophies:

* fail hard, fail fast
* keep calm and carry on

Which idea is better?

Why or why not?

# Fail Fast, Fail Often

* Ruby has a "fail fast" philosophy
* Is this a good idea?
* Why or why not?

