require "track"

require_relative '../../lib/link.rb'


Track::LearnToCodeWithJavascript = Track.new(
  name: "learn_to_code_with_javascript",
  display_name: "Learn to Code with JavaScript",
  description: "If you've never coded before... if you're a self-taught coder who wants to fill in the gaps in your foundation... or if you want to learn JavaScript from the ground up... then this track is for you. We start with the very basics -- what is a computer? what is a terminal? what is a variable? -- and work up to command-line input/output, basic data structures like stacks and hashes, and intermediate computer science concepts like closures and recursion. On the first day we making a small (but functional) web application and send it forth into the world.",
  ) do

  # "the student will learn..."
  goal "how to edit and execute code on their own computer using a text editor and a terminal (command line)"
  goal "fundamental coding concepts, including variables, types, functions, loops, I/O, logic, recursion"
  goal "how to recognize and use certain abstract data structures (arrays, stacks, hashes)"
  goal "basic use of JavaScript"

  link name: "Atom", href: "http://atom.io", description: "home page for the Atom text editor"
  link href: "https://www.codecademy.com/tracks/javascript",
       name: "CodeCademy Intro to JavaScript course"
  link href: "https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps", name: "MDN: JavaScript First Steps"
  link href: "https://www.codecademy.com/articles/glossary-javascript",
    name: "JavaScript Glossary"

  lesson name: "intro" do
    video youtube_id: '-jRREn6ifEQ'
  end

  lesson name: "the_command_line"
  link href: "https://vimeo.com/152746852",
       name: "Terminal 101",
       description: "intro to unix command-line by a former Turing School student"
  # time: "11 min",

  lesson name: "/server_side_javascript/hello_node", description: "Build a simple 'Hello World' application in NodeJS and deploy it to Heroku."

  lesson name: "values"
  lesson name: "strings"
  lesson name: "numbers"

  lesson name: "variables"
  lesson name: "null"
  lesson name: "functions"

  lesson name: "input_and_output" do
    video youtube_id: 'DKGZlaPlVLY'
  end

  lesson name: "logic"
  lesson name: "loops" do
    project name: 'guess'
  end

  lesson name: "arrays"
  lesson name: "argv" do
    project name: "today_i_learned_cli"
  end
  lesson name: "stacks"
  lesson name: "hashes"

  lesson name: "recursion"

  # lesson name: "exceptions" -- take the concept of "guard clause" from recursion and extend it to DBC and maybe node's assert (but warn that console.assert doesn't stop)

  # lesson name: "function pointers" -- and callbacks?
  # lesson name: "methods" -- hash-as-object and `this`
  # lesson name: "closures" -- scope

end
