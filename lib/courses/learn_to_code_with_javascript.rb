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

    lesson "the_command_line"
    lesson "input_and_output"  # see also https://code-maven.com/reading-a-file-with-nodejs

    # lesson "logic"
    # lesson "loops"
    # lesson "arrays"
    # lesson "argv"   # https://code-maven.com/argv-raw-command-line-arguments-in-nodejs

    # lesson "functions"  # this needs to lead up to nodejs callbacks

    # lesson "hashes"  # aka objects
    # lesson "methods"

    # lesson "express"

    # lesson "extra"
    # lesson "next_steps"
    # lesson "classes"
  end
end
