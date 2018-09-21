require "track"

class Track
  Agile = Track.new(
      name: "agile",
      display_name: "Agile Development",
      description: "The term 'Agile' describes many many software development methodologies: systems for designing, developing, and deploying products, and organizing the teams of people that do so in a way that respects their humanity and creativity. What makes a system Agile? What techniques can we use to increase communication, feedback, simplicity, reliability, and transparency? What if my pair programming partner has bad breath? Take this course to find out."
    ) do

    lesson name: "what_is_agile" do
      link href: "https://www.slideshare.net/RyanLockard/secrets-from-the-agile-manifesto-authors-on-flow"
    end

    lesson name: "cadence",
      description: "'Cadence' refers to the pace, rhythm, and recurring themes of a march or other piece of music. The cadence of an Agile team revolves around its schedule of meetings, large and small. Daily standups, weekly demos, monthly retrospectives... all contribute to (or detract from!) the team's communication, feedback, and cohesion."

    lesson name: "retrospectives"

    link href: 'https://medium.freecodecamp.org/want-to-be-a-developer-you-should-probably-be-pair-programming-2c6ec12c4866'

    lesson name: "refactoring", description: "Refactoring is the process of restructuring existing computer code -- changing its factoring -- without changing its behavior. You probably knew that. But did you know it's also a meditation technique? Improve your practice of mindful coding with this light overview to the Zen of Refactoring."

    lesson name: "pair_programming"

    lesson name: "test_driven" do
      video youtube_id: "tFwAailXjeA"
      video youtube_id: "mzcBfUu15RU"
    end

    lesson name: "inceptions" do
      link href: "https://martinfowler.com/articles/lean-inception/"
    end
    lesson name: "planning" #  Agile Planning: Build, Measure, Predict, Repeat

    lesson name: "flavors" # agile flavors (methodologies): Scrum, XP, Kanban, Lean

    lesson name: "lean_product_design" # based on The Lean Startup
    lesson name: "scrum"
    lesson name: "kanban"
    lesson name: "extreme_programming_xp"


    lesson name: "flow_and_maker_time" do
      link href: 'https://www.ted.com/talks/mihaly_csikszentmihalyi_on_flow'
      link href: 'http://www.paulgraham.com/makersschedule.html'
    end
  end
end
