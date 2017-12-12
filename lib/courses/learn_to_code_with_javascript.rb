require "course"

class Course
  LearnToCodeWithJavascript = Course.new("learn_to_code_with_javascript", display_name: "Learn to Code with JavaScript") do
    lesson "intro"
    lesson "computers"
    lesson "values"

    lesson "strings"
    # lesson "numbers"
    # lesson "variables"

    # lesson "null"
    # lesson "the_command_line"
    # lesson "input_and_output"
    # lesson "logic"
    # lesson "loops"
    # lesson "arrays"
    # lesson "argv"
    # lesson "hashes"
    # lesson "functions"
    # lesson "sinatra"
    # lesson "extra"
    # lesson "next_steps"
    # lesson "methods"
    # lesson "classes"
  end
end
