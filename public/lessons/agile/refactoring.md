# The Zen of Refactoring

![buddha](./zen/buddha-statue.jpg)

Refactoring is the process of restructuring existing computer code -- changing its *factoring* -- without changing its behavior. You probably knew that. But did you know it’s also a meditation technique? Come improve your practice of mindful coding.

After these slides, we’ll start with some actual production code, make sure its unit tests work ok, then collaboratively, consciously contemplate the many forking paths that twine and wind through the Garden of Abstract Delights.


# What is refactoring?

* refactoring is a process

> refactoring (verb): to restructure software by applying a series of refactorings without changing its observable behavior

* *a* refactoring is a technique

> refactoring (noun): a change made to the internal structure of software to make it easier to understand and cheaper to modify without changing its observable behavior

(definitions by [Martin Fowler](http://martinfowler.com/))

# What is Zen?

> mostly an excuse for pretty pictures and hippie jokes

![zen](./zen/don-zen.gif)

> disclaimer: I apologize for
> appropriating and trivializing
> anyone's cultural heritage

# What is Refactoring?

Refactoring is changing code without changing its behavior.

# What is Refactoring?

Refactoring is changing code without changing its behavior.

Refactoring is change without change.

# What is Refactoring?

Refactoring is changing code without changing its behavior.

Refactoring is change without change.

Refactoring is Zen.

# refactoring is NOT

rewriting

rebuilding

porting

upgradging

# Why refactor?

![yoda](zen/yoda-clear-your-mind.gif)

(Yoda ~= Buddha)

# Refactor to understand

clarity calm insight knowledge understanding

![pool](zen/hand-pool.gif)

See the code for what it is, not what you think it is, or what you want it to be

# Refactor to remove duplication

DRY

![sand](zen/stone-sand.png)

# Refactor to increase code clarity

sometimes clarity requires *more* duplication

# What is code clarity?

Clear code is:

* readable
* modular
* maintainable
* ready for teamwork
* ready for change

# rereading

> “Curiously enough, one cannot read a book; one can only reread it. A good reader, a major reader, an active and creative reader is a rereader.” - Nabokov

— applies to refactoring too, not just rereading

https://www.goodreads.com/quotes/34497-curiously-enough-one-cannot-read-a-book-one-can-only


# "Zen Refactoring"

Let your eyes blur and scroll through the code

See what pops out

  * duplication?
  * repetition?
  * long lines? long methods?
  * strange gaps?
  * comments?

# How?

1. Write some tests
2. Change the code
3. Run the tests
4. Move ahead, or move back (revert)

# Tests Are Essential

run them before

change them during

tests are an extension of code

# What are the qualities of a refactoring?

# Reversible

![reversible](./zen/spinning-yin-yang.gif)

# Mechanical

![grievous.gif](./zen/grievous.gif)

# Brief

or at least made of many short, reversible steps

# Automated

I choose my text editor based on how well it refactors

![real programmers use](./real_programmers.png)
<https://xkcd.com/378/>

# Refactoring: Rename

The simplest and most powerful

# Refactoring: Extract

Extract variable, extract method, extract class

# Refactoring: Inline

Introduce duplication, increase clarity

# Refactoring: Replace Comment With Name

# Refactoring: Introduce Parameter

# Code Smells

* [Code Smells](https://sourcemaking.com/refactoring/smells)
* *[Feature Envy](https://sourcemaking.com/refactoring/smells/feature-envy)*
  * when a method accesses the data of another object more than its own
  * can be cured by **Refactoring: Move Method**

# Some Guidelines

* Short Lines
* Short Methods
* Fewer Dots
* Meaningful Names

# The Book

![refactoring-fowler](./zen/refactoring-book.jpg)

# References

* http://refactoring.com/
* http://refactoring.com/catalog/
* http://martinfowler.com/books/refactoringRubyEd.html
* https://sourcemaking.com/refactoring
