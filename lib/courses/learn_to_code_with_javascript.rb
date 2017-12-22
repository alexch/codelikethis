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

    # lesson "argv"   # https://code-maven.com/argv-raw-command-line-arguments-in-nodejs
    # lesson "hashes"  # aka objects

    # lesson "methods"
    # lesson "functions again"
    # lesson "closures"

    # lesson "express"

    # lesson "extra"
    # lesson "next_steps"
    # lesson "classes"
  end
end
