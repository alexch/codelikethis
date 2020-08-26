require "track"

require_relative '../../../lib/link.rb' # :-(

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

    link href: "http://validator.w3.org/"

    project from: 'FreeCodeCamp',
            name: 'Applied Responsive Web Design Projects'

    lesson name: "hello_html",
           display_name: "Hello, HTML World!"

    lesson name: 'anchors'

    lesson name: "http",
          display_name: "How the Web Works"

    lesson name: "urls",
           display_name: "URLs"

    lesson name: "html",
           display_name: "Introduction to HTML"

    lesson name: "html_structure",
           display_name: "Going Further With HTML"

    lab href: "https://learn.freecodecamp.org/responsive-web-design/basic-html-and-html5",
         name: "FreeCodeCamp 'Responsive Web Design - Basic HTML and HTML5'"

    lesson name: "html5",
           display_name: "Web Page Structure With HTML5"

    lesson name: "css",
           display_name: "Styling with CSS"

    lesson name: "dom_debugging",
           display_name: "DOM Debugging"

    lesson name: "dom_scripting"

    lesson name: "dom_scripting_labs"

    lesson name: "forms"

    lesson name: "embedding_media"

    link href: "http://docs.railsbridge.org/javascript-to-do-list/",
         name: "RailsBridge To Do List",
         description: "this is a paint-by-numbers lab where students use CSS and JavaScript to make a to do list; it uses jQuery not Vanilla DOM"

    project name: "portfolio_prettification",
      description: "now that you know how to use styles and layouts, gussy up your profile page"

    link name:"The Font Game", href: "http://ilovetypography.com/ifontgame/"
  end
end
