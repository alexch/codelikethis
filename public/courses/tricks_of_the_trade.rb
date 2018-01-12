require "course"

class Course
  TricksOfTheTrade = Course.new(
      name: "tricks_of_the_trade",
      abstract: "Secrets of the professional web dev!",
      links: [
          Link.new(href: "https://alistapart.com/article/aria-and-progressive-enhancement"),
          Link.new(href: "https://hackernoon.com/how-i-landed-my-post-bootcamp-software-developer-job-in-just-seven-weeks-7b213c1bb867")
      ]
  ) do
    lesson name: "Web Fonts"
    lesson name: "Responsive Layouts"
    lesson name: "Accessibility and ARIA"
    lesson name: "site_maps" # XML file, also link to information architecture and site maps lesson
    lesson name: "Clip art"
    lesson name: "SEO"
    lesson name: "User upload: server storage"
    lesson name: "User upload: cloud storage"
    lesson name: "Authentication" # roll your own login
    lesson name: "Security"
    lesson name: "Google-Driven Debugging" # how to google error messages
    lesson name: "Giving Feedback" # (on PRs, demos, etc)" # be specific, compassionate, actionable, "yes-and"
    lesson name: "optimization" # and Big O
  end
end
