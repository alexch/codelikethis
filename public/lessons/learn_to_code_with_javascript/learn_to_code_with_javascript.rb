require "track"

require_relative '../../../lib/link.rb' # :-(


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

  link name: "VS Code", href: "https://code.visualstudio.com", description: "Installation instructions for the VS Code text editor"

  link href: "https://www.codecademy.com/tracks/javascript",
       name: "CodeCademy Intro to JavaScript course"

  link from: 'mdn',
       href: "https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps",
       name: "MDN: JavaScript First Steps"

  link href: 'https://play.elevatorsaga.com/', name: 'Elevator Saga'

  link name: "Exercism [online]",
    href: "http://exercism.io/languages/javascript"

  link name: "Exercism [local]",
    href: "http://github.com/BurlingtonCodeAcademy/exercism-javascript"

  link href: "https://www.codecademy.com/articles/glossary-javascript",
       name: "JavaScript Glossary"

  project name: "exercism"

  project name: "exercism_fork"

  lesson name: "intro" do
    video youtube_id: '-jRREn6ifEQ'
    topic name: "text-editor"
  end

  lesson name: "the_command_line" do
    link href: "https://vimeo.com/152746852",
         name: "Terminal 101",
         description: "intro to unix command-line by a former Turing School student"
    link href: "https://www.learnenough.com/command-line-tutorial"
    topic name: "terminal"
    topic name: "command-line"
    topic name: "node"
    topic name: "text-editor"
    topic name: "directories"
  end

  lesson name: "/server_side_javascript/hello_node", description: "Build a simple 'Hello World' application in NodeJS and deploy it to Heroku." do
    topic name: "node"
    topic name: "servers"
    topic name: "npm"
    topic name: "package-json"
    topic name: "git"
    topic name: "github"
    topic name: "git-push"
    topic name: "heroku"
  end

 
  lesson name: "values" do
    topic name: "values"
    topic name: "numbers"
    topic name: "strings"
    topic name: "booleans"
    topic name: "operators"
    topic name: "return-values"

  end


  lesson name: "strings" do
    link href: "https://hackernoon.com/what-every-programmer-should-know-about-string-a6611537f84e"
    topic name: "strings"
    topic name: "comparisons"
    topic name: "characters"
    topic name: "string-methods"
  end

  lesson name: "numbers" do
    topic name: "numbers"
    topic name: "type-coercion"

  end

  lesson name: "variables" do 
    topic name: "values"
    topic name: "operators"
    topic name: "assignment"
    topic name: "return-values"

  end

  lesson name: "null" do
    topic name: "errors"
    topic name: "values"
  end

  lesson name: "functions" do
    topic name: "functions"
    topic name: "arguments"
    topic name: "parameters"
    topic name: "return-values"
  end


  lesson name: "/tricks_of_the_trade/modern_debugging" do # should be taught after functions (since call stack traces don't make sense without 'call') 
    topic name: "debugging"
    topic name: "errors"
  end

  lesson name: "input_and_output" do
    video youtube_id: 'DKGZlaPlVLY'
    topic name: "input-output"
    topic name: "node"
    topic name: "terminal"
    topic name: "functions"
    topic name: "methods"
    topic name: "es6"
    topic name: "ecmascript-six"
    topic name: "variables"
    topic name: "values"
    topic name: "callbacks"
    topic name: "command-line"
    topic name: "strings"
  end

  lesson name: "intermission", description: "This is a good place for a break, maybe between the first and second week of class."

  lesson name: "logic" do
    topic name: "comparisons"
    topic name: "booleans"
    topic name: "conditionals"
    topic name: "if-then"
    topic name: "if-else"
    topic name: "truthy-falsy"
    topic name: "assignment"
    topic name: "operators"
    topic name: "conjunctions"
    topic name: "node"
    topic name: "functions"
    topic name: "values"

  end

  lesson name: "recursion" do
    topic name: "recursion"
    topic name: "functions"
    topic name: "conditionals"
    topic name: "loops"
  end
  
  lesson name: "scope" do
    topic name: "scope"
    topic name: "global-variables"
    topic name: "local-variables"
    topic name: "parameters"
    topic name: "functions"
    topic name: "closure-scope"
  end

  lesson name: "loops" do
    project name: 'guess'
    topic name: "conditionals"
    topic name: "loops"
    topic name: "variables"
    topic name: "break"
    topic name: "index"
  end
  
  lesson name: "arrays" do
    topic name: "arrays"
    topic name: "values"
    topic name: "index"
    topic name: "methods"
    topic name: "loops"
    topic name: "refactoring"
  end


  lesson name: "argv" do
    project name: "today_i_learned_cli"
    topic name: "command-line"
    topic name: "arguments"
    topic name: "node"
    topic name: "strings"
    topic name: "numbers"
    topic name: "functions"
    topic name: "arrays"
    topic name: "loops"
  end

  lesson name: "stacks" do
    topic name: "stacks"
    topic name: "arrays"
    topic name: "functions"
    topic name: "loops"
    topic name: "methods"
    topic name: "recursion"
    topic name: "numbers"
    topic name: "reverse-polish-notation"
  end
  
  lesson name: "hashes" do
    topic name: "hashes"
    topic name: "objects"
    topic name: "key-value-pairs"
    topic name: "setting-getting"
    topic name: "strings"
    topic name: "values"
    topic name: "methods"
    topic name: "functions"
  end


  # lesson name: "exceptions" -- take the concept of "guard clause" from recursion and extend it to DBC and maybe node's assert (but warn that console.assert doesn't stop)
  # lesson name: "function pointers" -- and callbacks?
  # lesson name: "methods" -- hash-as-object and `this`


  link href: "https://learnpythonthehardway.org/book/advice.html"
  link href: "http://jsforcats.com"
  
end
