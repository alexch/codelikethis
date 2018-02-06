require "track"

require_relative '../../lib/link.rb'


class Track
  TheWorldWideWeb = Track.new(
      name: "the_world_wide_web",
      display_name: "The World Wide Web",
      description: "Invented by Tim Berners-Lee in 1990 and launched to the actual world in 1993, the WWW is still with us and for many is synonymous with the Internet. What is it? How does it work? How do we create web pages, style them, lay them out, and navigate between them?",
  ) do

    link href: "http://docs.railsbridge.org/frontend",
         name: "RailsBridge Intro to Front End Web Dev"

    link href: "https://www.codecademy.com/tracks/web",
         name: "Codecademy HTML & CSS Track"

    lesson name: "HTTP"
    lesson name: "Styled formatting with HTML"
    lesson name: "Styled formatting with CSS" do
      link href: "https://meyerweb.com/eric/tools/css/reset/"

    end
    lesson name: "Page layout with HTML and floats"
    lesson name: "Page layout with CSS"
    lesson name: "CSS Selectors"
    lesson name: "DOM Debugging"

    link href: "http://docs.railsbridge.org/javascript-to-do-list/",
         name: "RailsBridge To Do List"
         # time: "3 hr"

    lesson name: "Page Layout with Bootstrap"
    lesson name: "Page Layout with CSS Flexbox" do
      link href: "https://medium.freecodecamp.org/learn-css-flexbox-in-5-minutes-b941f0affc34",
           name: "Learn CSS Flexbox in 5 Minutes"
    end
    lesson name: "Page Layout with CSS Grid" do
      video youtube_id: '7kVeCqQCxlk'
    end
    lesson name: "Navigation"

  end
end
