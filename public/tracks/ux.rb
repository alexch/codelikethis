require "track"

class Track
  UserExperience = Track.new(
    name: "ux",
    display_name: "User Experience"
  ) do

    lesson name: "The Design Of Everyday Things"
    lesson name: "Principles of Web Design" do
      link href: "https://shortiedesigns.com/2014/03/10-top-principles-effective-web-design/"
    end
    lesson name: "Information Architecture and Site Maps"
    lesson name: "Wireframes and Mockups"
    lesson name: "Agile Design"
    lesson name: "User Research" do
      link href: "http://info.carbonfive.com/user-research-guide"
    end
    lesson name: "Paper Prototypes"

    lesson name: "web_accessibility_and_aria" do
      link href: 'https://github.com/turingschool/front-end-curriculum/blob/gh-pages/lessons/module-1/aria-accessibility.md'
      link href: 'https://alistapart.com/article/aria-and-progressive-enhancement'
    end
    lab name: 'FreeCodeCamp "Responsive Web Design - Applied Accessibility"'

  end
end

# https://twitter.com/joeerl/status/951357931559284736

