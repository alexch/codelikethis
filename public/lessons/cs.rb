require "track"

class Track
  Cs = Track.new(
      name: "cs",
      display_name: "Just Enough Computer Science",
      description: "As the old joke goes, the difference between theory and practice is that in theory, there is no difference. Computer Science is the academic field covering the theory of how computers work; this course covers some very practical theories, and how to apply them to your own code."
  ) do
    link href: "https://en.wikipedia.org/wiki/Computer_science"
    link href: "http://www.princeton.edu/~achaney/tmve/wiki100k/docs/Abstraction_(computer_science).html"

    lesson name: "unicode"

    lesson name: "turing_complete",
           description: "Alan Turing proved that once a programming language reaches a certain level of expressiveness, it is functionally interchangeable with all other such programming languages. What implications does this have for our choice (or lack of choice) between programming languages?"

    lesson name: "sorting"

    lesson name: "state_machines" # https://www.smashingmagazine.com/2018/01/rise-state-machines/
    lesson name: "big_o"
    lesson name: "parsing_and_grammars"

    lesson name: "oo",
         display_name: "Object-Oriented Design"

    lesson name: "Multitasking and Multithreading"
    lesson name: "Dependency Injection"
    lesson name: "Recursion & Re-entry"
    lesson name: "Abstractions"
    lesson name: "Dependencies" # explicit v implicit; global vs injected; language and framework *are* dependencies; don't test the library, test the connection; gems and npm and

  end
end

# https://twitter.com/joeerl/status/951357931559284736

