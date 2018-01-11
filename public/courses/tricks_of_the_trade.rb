require "course"

class Course
  TricksOfTheTrade = Course.new(
      name: "tricks_of_the_trade",
      abstract: "Secrets of the professional web dev!",
      goals: [# "the student will learn..."
      ],
      links: [
          Link.new(href: "https://alistapart.com/article/aria-and-progressive-enhancement"),
          Link.new(href: "https://hackernoon.com/how-i-landed-my-post-bootcamp-software-developer-job-in-just-seven-weeks-7b213c1bb867")
      ]
  ) do
    lesson "Web Fonts"
    lesson "Responsive Layouts"
    lesson "Accessibility and ARIA"
    lesson "site_maps" # XML file, also link to information architecture and site maps lesson
    lesson "Clip art"
    lesson "SEO"
    lesson "User upload: server storage"
    lesson "User upload: cloud storage"
    lesson "Authentication" # roll your own login
    lesson "Security"
    lesson "Google-Driven Debugging" # how to google error messages
    lesson "Giving Feedback (on PRs, demos, etc)" # be specific, compassionate, actionable, "yes-and"
    lesson "optimization" # and Big O
  end
end
