require "track"

require_relative '../../../lib/link.rb'

Track::Prerequisites = Track.new(
  name: "prerequisites",
  display_name: "Prerequisites",
  description: "Lessons and exercises to complete before the first day of class.") do

  project name: "fcc_basic_html",
          display_name: "FreeCodeCamp Basic HTML"

  project name: "fcc_basic_css",
          display_name: "FreeCodeCamp Basic CSS"

  project name: "what_the_regex",
          display_name: "What the RegEx"
end
