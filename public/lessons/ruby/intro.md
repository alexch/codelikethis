!SLIDE subsection
# Introduction to Ruby for Programmers

<img src="ruby-logo.jpg" width="250">

This section is intended as a brief, lightweight overview of the Ruby language; following sections will cover all these topics in much more detail. Students are encouraged to ask questions, but instructors are encouraged to answer, "We'll cover that later."

# Ruby vs. Rails

## Ruby is a Language
<img src="ruby-logo.jpg" height="125" width="125">

## Rails is a Framework
<img src="rails-logo.jpg" height="125" width="125">

## Rails is written in Ruby

<!SLIDE subsection incremental>
# Ruby Philosophy

Matz (Yukihiro Matsumoto), Ruby creator, says:

"I believe people want to express themselves when they program. They don't want to fight with the language."

"Programming languages must feel natural to programmers."

"I tried to make people enjoy programming and concentrate on the fun and creative part of programming when they use Ruby."

"For me the purpose of life is partly to have joy. Programmers often feel joy when they can concentrate on the creative side of programming, So Ruby is designed to make programmers happy."

"I wanted a scripting language that was more powerful than Perl, and more object-oriented than Python."

* <http://linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html>
* <http://www.ruby-lang.org/en/about/>

# Ruby Philosophy: Humane Interface

* Ruby has a *humane interface*
  * many ways to do things
* Ruby favors readability and variety over concision and perfection
* sometimes makes code hard to understand (but usually makes it easier)
* contrast to *minimal interface*
  * one (or a few) "right" ways to do things
  * Python has a minimal philosophy

# Many Rubies

* Ruby 1.0 released in 1996
  * Fully Open Source

![too many rubies](rubies.png)

# Versions common today

* MRI 1.8.7 
  * old, on many production servers
* MRI 1.9.3 
  * stable, more modern
