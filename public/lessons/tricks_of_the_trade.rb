require "track"

class Track < Thing
  TricksOfTheTrade = Track.new(
      name: "tricks_of_the_trade",
      description: "Secrets of the professional web dev!"
  ) do
    link href: "https://alistapart.com/article/aria-and-progressive-enhancement"
    link href: "https://hackernoon.com/how-i-landed-my-post-bootcamp-software-developer-job-in-just-seven-weeks-7b213c1bb867"

    lesson name: "debugging" do
      link href: "https://m.xkcd.com/627/", name: "Tech Support Cheat Sheet (xkcd)"
      link href: "https://www.learnenough.com/command-line-tutorial#aside-technical_sophistication"
    end
    lesson name: "Google-Driven Debugging" # how to google error messages

    lesson name: "best_practices" do
      link href: "https://github.com/thoughtbot/guides/tree/master/best-practices"
    end
    lesson name: "design_patterns"

    lesson name: "optimization" # and Big O

    lesson name: "building_character",
           description: 'Learn about character encodings, Unicode, emoji, escaping, and why curly quotes are horrible.' do
      link href: "https://imgs.xkcd.com/comics/the_history_of_unicode.png"
    end
    lesson name: "typography" do
      link href: "http://thinkingwithtype.com/"
    end

    lesson name: "Giving Feedback" # (on PRs, demos, etc)" # be specific, compassionate, actionable, "yes-and"

    lesson name: "code_reviews" do
      link href: "https://github.com/thoughtbot/guides/tree/master/code-review"
      link href: "https://medium.freecodecamp.org/unlearning-toxic-behaviors-in-a-code-review-culture-b7c295452a3c"
    end

    lesson name: "site_maps" # XML file, also link to information architecture and site maps lesson
    lesson name: "Clip art"
    lesson name: "SEO"
    lesson name: "User upload: server storage"
    lesson name: "User upload: cloud storage"

    lesson name: "web_security" do
      link href: "https://medium.com/@keeayluh/the-fundamentals-of-information-security-eb13876a06db"
      link href: "https://medium.freecodecamp.org/360-million-reasons-to-destroy-all-passwords-9a100b2b5001"
    end
    lesson name: "Authentication" # roll your own login
    lesson name: "oauth"


    lesson name: "time_management" do
      link href: "https://www.infoq.com/articles/queues-enemy-of-flow"
    end
  end
end
