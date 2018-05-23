# Modern Debugging

Traditional debugging:

  * print statements
  * interactive debuggers
  * stack traces
  * [rubber ducks](https://en.wikipedia.org/wiki/Rubber_duck_debugging)

Modern debugging:

  * Google.com
  * StackOverflow.com
  * in-browser dev tools

# True Names

> "For magic consists in this, the true naming of a thing." 
> &nbsp; - Ursula LeGuin, _A Wizard of Earthsea_

to know the true name of an object... or a concept... is to have power over it

**SO**

you can't google an error until you know the name of the error

# Google to Learn

Often, bugs and errors come from programmers not *quite* understanding the library or language feature they are using. 

While reading docs can be tedious, it can help you to understand what problem you're trying to solve... 

...even if only to be able to ask for help elsewhere and start by saying, "I've read the docs and I still don't get it."

# How to Google

* First, think of the *name* of the concept/library/feature/language/tool/error. Remember, **names have power**.

* Search for it and half the time you'll find what you're looking for on the first page of results.

* If the first page is filled with clutter, add a term that distinguishes what you're looking for from all those other results, and search again.
  * Example: `god` vs `god of war` vs `god of war greece` vs `god of war game`
  * Example: `stack` vs `javascript stack` vs `javascript stack trace`

* Then once you find the docs, read the whole page.
  * **Don't** just skim for code snippets!

# How to Read

[demo describing how to read MDN, man pages, etc.. Also, always skip W3Schools.]

# Google to Debug

If you get an error that you don't understand...

...the first thing to do is **not** to Google it.

# Anatomy of an Error

<!--box-->

[TODO: diagram or demo of an error; interactively dissect the error, ask students "what is the name?" and "where is it happening?" and such]

<!--/box-->

# Modern Debugging: Step 1

> Step 1: Read the error... **carefully**.

Mentally dissect the error report. Try to separate the *signal* from the *noise*.

Answer the following questions:

  * **Where** in your code is the error occurring?
  * **What** is the *name* of the error message?
  * **Why** is this error happening now? 
    * What is the **context** of the error? 
    * What is the code **expecting**, and what did it find instead?
  * If there are several error messages in a row, **which** is the root error?

(More detail on these questions in the following slides.)

*After* answering these questions, look at your code. Open up the file, scroll to the line and read the code to yourself, or read it aloud to your pair partner or your [rubber duck](https://en.wikipedia.org/wiki/Rubber_duck_debugging). Many times the cause will be obvious.

# Where?

**Where** in your code is the error occurring?

  * there will often (though not always!) be a *stack trace* including paths, file names, line numbers
  * [todo: link to another per-language lesson with a lot more detail on stack traces]
  * Once you mentally redact the stack trace, it becomes easier to understand the rest of the error.

# What?

**What** is the *name* of the error message?

  * this will usually be in English, though possibly fragmented and jargony, e.g. "file not found" or "undefined is not a function".
  * This is not gibberish. It is meaningful. **Names have power.**

# Why?

What is the **context** of the error? What is the code **expecting**, and what did it find instead?

  * e.g. if it says "file not found", what is the file it is looking for? Is it looking in the right place and the file isn't there? Or is it looking in the wrong place?
  * e.g. if it says "undefined is not a function", *undefined* is the value of a variable that it expects to be a function. What is the name of the variable? Why doesn't it point to a function?

You may have to use traditional debugging techniques to answer these questions, e.g. print statements to fill in the values that didn't make it into the error message itself.

(Yes, a 'file not found' error really should tell you what file was not found; when you write your own error messages you should include as much relevant info as you can.)

# Which?

If there are several error messages in a row, **which** is the root cause?

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

After googling, you will probably find your question answered on [StackOverflow.com](http://StackOverflow.com "Stack Overflow web site").

Remember, though: *not all answers are correct*. You shouldn't just copy and paste code from the first result.

# SOOP: StackOverflow Oriented Programming

copy / paste / tweak / repeat

This workflow is far from ideal, but it is acceptable...

... **with these caveats:**

  * you must have unit tests, to prove that the code 
    * (a) does what you want
    * (b) doesn't do anything you *don't* want
  * you should refactor the code after you get it to work
  * you must at least try to understand it, then mark (with a code comment or commit message) what parts of the code you don't understand
  * you should put a code comment with a link to the StackOverflow answer, so future coders (including you!) can learn more about how it works and why it was needed

# Write a Failing Test

When a user reports a bug, the first thing to do is to write a test that exposes the bug, then run it and watch it fail.

This assures that you have *actually* identified the cause of the bug, and that once you think it's fixed, it's *actually* fixed.

# In-Browser Debugging

Modern Web Browsers (Chrome, Firefox, Safari, Edge) have some very good tools to help you inspect the state of your app, including

  * JS console
  * inspect & edit DOM / CSS
  * network access logs and graphs

These tools are useful, but you still need to ask and answer all the debugging questions yourself.

"Modern Front-End Workflow with DevTools" talk: <https://www.youtube.com/watch?v=wz1Sy5C039M>


