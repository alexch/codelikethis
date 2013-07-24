require "course"

class Course
  LearnToCode = Course.new("learn_to_code") do
    lesson "learn_to_code"
    lesson "computers"
    lesson "objects"
    lesson "strings"
    lesson "numbers"
    lesson "variables"
    lesson "nil"
    lesson "the_command_line"
    lesson "input_and_output"
    lesson "logic"
    lesson "loops"
    lesson "arrays"
    lesson "argv"
    lesson "hashes"
    lesson "iterators"
    lesson "functions"
    lesson "sinatra"
    # lesson "methods"
    # lesson "classes"
  end
end
