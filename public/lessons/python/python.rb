require "track"

require_relative '../../../lib/link.rb' # :-(


Track::Python = Track.new(
    name: "python",
    display_name: "Learn to Code with Python",
    description: "If you've never coded before... if you're a self-taught coder who wants to fill in the gaps in your foundation... or if you want to learn Python from the ground up... then this track is for you. We start with the very basics -- what is a computer? what is a terminal? what is a variable? -- and work up to command-line input/output, basic data structures like stacks and hashes, and intermediate computer science concepts like closures and recursion. On the first day we making a small (but functional) web application and send it forth into the world.",
) do

  # "the student will learn..."
  goal name: "how to edit and execute code on their own computer using a text editor and a terminal (command line)"
  goal name: "fundamental coding concepts, including variables, types, functions, loops, I/O, logic, recursion"
  goal name: "how to recognize and use certain abstract data structures (arrays, stacks, hashes)"
  goal name: "Creating and modifying source code using a text editor"
  goal name: "Declaring variables and assigning primitive values (strings, numbers, booleans)"
  goal name: "Declaring, passing parameters to, and returning values from functions"
  goal name: "Basic mathematical operations (addition, subtraction, multiplication, etc.)"
  goal name: "String manipulation (literal declarations, concatenation, length, substring extraction)"
  goal name: "Usage of simple data structures (arrays, dictionaries, stacks"
  goal name: "Boolean logic and comparisons (equality, less than / greater than, and / or / not)"
  goal name: "Conditional control flow (if / then / else)"
  goal name: "Loops and iterators (while loops, for loops, map and each)"

  link name: "VS Code",
       href: "https://code.visualstudio.com",
       description: "Installation instructions for the VS Code text editor"

  link href: "http://introtopython.org/"

  link href: "https://learntocodewith.me/programming/python/python-2-vs-python-3/",
       name: "Should I learn Python 2 or Python 3?",
       description: "(TL;DR: Python 3)"
  link href: "https://sebastianraschka.com/Articles/2014_python_2_3_key_diff.html",
       name: "The key differences between Python 2.7.x and Python 3.x with examples"

  link href: "https://python.swaroopch.com/",
       name: "A Byte of Python",
       description: "a free book on programming using the Python language."

  link name: "Exercism",
       href: "http://exercism.io/languages/python",
       description: "Exercism contains challenges you download and complete on your own computer, guided by automated tests"

  lesson name: "intro"
  lesson name: "the_command_line"
  lesson name: "hello_bottle"

  # lesson name: "values"
  #
  # lesson name: "strings"
  #
  # lesson name: "numbers"
  #
  # lesson name: "variables"
  #
  # lesson name: "null"
  #
  # lesson name: "functions"
  #
  # lesson name: "/tricks_of_the_trade/debugging"
  #
  # lesson name: "/tricks_of_the_trade/modern_debugging"
  #
  # lesson name: "input_and_output"
  #
  # lesson name: "logic"
  #
  # lesson name: "recursion"
  #
  # lesson name: "scope"
  #
  # lesson name: "loops"
  #
  # lesson name: "arrays"
  #
  # lesson name: "argv"
  #
  # lesson name: "stacks"
  #
  # lesson name: "hashes"
  #
  # # todo: write slides
  # lesson name: "functions_as_values" do
  #   topic name: "callbacks"
  #   topic name: "each"
  #   topic name: "map"
  #   topic name: "filter"
  #   topic name: "reduce"
  # end
  #
  # # todo: write slides
  # lesson name: "methods", display_name: "Methods and Object Encapsulation"

  link href: "https://learnpythonthehardway.org/book/advice.html"
end
