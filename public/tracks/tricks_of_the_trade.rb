require "track"

class Track
  TricksOfTheTrade = Track.new(
      name: "tricks_of_the_trade",
      description: "Secrets of the professional web dev!"
  ) do
    link href: "https://alistapart.com/article/aria-and-progressive-enhancement"
    link href: "https://hackernoon.com/how-i-landed-my-post-bootcamp-software-developer-job-in-just-seven-weeks-7b213c1bb867"

    lesson name: "best_practices"
    link href: "https://github.com/thoughtbot/guides/tree/master/best-practices"

    lesson name: "Typography and Web Fonts"
    link href: "http://thinkingwithtype.com/"

    lesson name: "building_character",
           description: 'Learn about character encodings, Unicode, emoji, escaping, and why curly quotes are horrible.' do
      link href: "https://imgs.xkcd.com/comics/the_history_of_unicode.png"
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


    lesson name: "Google-Driven Debugging" # how to google error messages
    lesson name: "Giving Feedback" # (on PRs, demos, etc)" # be specific, compassionate, actionable, "yes-and"

    lesson name: "code_reviews"
    link href: "https://github.com/thoughtbot/guides/tree/master/code-review"

    lesson name: "design_patterns"

    lesson name: "optimization" # and Big O


  end
end
