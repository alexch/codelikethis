# coding: utf-8
require "track"

require_relative '../../../lib/link.rb' # :-(

Track::Javascript = Track.new(
  name: "javascript",
  display_name: "Learn to Code with JavaScript",
  description: "If you've never coded before... if you're a self-taught coder who wants to fill in the gaps in your foundation... or if you want to learn JavaScript from the ground up... then this track is for you. We start with the very basics -- what is a computer? what is a terminal? what is a variable? -- and work up to command-line input/output, basic data structures like stacks and hashes, and intermediate computer science concepts like closures and recursion. On the first day we make a small (but functional) web application and send it forth into the world.",
  ) do

  # "the student will learn..."
  goal name: "how to edit and execute code on their own computer using a text editor and a terminal (command line)"
  goal name: "fundamental coding concepts, including variables, types, functions, loops, I/O, logic, recursion"
  goal name: "how to recognize and use certain abstract data structures (arrays, stacks, hashes)"
  goal name: "Creating and modifying source code using a text editor"
  goal name: "Using the Chrome Developer Tools console to write and debug Javascript code"
  goal name: "Combining HTML and JavaScript in a single file"
  goal name: "Importing a JavaScript (.js) file into an HTML file using the SCRIPT SRC tag"
  goal name: "Using JavaScript to access and manipulate values inside an HTML web page"
  goal name: "Declaring variables and assigning primitive values (strings, numbers, booleans)"
  goal name: "Declaring, passing parameters to, and returning values from functions"
  goal name: "Basic mathematical operations (addition, subtraction, multiplication, etc.)"
  goal name: "String manipulation (literal declarations, concatenation, length, substring extraction)"
  goal name: "Usage of simple data structures (arrays, dictionaries (aka “JavaScript Objects”), stacks"
  goal name: "Boolean logic and comparisons (equality, less than / greater than, and / or / not)"
  goal name: "Conditional control flow (if / then / else)"
  goal name: "Loops and iterators (while loops, for loops, map and each)"

  link name: "VS Code",
       href: "https://code.visualstudio.com",
       description: "Installation instructions for the VS Code text editor"

  link href: "https://www.codecademy.com/tracks/javascript",
       name: "CodeCademy Intro to JavaScript course"

  link from: 'mdn',
       href: "https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps",
       name: "MDN: JavaScript First Steps"

  link href: 'https://play.elevatorsaga.com/', name: 'Elevator Saga'

  link name: "Exercism [online]",
    href: "http://exercism.io/languages/javascript"

  link name: "Exercism [local]",
    href: "http://github.com/BurlingtonCodeAcademy/exercism-javascript"

  link href: "https://www.codecademy.com/articles/glossary-javascript",
       name: "JavaScript Glossary"

  project name: "exercism"
  project name: "exercism_fork"

  lesson name: "intro"
  lesson name: "the_command_line"

  lesson name: "/server_side_javascript/hello_express", description: "Build a simple 'Hello World' application in NodeJS and deploy it to Heroku."

  lesson name: "values"
  lesson name: "/javascript_intro/common_operators"
  lesson name: "strings"
  lesson name: "unicode"
  lesson name: "numbers"
  lesson name: "/javascript_intro/common_methods"
  lesson name: "variables"
  lesson name: "null"
  lesson name: "functions"
  lesson name: "/javascript_intro/functional_labs"
  lesson name: "logic"
  lesson name: "input_and_output"
  lesson name: "loops"

  lesson name: "arrays"
  lesson name: "argv"

  lesson name: "objects"
  lesson name: "hashes"

  lesson name: "methods"
  lesson name: "iteration_methods"
  lesson name: "objects_methods_and_classes"
  lesson name: "/javascript_intro/object_labs"
  lesson name: "stacks"
  lesson name: "scope"
  lesson name: "recursion"

  lesson name: "debugging_locally"

  # lessons below this point are not necessarily in pedagogical order;
  # they may be woven in to the above track, or other tracks, as desired
  lesson name: "regexp", display_name: "Regular Expressions"
  lesson name: "json",
         description: "JSON is a coding language, but it's not a programming language. Its purpose is to represent data with no behavior attached. It's useful for saving state, transferring information across a network, writing config files or editing settings. And since it's a strict subset of the JavaScript language syntax, it's natural to use it in JavaScript programs and JavaScript-aware text editors."
  lesson name: "timing", display_name: "Timing in JavaScript"

  # lessons on testing in JavaScript
  # TODO: move to new testing_in_javascript track
  lesson name: "/agile/test_driven"
  lesson name: "no_frills_testing"
  lesson name: "cypress"
  lesson name: "unit_testing"


  # ES6 and modern JS deep dives

  lesson name: 'hybrid_styles' do
    topic name: "procedural-programming"
    topic name: "functional-programming"
    topic name: "object-oriented-programming"
  end


  lesson name: "promises" do
    video name: "Promises - Fun Fun Function", youtube_id: "2d7s3spWAzo"
  end
  lesson name: "evented_io", display_name: "Evented I/O" do
    topic name: "es6"
    topic name: "promises"
    topic name: "async-await"
  end

  # advanced
  lesson name: 'encapsulation'
  lesson name: 'state_machines'

  # One-offs
  # TODO: make a new track for these
  lesson name: "take_a_minute_to_refactor_winner"

end
