require "course"

Course::LearnToCode = Course.new(name: "learn_to_code",
                                 display_name: "Learn to Code with Ruby",
                                 abstract: "If you've never coded before... if you're a self-taught coder who wants to fill in the gaps in your foundation... or if you want to learn Ruby from the ground up... then this course is for you. We start with the very basics -- what is a computer? what is a terminal? what is a variable? -- and work up to command-line input/output, basic data structures like stacks and hashes, and conclude by making a small (but functional) web application.",
                                 ) do
    lesson "intro"
    lesson "computers"
    lesson "ruby"
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
    lesson "stacks"
    lesson "hashes"
    lesson "functions"
    lesson "sinatra"
    lesson "extra"
    lesson "next_steps"
    # lesson "recursion"
    # lesson "methods"
    # lesson "classes"
end
