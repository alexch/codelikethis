require "course"

class Course
  JustEnoughComputerScience = Course.new(
      name: "cs",
      display_name: "Just Enough Computer Science"
  ) do
    link href: "http://www.princeton.edu/~achaney/tmve/wiki100k/docs/Abstraction_(computer_science).html"

    lesson name: "state_machines" # https://www.smashingmagazine.com/2018/01/rise-state-machines/
    lesson name: "big_o"
    lesson name: "parsing_grammars"

  end
end

# https://twitter.com/joeerl/status/951357931559284736

