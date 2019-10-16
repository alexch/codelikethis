# What is Refactoring?

Refactoring is the Process of changing your *existing*, *working*, code without altering its behavior.

You've made it *work*, now refactor to make it *right*.

# What is Refactoring NOT?

* Rebuilding
* Upgrading 
* Porting
* Debugging

# Why Refactor

* to increase clarity
* to remove duplication
* to understand

# Code Smells

"Code smells" are patterns or anti-patterns in your code that are generally a red flag that your code is becoming convoluted.

* levels of indentation
* duplication/repetition
* long lines of code
* strange blocks
* large comments

# Indentation

Levels of indentation in properly formatted code are very important; they let us know what code is in what scope, and allow us to see at a glance what is contained inside something else

If you find you're nested more than a couple levels deep it you may want to try and extract your inner processes to their own functions.

Don't fall into the Christmas tree of DOOM

# Duplication

If you find that you are repeating the same code in multiple places it's a good sign that this bit of code should be its own function.

Duplicated code blocks are just functions waiting to be extracted.

# Long Lines

Long lines of code are an indication that you're trying to do too many things at once. Ask yourself: Can I break this process into multiple steps?

# Strange Blocks

Look for anti-patterns in your code. Strange blocks of code that don'e fit with their sorroundings, might be better off in a different section of your code.

# Large Comments

Long comments are a good sign that your code is unclear.

Can you make variable names more descriptive?

Is the code your comment corresponds to trying to do too much at once?

# "Zen" Refactoring

Allow your eyes to blur.

Scan the shape of your code. What stands out?

  * Colors? are they grouped, or mixed throughout your program
  * Indentation? Is everything more or less in the same scope, or are is there a lot of nesting going on?

The same color Represents things of the same type.  You should try and group like things together, so you want large blocks of the same color.

Indentation represents scope, and the level of nesting. Nesting one or two levels deep is good, it helps you organize similar processes. Nesting deeper than that is not very easy to follow, and leads to unnecessary complexity.

# Refactoring for Clarity

If you have your code is at a point where *you* understand what's going on, try and make it so *anyone* can glance at your code and follow what's going on.

# What is Code Clarity?

* Readable
* Modular
* Maintainable
* Changeable
* Predictable

# Inline Refactoring

The process of taking a long line of code, and assigning the values used to variables, then rewriting the line using variable names instead.

>Refactoring might make your code longer or introduce duplication in order to make your code clearer.

# Refactoring to Remove Duplcation

Refactoring is not always a straight path. Sometimes to increase clarity you have to use duplication.  Don't get rid of duplication too soon, wait and see if a pattern emerges, then try and extract the pattern.

Wait until you know that something is *actually* duplication before refactoring it away.

# Refactoring to Understand

Most of the time as a project grows larger it becomes more complex, and convoluted. 

If this rampant growth continues for a while you may find that your program becomes reliant on functions that you no longer know how they work, only that they do, and everything else depends on them.

# Break it Down

The first step to figuring out what a function does is to see if you can break it into its compenent parts.  

What do these parts do on their own?

Can you break a large function into several smaller functions?

Sometimes you have to *increase* duplication to improve clarity.

# Track a Value

If you can't figure out how to breack a large fuction apart pick a value, and track it through the function using print statements (`console.log()`).

Pay attention to where the value changes. These are good indications of potential interior functions you can extract.
