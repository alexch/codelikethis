require "course"

require_relative '../../lib/link.rb'


class Course
  LearnToCodeWithJavascript = Course.new(
      name: "learn_to_code_with_javascript",
      display_name: "Learn to Code with JavaScript",
      abstract: "If you've never coded before... if you're a self-taught coder who wants to fill in the gaps in your foundation... or if you want to learn JavaScript from the ground up... then this course is for you. We start with the very basics -- what is a computer? what is a terminal? what is a variable? -- and work up to command-line input/output, basic data structures like stacks and hashes, and intermediate computer science concepts like closures and recursion.",
      links: [
          Link.new(name: "Atom", href: "http://atom.io", description: "home page for the Atom text editor"),
          Link.new(href: "https://www.codecademy.com/tracks/javascript",
                   name: "CodeCademy Intro to JavaScript course"),
      ]
  ) do

    # "the student will learn..."
    goal "how to edit and execute code on their own computer using a text editor and a terminal (command line)"
    goal "fundamental coding concepts, including variables, types, functions, loops, I/O, logic, recursion"
    goal "how to recognize and use certain abstract data structures (arrays, stacks, hashes)"
    goal "basic use of JavaScript"


    lesson name: "intro"
    lesson name: "computers"
    lesson name: "values"

    lesson name: "strings"
    lesson name: "numbers"

    lesson name: "variables"
    lesson name: "null"
    lesson name: "functions"

    lesson name: "the_command_line"
    link href: "https://vimeo.com/152746852",
         name: "Terminal 101",
         description: "intro to unix command-line by a former Turing School student"
    # time: "11 min",

    lesson name: "loops"

    lesson name: "input_and_output"
    lesson name: "logic"

    lesson name: "arrays"
    lesson name: "argv"
    lesson name: "stacks"
    lesson name: "hashes"

    lesson name: "recursion"

    # lesson name: "exceptions" -- take the concept of "guard clause" from recursion and extend it to DBC and maybe node's assert (but warn that console.assert doesn't stop)

    # lesson name: "function pointers" -- and callbacks?
    # lesson name: "methods" -- hash-as-object and `this`
    # lesson name: "closures" -- scope

    # lesson name: "express"

    # lesson name: "extra"
    # lesson name: "next_steps"
    # lesson name: "classes"
  end
end
