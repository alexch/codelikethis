require "track"

class Track
  Agile = Track.new(
      name: "agile",
      description: "The term 'Agile' describes many many software development methodologies: systems for designing, developing, and deploying products, and organizing the teams of people that do so in a way that respects their humanity and creativity. What makes a system Agile? What techniques can we use to increase communication, feedback, simplicity, reliability, and transparency? Take this course to find out."
    ) do

    lesson name: "what_is_agile" do
      link href: "https://www.slideshare.net/RyanLockard/secrets-from-the-agile-manifesto-authors-on-flow"
    end

    lesson name: "test_driven" do
      video youtube_id: "tFwAailXjeA"
      video youtube_id: "mzcBfUu15RU"
    end

    lesson name: "refactoring", description: "Refactoring is the process of restructuring existing computer code -- changing its factoring -- without changing its behavior. You probably knew that. But did you know it's also a meditation technique? Improve your practice of mindful coding with this light overview to the Zen of Refactoring."
    lesson name: "inceptions" do
      link href: "https://martinfowler.com/articles/lean-inception/"
    end
    lesson name: "planning" #  Agile Planning: Build, Measure, Predict, Repeat

    lesson name: "lean_product_design" # based on The Lean Startup
    lesson name: "scrum"
    lesson name: "extreme_programming_xp"
    lesson name: "flow_and_maker_time" # https://www.ted.com/talks/mihaly_csikszentmihalyi_on_flow
    # http://www.paulgraham.com/makersschedule.html
  end
end
