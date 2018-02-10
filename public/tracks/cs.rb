require "track"

class Track
  JustEnoughComputerScience = Track.new(
      name: "cs",
      display_name: "Just Enough Computer Science"
  ) do
    link href: "http://www.princeton.edu/~achaney/tmve/wiki100k/docs/Abstraction_(computer_science).html"

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

