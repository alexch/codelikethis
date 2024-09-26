require "track"

class Track < Thing
  TricksOfTheTrade = Track.new(
      name: "tricks_of_the_trade",
      description: "Secrets of the professional web dev!"
  ) do
    link href: "https://hackernoon.com/how-i-landed-my-post-bootcamp-software-developer-job-in-just-seven-weeks-7b213c1bb867"

    # Programming
    lesson name: "debugging" do
      link name: "What went wrong? [MDN]",
           href: "https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/What_went_wrong"
      link href: "https://m.xkcd.com/627/", name: "Tech Support Cheat Sheet (xkcd)"
      link name: "on technical sophistication",
           href: "https://www.learnenough.com/command-line-tutorial #aside-technical_sophistication"
    end

    lesson name: "modern_debugging"

    lesson name: "how_to_demo" do
      link href: "https://firstround.com/review/Your-Product-Demos-Suck-Because-Theyre-Focused-on-Your-Product/"
    end

  end
end
