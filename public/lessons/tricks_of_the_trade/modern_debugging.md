    topic name: "debugging"
    topic name: "errors"
    link name: "Bugs and Errors", href: "http://eloquentjavascript.net/08_error.html",
         from: "EloquentJavaScript"

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

# tech support cheat sheet

![tech support cheat sheet](/images/tech_support_cheat_sheet.png)

from https://xkcd.com/627/

# How to Google

* First, think of the *name* of the concept/library/feature/language/tool/error. Remember, **names have power**.

* Search for it and half the time you'll find what you're looking for on the first page of results.

* If the first page is filled with clutter, add a term that distinguishes what you're looking for from all those other results, and search again.
  * Example: `god` vs `god of war` vs `god of war greece` vs `god of war game`
  * Example: `stack` vs `javascript stack` vs `javascript stack trace`

* Then once you find the docs, read the whole page.
  * **Don't** just skim for code snippets!

# Google is not a Debugger

If you get an error that you don't understand...

...the first thing to do is **not** to Google it.

# Modern Debugging: Step 1

> Step 1: read the error

See [Read the Error](../tricks_of_the_trade/debugging#anchor/read-the-error) to learn *how to read an error*.

Often, reading the error reveals enough information to give you an idea for a solution.

# Modern Debugging: Step 2

> Step 2: google the *name* of the error

You may find a relevant tutorial, blog post, or [StackOverflow](http://stackoverflow.com) answer.

# Modern Debugging: Step 3

> Step 3: google the *name and context* of the error

"context" here means either system information (like file paths) or abstract information (like a problem domain, or the name of a package you're using).

  * be aware that some parts of the context will be specific to your personal setup
      * e.g. the first part of full file paths
  * you may need to delete these parts and search again

# Modern Debugging: Step 4

> Step 4: Stack Overflow

After googling, you will probably find your question answered on [StackOverflow.com](http://StackOverflow.com "Stack Overflow web site").

Remember, though: *not all answers are correct*. You shouldn't just copy and paste code from the first result.

**Read the words**, not just the code, in the answer, to make sure the author really is solving a problem that is fundamentally similar to yours.

# SOOP: StackOverflow Oriented Programming

> copy / paste / tweak / repeat

This workflow is far from ideal, but it is acceptable...

... **with these caveats:**

  * you must write unit tests, to prove that the code
    * (a) does what you want
    * (b) doesn't do anything you *don't* want
  * you should refactor the code after you get it to work
  * you must at least try to understand it, then mark (with a code comment or commit message) what parts of the code you don't understand
  * you should put a code comment with a link to the StackOverflow answer, so future coders (including you!) can learn more about how it works and why it was needed
  
# Ask for Help

* If you ever get stuck, feel free to ask on the appropriate chat channel
  * Don't be embarrassed -- there are no stupid questions!
* If you can't formulate your question -- or even if you can -- post your source code and say, "What am I doing wrong?"
* Slack supports *code snippets*; you can also post a link to a github repo or a [gist](http://gist.github.com)

# Write a Failing Test

When a user reports a bug, the first thing to do is to write a test that exposes the bug, then run it and watch it fail.

This assures that you have *actually* identified the cause of the bug, and that once you think it's fixed, it's *actually* fixed.