* [Ruby 2.0](http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/) was [*just* released](http://www.ruby-lang.org/en/news/2013/02/24/ruby-2-0-0-p0-is-released/)
* JRuby 
  * runs on Java VM and J2EE servers -- deploy = WAR file

# Ruby Language Overview

Ruby is...

* Interpreted
* Dynamically typed
* Object oriented
* Blocks / lambdas / closures
* Perl-like regular expressions
* Closely tied to shell & OS

# IRB: Interactive RuBy

    @@@ ruby
    $ irb
    >> 4
    => 4
    >> 4+4
    => 8

Please fire up `irb` on your computer and **try this out** right now!

# Everything's an Object

    @@@ ruby
    >> 2.class
    => Fixnum

    >> 2.to_s
    => "2"

    >> 2.to_s.class
    => String

# Everything Has a Value

    @@@ ruby
    >> 2 + 2
    => 4

    >> (2+2).zero?
    => false

    >> if true then "yes" end
    => "yes"

    >> if false then "yes" end
    => nil

# Output vs Value

    >> puts "foo"
    foo
    => nil

The *output* is `foo\n` but the *value* is `nil`.

# Variables are Names for Objects

    fruit = "apple"

* `fruit` is the name of an object containing `apple`

# Printing

* `print` prints its arg
* `puts` prints its arg plus a newline
* `p` *inspects* and prints its arg plus a newline

# Advanced Printing
* `pp` *pretty-prints* its arg plus a newline
  * `require "pp"`
* `ap` is even prettier than `pp`
  * uses color, indenting, array counting
  * provided by the "awesome_print" gem
* `d` is even prettier than `ap`
  * provided by the `wrong` gem
  * `require "wrong"; include Wrong::D`
  * if x is 10, `d { x }` prints `x is 10`

# Functions

    @@@ ruby
    def add a, b
      a + b
    end

    add 2, 2
    #=> 4

* Note: no 'return' required
* `def add(a, b)` is also legal

# Optional Punctuation

* semicolons, parens, and `return` are optional

* These are equivalent:

        @@@ ruby
        def increment(x)
          return x + 1;
        end

        def increment x
          x + 1
        end

* Also these:

        @@@ ruby
        def increment x; x + 1; end

        def increment(x) x + 1; end

# Blocks are like mini-functions

* Blocks can also take parameters or return a value
* e.g. the `map` iterator translates each item in an array into a new array

        @@@ ruby
        >> ["hello", "world"].map {|string| string.upcase}
        => ["HELLO", "WORLD"]

* `{|string| string.upcase}` defines a block

# Method Chaining

* Chaining is a *really* cool and powerful Ruby idiom
* It depends on these three features:
  * Every expression has a value
  * Every value is an object
  * Iterators are loops inside methods
* So you can call a method on *anything*
  * including the result of an iterator

# Method Chaining Example

    s = "my dog has fleas"

Without chaining:

    words = s.split
    words = words.map{|word| word.capitalize}
    s = words.join(" ")

With chaining:

    s = "my dog has fleas"
    s.split.map{|word| word.capitalize}.join(" ")

# Poetry vs Prose

Other languages are prose:

    @@@ Java
    public String titleize(s) {
      String words = s.split(" ");
      String titleized = "";
      for(int i =0; i < words.length ; i++) {
        char capLetter = Character.toUpperCase(words[i].charAt(0));
        String capWord =  capLetter + words[i].substring(1, words[i].length());
        titleized += capWord + " ";
      }
      return titleized.trim();
    }

Ruby is poetry:

    @@@ Ruby
    def titleize s
      s.split.map(&:capitalize).join(" ")
    end

Cf. **declarative** vs. **algorithmic**

# Ruby has hash comments, like perl

    @@@ ruby
    # is a comment
    2 + 2 # is a comment

Ruby has a syntax for multiline comments too, but it's silly and nobody uses it.

# Line Break Gotcha

    @@@ ruby
    x = 1 + 2
    x #=> 3

    x = 1
      + 2
    x #=> 1

Solution: always put operators on top line

    x = 1 +
        2
    x #=> 3

# Use parens when you need them

    @@@ ruby
    >> "Hello".gsub "H", "h"
    => "hello"

    >> "Hello".gsub "H", "h".reverse
    => "hello"

    >> "Hello".gsub("H", "h").reverse
    => "olleh"

# Variables are declared implicitly

    @@@ ruby
    first_name = "Santa"
    last_name = "Claus"
    full_name = first_name + last_name
    #=> "SantaClaus"

# Built-in Types

* Numbers
  * `42` (Fixnum)
  * `3.14159` (Float)
* Booleans
  * `true`
  * `false`
* Strings
  * `"apple"`
  * `'banana'`
* Symbols
  * `:apple`

# Built-in Types (cont.)

* Arrays
  * `["apple", "banana"]`
* Ranges
  * `(1..10)`
* Hashes
  * `{:apple => 'red', :banana => 'yellow'}`
  * `{apple: 'red', banana: 'yellow'}`
* Regular Expressions
  * `/fo*/i`

# String interpolation

    @@@ ruby
    "boyz #{1 + 1} men"
    => "boyz 2 men"

* Any Ruby code can go inside the braces
* It gets evaluated and stuck inside the string

# equal, double-equal, and threequal

* `x = 1` means "put the value `1` in the variable `x`"
* `x == 2` means "`true` if `x` is `2`, otherwise `false`"
* `x === 3` means the same as `==` but sometimes more
  * threequal is rarely used

# Ruby syntax cheatsheet

![cheatsheet](/lessons/ruby_basics/cheatsheet/cheatsheet.png)

(_The Well-Grounded Rubyist_, p. 5, section 1.1.2)

# Interlude

Are you sick of hearing me speak?

If so, do a lab: 01_temperature is right up your alley.

# Iterators

    @@@ ruby
    my_array = ["cat", "dog", "world"]
    my_array.each do |item|
      puts "hello " + item
    end

* `do...end` defines a *block*
* calls the block with `item = "cat"`
* then calls the block with `item = "dog"`
* then calls the block with `item = "world"`

# Classes and methods

    @@@ ruby
    class Calculator
      def add(a,b)
        a + b
      end
    end

    calc = Calculator.new
    calc.add(2, 2)
    #=> 4

* a *function* inside a *class* is called a *method*

# Classes

* A class defines a group of behaviors (methods)
* Every object has a class, `Object` if nothing else

# Messages and Methods

* an object is referenced by a variable or a literal
* the dot operator (`.`) sends a message to an object
* an object receives a *message* and invokes a *method*
* with no dot, the default object (`self`) is the receiver

# bang and question mark methods

* method names can end with `!` or `?`
  * `?` means "boolean"
  * `!` means "watch out!"

# Ruby Naming Conventions

methods and variables are in `snake_case`

classes and modules are in `CamelCase`

constants are in `ALL_CAPS`

> Standard is better than better.
>
> -- Anon.

# Ruby Identifiers

* `local_variable` - start with letter or underscore, contain letters, numbers, underscored
* `@instance_variable` - start with `@`
* `@@class_variable` - start with `@@`
* `$global_variable` - start with `$`
* `Constant` or `CONSTANT` - must start with uppercase letter
* `ClassName` - capitalized camel case
* `method_name?` - like a local variable, but can end with `?` or `!` or `=`
* keywords - about 40 reserved words (`def`) and weirdos (`__FILE__`)
* literals - `"hi"` for strings, `[1,2]` for arrays, `{:a=>1, :b=>2}` for hashes, etc.

# Variable Scopes

    @@@ ruby
    var   # local variable (or method call)
    @var  # instance variable
    @@var # class variable
    $var  # global variable
    VAR   # constant

# `load` and `require`

* `load` inserts a file's contents into the current file
* `require` makes a *feature* available to the current file
  * skips already-loaded files
  * omits the trailing `.rb`
  * can also be used for extensions written in C (`.so`, `.dll`, etc.)

# Next steps

* Lesson: [Ruby Tools](/lessons/ruby/tools)
* Lesson: [Ruby Basics](/lessons/ruby/ruby_basics)
* Lesson: [Ruby Objects](/lessons/ruby/ruby_basics)
* [other lessons](http://localhost:9292/lessons)

# Credits

* "Ruby Intro" slides based on [Ruby Quickstart for Refugees](https://gist.github.com/190567) by [Jacob Rothstein](http://about.me/jbr)
* Improved by Alex Chaffee, Sarah Allen, Wolfram Arnold


