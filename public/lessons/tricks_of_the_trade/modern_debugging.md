# Modern Debugging

Traditional debugging:

  * print statements
  * interactive debuggers
  * stack traces
  * [rubber ducks](https://en.wikipedia.org/wiki/Rubber_duck_debugging)

Modern debugging:

  * Google.com
  * StackOverflow.com

# True Names

> "For magic consists in this, the true naming of a thing." 
> &nbsp; - Ursula LeGuin, _A Wizard of Earthsea_

to know the true name of an object... or a concept... is to have power over it

# Naming Is Hard

> "There are only two hard problems in Computer Science: cache invalidation and naming things." 
> &nbsp; - [Phil Karlton](https://skeptics.stackexchange.com/questions/19836/has-phil-karlton-ever-said-there-are-only-two-hard-things-in-computer-science)

# Google to Learn

Often, bugs and errors come from programmers not *quite* understanding the library or language feature they are using. 

While reading docs can be tedious, it can only help you to understand what problem you're trying to solve... even if to be able to ask for help elsewhere and start by saying, "I've read the docs and I still don't get it."

First, think of the base name of the concept/library/feature/language/tool. Google it and half the time you'll find what you're looking for on the first page of results.

If the first page is filled with clutter, add a term that distinguishes what you're looking for from all those other results, and search again.

Example: `god` vs `god of war` vs `god of war greece` vs `god of war game`

Then once you find the docs, [RTFM]().

# Google to Debug

If you get an error that you don't understand...

...the first thing to do is **not** to Google it.

# Modern Debugging: Step 1

> Step 1: read it *carefully*. 

Mentally dissect the error report. Try to separate the *signal* from the *noise*.

Answer the following questions:

  * **Where** in your code is the error occurring?
  * **What** is the *name* of the error message?
  * **Why** is this error happening now? 
    * What is the **context** of the error? 
    * What is the code **expecting**, and what did it find instead?
  * If there are several error messages in a row, **which** is the root error?

(More detail on these questions in the following slides.)

After answering these questions, look at your code. Open up the file, scroll to the line and read the code to yourself, or read it aloud to your pair partner or your [rubber duck](https://en.wikipedia.org/wiki/Rubber_duck_debugging). Many times the cause will be obvious.

# Where?

**Where** in your code is the error occurring?

  * there will often (though not always!) be a *stack trace* including paths, file names, line numbers
  * [todo: link to another per-language lesson with a lot more detail on stack traces]
  * Once you mentally remove the stack trace, it becomes easier to understand the rest of the error.

# What?

**What** is the *name* of the error message?

  * this will usually be in English, though possibly fragmented and jargony, e.g. "file not found" or "undefined is not a function".
  * This is not gibberish. It is meaningful. **Names have power.**

# Why?

What is the **context** of the error? What is the code **expecting**, and what did it find instead?

  * e.g. if it says "file not found", what is the file it is looking for? Is it looking in the right place and the file isn't there? Or is it looking in the wrong place?
  * e.g. if it says "undefined is not a function", *undefined* is the value of a variable that it expects to be a function. What is the name of the variable? Why doesn't it point to a function?

# Root cause?

If there are several error messages in a row, **which** is the root error?

  * errors often *cascade*, with one causing another causing another
  * remember to **scroll up** in your terminal to see the earlier error messages. Don't allow later errors to hide earlier ones.

# Modern Debugging: Step 2

> Step 2: google the *name* of the error

[todo: example]

# Modern Debugging: Step 3

> Step 3: google the *name and context* of the error

[todo: example]

  * be aware that some parts of the context will be specific to your personal setup
  * e.g. the first part of full file paths
  * you may need to delete these parts and search again

# Modern Debugging: Step 4

> Step 4: Stack Overflow

After googling, you will probably find your question answered on Stack Overflow.

Remember, though: *not all answers are correct*. You shouldn't just copy and paste code from the first result.

# SOOP: Stack Overflow Oriented Programming

Copy / paste / tweak is not ideal, but it is acceptable...

...**with these caveats:**

  * you must have unit tests, to prove that the code 
    * (a) does what you want
    * (b) doesn't do anything you *don't* want
  * you should refactor the code after you get it to work
  * you must at least try to understand it, or mark (with a code comment or commit message) what parts of the code you don't understand
  * you should put a code comment with a link to the Stack Overflow answer, so future coders (including you!) can learn more about how it works and why it was needed

