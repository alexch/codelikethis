require "course"

class Course
  LearnToCodeWithJavascript = Course.new("learn_to_code_with_javascript",
                                         display_name: "Learn to Code with JavaScript") do
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
    lesson "argv"   # https://code-maven.com/argv-raw-command-line-arguments-in-nodejs
    lesson "stacks"
    lesson "hashes"  # (as data structures, not objects)

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
