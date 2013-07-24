# Functions

* just like a VARIABLE is a name for a chunk of data
* a FUNCTION is a name for a chunk of code
* if you have some code you want to run again and again
  * or just run once, but keep it organized

# For example

Here's a silly function:

    def add x, y
      x + y
    end

* `def` means "define a function"
* `add` is the *name* of the function
* `x, y` are the *parameters* of the function
* `x + y` is the *body* of the function
  * also the *return value*


# Titleize

    def titleize string
      string.split(' ').map(&:capitalize).join(' ')
    end


