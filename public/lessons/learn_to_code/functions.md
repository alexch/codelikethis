# Functions

* just like a VARIABLE is a name for a chunk of data
* a FUNCTION is a name for a chunk of code
* if you have some code you want to run again and again
  * or just run once, but keep it organized

# For example

Here's a not very useful function:

    @@@ ruby
    def add x, y
      x + y
    end

* `def` means "define a function"
* `add` is the *name* of the function
* `x, y` are the *parameters* of the function
* `x + y` is the *body* of the function
  * also the *return value*

# Call Me, Maybe

You call a function by its name

    @@@ ruby
    def add x, y
      x + y
    end

    add 2, 3  # returns 5

    add 12, 30  # returns 42

# Rant!!!

    @@@ ruby
    def rant s
      s.upcase.gsub(" ", "") + "!!!"
    end

    puts rant "i like pizza"

# Capitalize Just The First Character

    @@@ ruby
    def initial_cap s
      s[0] + s[1,s.length].downcase
    end

    puts initial_cap("McElaney")

this program prints `Mcelaney`

# Titleize

    @@@ ruby
    def titleize string
      string.split(' ').map(&:capitalize).join(' ')
    end

* The funny `&:` means "send this message"
* `map(&:capitalize)` means "send the message `capitalize` to every item in the array"


# LAB: todo


