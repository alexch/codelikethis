require "track"

require_relative '../../../lib/link.rb'

Track::Prerequisites = Track.new(
  name: "prerequisites",
  display_name: "Prerequisites",
  description: "Lessons and exercises to complete before the first day of class.") do

  link href: "https://learn.freecodecamp.org/responsive-web-design/basic-html-and-html5",
       name: "FreeCodeCamp Basic HTML and HTML5"

  link href: "https://learn.freecodecamp.org/responsive-web-design/basic-css",
       name: "FreeCodeCamp Basic CSS"

  project name: "what_the_regex"
end
