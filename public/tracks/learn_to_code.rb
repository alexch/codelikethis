require "track"

Track::LearnToCode = Track.new(name: "learn_to_code",
                                 display_name: "Learn to Code with Ruby",
                                 description: "If you've never coded before... if you're a self-taught coder who wants to fill in the gaps in your foundation... or if you want to learn Ruby from the ground up... then this track is for you. We start with the very basics -- what is a computer? what is a terminal? what is a variable? -- and work up to command-line input/output, basic data structures like stacks and hashes, and conclude by making a small (but functional) web application.",
                                 ) do
    lesson name: "intro"
    lesson name: "computers"
    lesson name: "ruby"
    lesson name: "objects"
    lesson name: "strings"
    lesson name: "numbers"
    lesson name: "variables"
    lesson name: "nil"

    lesson name: "the_command_line"

    lesson name: "input_and_output"
    lesson name: "logic"
    lesson name: "loops"
    lesson name: "arrays"
    lesson name: "argv"
    lesson name: "stacks"
    lesson name: "hashes"
    lesson name: "functions"
    lesson name: "sinatra"
    lesson name: "extra"
    lesson name: "next_steps"
    # lesson name: "recursion"
    # lesson name: "methods"
    # lesson name: "classes"
end
