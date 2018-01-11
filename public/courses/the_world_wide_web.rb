require "course"

require_relative '../../lib/link.rb'


class Course
  TheWorldWideWeb = Course.new(
      name: "the_world_wide_web",
      display_name: "The World Wide Web",
      abstract: "Invented by Tim Berners-Lee in 1990 and launched to the actual world in 1993, the WWW is still with us and for many is synonymous with the Internet. What is it? How does it work? How do we create web pages, style them, lay them out, and navigate between them?",
      goals: [ # "the student will learn..."
      ],
      links: [
          Link.new(href: "http://docs.railsbridge.org/frontend",
                   name: "RailsBridge Intro to Front End Web Dev"),
      ]
  ) do

    lesson "HTTP"
    lesson "Styled formatting with HTML"
    lesson "Styled formatting with CSS"
    lesson "Page layout with HTML and floats"
    lesson "Page layout with CSS"
    lesson "CSS Selectors"
    lesson "DOM Debugging"
    lesson "Page Layout with Bootstrap"
    lesson "Page Layout with CSS Flexbox"
    lesson "Page Layout with CSS Grid"
    lesson "Navigation"

  end
end
