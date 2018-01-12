require "course"

class Course
  JustEnoughComputerScience = Course.new(
      name: "cs",
      display_name: "Just Enough Computer Science"
  ) do
    lesson name: "state_machines" # https://www.smashingmagazine.com/2018/01/rise-state-machines/
    lesson name: "big_o"

  end
end

# https://twitter.com/joeerl/status/951357931559284736

