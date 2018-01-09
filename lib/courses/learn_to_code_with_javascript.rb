require "course"

class Course
  LearnToCodeWithJavascript = Course.new(
      name: "learn_to_code_with_javascript",
      display_name: "Learn to Code with JavaScript",
      abstract: "If you've never coded before... if you're a self-taught coder who wants to fill in the gaps in your foundation... or if you want to learn JavaScript from the ground up... then this course is for you. We start with the very basics -- what is a computer? what is a terminal? what is a variable? -- and work up to command-line input/output, basic data structures like stacks and hashes, and intermediate computer science concepts like closures and recursion.",
      goals: [ # "the student will learn"
          "how to edit and execute code on their own computer using a text editor and a terminal (command line)",
          "fundamental coding concepts, including variables, types, functions, loops, I/O, logic, recursion",
          "how to recognize and use certain abstract data structures (arrays, stacks, hashes)",
          "basic use of JavaScript and NodeJS",
      ]
  ) do

    lesson "intro"
    lesson "computers"
    lesson "values"

    lesson "strings"
    lesson "numbers"

    lesson "variables"
    lesson "null"
    lesson "functions"

    lesson "the_command_line"

    lesson "loops"

    lesson "input_and_output"
    lesson "logic"

    lesson "arrays"
    lesson "argv" # https://code-maven.com/argv-raw-command-line-arguments-in-nodejs
    lesson "stacks"
    lesson "hashes" # (as data structures, not objects)

    lesson "recursion"

    # lesson "exceptions" -- take the concept of "guard clause" from recursion and extend it to DBC and maybe node's assert (but warn that console.assert doesn't stop)

    # lesson "function pointers"
    # lesson "methods" -- hash-as-object and `this`
    # lesson "closures" -- scope

    # lesson "express"

    # lesson "extra"
    # lesson "next_steps"
    # lesson "classes"
  end
end
