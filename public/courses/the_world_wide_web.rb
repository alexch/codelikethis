require "course"

require_relative '../../lib/link.rb'


class Course
  TheWorldWideWeb = Course.new(
      name: "the_world_wide_web",
      display_name: "The World Wide Web",
      abstract: "Invented by Tim Berners-Lee in 1990 and launched to the actual world in 1993, the WWW is still with us and for many is synonymous with the Internet. What is it? How does it work? How do we create web pages, style them, lay them out, and navigate between them?",
      links: [
          Link.new(href: "http://docs.railsbridge.org/frontend",
                   name: "RailsBridge Intro to Front End Web Dev"),
      ]
  ) do

    lesson name: "HTTP"
    lesson name: "Styled formatting with HTML"
    lesson name: "Styled formatting with CSS"
    lesson name: "Page layout with HTML and floats"
    lesson name: "Page layout with CSS"
    lesson name: "CSS Selectors"
    lesson name: "DOM Debugging"
    lesson name: "Page Layout with Bootstrap"
    lesson name: "Page Layout with CSS Flexbox"
    lesson name: "Page Layout with CSS Grid"
    lesson name: "Navigation"

  end
end
