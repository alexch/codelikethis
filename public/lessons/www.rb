require "track"

require_relative '../../lib/link.rb'


class Track
  Www = Track.new(
    name: "www",
    display_name: "The World Wide Web",
    description: "Invented by Tim Berners-Lee in 1990 and launched to the actual world in 1993, the WWW is still with us and for many is synonymous with the Internet. What is it? How does it work? How do we create web pages, style them, lay them out, and navigate between them?",
    ) do

    link href: "http://docs.railsbridge.org/frontend",
         name: "RailsBridge Intro to Front End Web Dev"

    link href: "https://www.codecademy.com/tracks/web",
         name: "Codecademy HTML & CSS Track"

    project name: 'FreeCodeCamp "Applied Responsive Web Design Projects"'

    lesson name: "intro",
            display_name: "Introductions and Requirements"

    lesson name: "hello-world",
            display_name: "Hello World!"

    lesson name: "http",
            display_name: "How the Web Works"

    lesson name: "html",
           display_name: "Styling with HTML"

    lab name: 'FreeCodeCamp "Responsive Web Design - Basic HTML and HTML5"'

    lesson name: "css",
           display_name: "Styling with CSS" do
      link href: "https://meyerweb.com/eric/tools/css/reset/"
    end
    lab name: 'FreeCodeCamp "Responsive Web Design - Basic CSS"'

    lesson name: "forms" do
      link href: "https://www.theodinproject.com/courses/html5-and-css3/lessons/html-forms"
    end

    lesson name: "css_box_model" do
      link href: "https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Box_Model/Introduction_to_the_CSS_box_model"
    end
    lesson name: "css_layout"
    lesson name: "CSS Selectors"
    lesson name: "DOM Debugging"

    link href: "http://docs.railsbridge.org/javascript-to-do-list/",
         name: "RailsBridge To Do List"
    # time: "3 hr"

    lesson name: "html5" do
      link href: "https://www.thoughtco.com/whats-new-in-html5-3467974",
           name: "What's new in HTML5?"
      link href: "http://diveintohtml5.info/"
    end

    lesson name: "css_frameworks" do
      link href: "https://blog.webkid.io/css-frameworks-bootstrap-alternatives/"
    end
    lesson name: "responsive_layouts"
    lab name: 'FreeCodeCamp "Responsive Web Design"'
    lesson name: "bootstrap",
           display_name: "Page Layout with Bootstrap"
    lab name: 'FreeCodeCamp "Front End Libraries - Bootstrap"'

    lesson name: "Page Layout with CSS Flexbox" do
      link href: "https://medium.freecodecamp.org/learn-css-flexbox-in-5-minutes-b941f0affc34",
           name: "Learn CSS Flexbox in 5 Minutes"
    end
    lesson name: "Page Layout with CSS Grid" do
      video youtube_id: '7kVeCqQCxlk'
    end

    lab name: 'FreeCodeCamp "Responsive Web Design - Applied Visual Design"'

    lesson name: "navigation", description: 'Nav bars, site maps, anchors...'
    lesson name: "embedding", description: 'how to use Web APIs and embedded widgets to serve maps, videos, surveys, and other content from around the Web inside your own sites' do
      link href: "https://www.theodinproject.com/courses/html5-and-css3/lessons/embedding-images-and-video"
    end

  end
end
