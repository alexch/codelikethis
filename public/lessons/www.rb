require "track"

require_relative '../../lib/link.rb'

class Track
  Www = Track.new(
    name: "www",
    display_name: "The World Wide Web",
    description: "Invented by Tim Berners-Lee in 1990 and launched to the actual world in 1993, the WWW is still with us and for many is synonymous with the Internet. What is it? How does it work? How do we create web pages, style them up, lay them out, and navigate between them?",
    ) do

    link href: "http://docs.railsbridge.org/frontend",
         name: "RailsBridge Intro to Front End Web Dev"

    link href: "https://www.codecademy.com/tracks/web",
         name: "Codecademy HTML & CSS Track"

    project from: 'fcc',
            name: 'Applied Responsive Web Design Projects'

    lesson name: "intro",
           display_name: "Introductions and Requirements"

    lesson name: "hello_world",
           display_name: "Hello World!"

    lesson name: "http",
           display_name: "How the Web Works"

    lesson name: "html",
           display_name: "Introduction to HTML"

    lesson name: "html_structure",
           display_name: "Going Further With HTML"
    lab name: 'FreeCodeCamp "Responsive Web Design - Basic HTML and HTML5"'

    lesson name: "html5", 
           display_name: "Web Page Structure With HTML5" do
      link href: "https://www.thoughtco.com/whats-new-in-html5-3467974",
           name: "What's new in HTML5?"
      link href: "http://diveintohtml5.info/"
    end

    lesson name: "css",
           display_name: "Styling with CSS" do
      link href: "https://meyerweb.com/eric/tools/css/reset/"
    end

    lesson name: "css_layout",
           display_name: "Page Layout With CSS" do
      link href: "https://www.w3schools.com/css/exercise.asp?filename=exercise_positioning1",
           name: "W3Schools Positioning Exercise"
    end

    lesson name: "responsive_development",
           display_name: "Introduction to Responsive Development" do
      link href: "https://www.w3schools.com/html/html_responsive.asp",
           name: "W3Schools Responsive HTML Development"
    end

    lesson name: 'css_flexbox',
           display_name: "Page Layout with CSS Flexbox" do
      link href: "https://medium.freecodecamp.org/learn-css-flexbox-in-5-minutes-b941f0affc34",
           name: "Learn CSS Flexbox in 5 Minutes"
      link href: "https://css-tricks.com/snippets/css/a-guide-to-flexbox"
      link href: "https://flexboxfroggy.com",
           name: "Flexbox Froggy",
           description: "a step-by-step test-driven game that teaches you flexbox"
    end

    lesson name: "dom_debugging",
           display_name: "DOM Debugging"

    lab name: 'FreeCodeCamp "Responsive Web Design - Basic CSS"'

    link href: "http://docs.railsbridge.org/javascript-to-do-list/",
         name: "RailsBridge To Do List"
    # time: "3 hr"


    lesson name: "forms" do
      link href: "https://www.theodinproject.com/courses/html5-and-css3/lessons/html-forms"
    end


    lesson name: "css_frameworks" do
      link href: "https://blog.webkid.io/css-frameworks-bootstrap-alternatives/"
    end

    lesson name: "responsive_layout"
    lab name: 'FreeCodeCamp "Responsive Web Design"'

    lesson name: "bootstrap_intro" do
      link href: "https://blog.webkid.io/css-frameworks-bootstrap-alternatives/"
    end

    lesson name: "bootstrap_layout",
           display_name: "Page Layout with Bootstrap"
    lab name: 'FreeCodeCamp "Front End Libraries - Bootstrap"'


    lesson name: "page_layout_with_css_grid",
           display_name: "Page Layout with CSS Grid" do
      video youtube_id: '7kVeCqQCxlk'
      link href: "https://cssgridgarden.com",
           name: "Grid Garden",
           description: "a step-by-step game that teaches you CSS Grid"
    end

    lesson name: "responsive_layouts",
           display_name: "Web Design and Responsive Development"
    lab name: 'FreeCodeCamp "Responsive Web Design - Applied Visual Design"'

    lesson name: "navigation", description: "Nav bars, site maps, anchors, Bootstrap's responsive nav bar... [move to UX track?]"

    lesson name: "bootstrap_components", description: "buttons and accordions and such [move to UX track?]"

    project name: "pretty_profile", description: "now that you know how to use styles and layouts, gussy up your profile page"

    lesson name: "embedding",
           description: 'how to use Web APIs and embedded widgets to serve maps, videos, surveys, and other content from around the Web inside your own sites' do
      link href: "https://www.theodinproject.com/courses/html5-and-css3/lessons/embedding-images-and-video"
    end

  end
end
