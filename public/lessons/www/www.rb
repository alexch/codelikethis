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

    project from: 'FreeCodeCamp',
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

    lesson name: "dom_debugging",
           display_name: "DOM Debugging"

    lesson name: "dom_scripting"


    lab name: 'FreeCodeCamp "Responsive Web Design - Basic CSS"'

    link href: "http://docs.railsbridge.org/javascript-to-do-list/",
         name: "RailsBridge To Do List",
         description: "this is a paint-by-numbers lab where students use CSS and JavaScript to make a to do list; it uses jQuery not Vanilla DOM"

    lesson name: "forms" do
      link href: "https://www.theodinproject.com/courses/html5-and-css3/lessons/html-forms",
      description: "this is actually a fairly advanced lab that asks you to create and style a login form like Mint.com's. It should be moved to a project, and we should have a lesson on basic FORM element creation and use."
    end

    lesson name: "embedding",
           description: 'how to use Web APIs and embedded widgets to serve maps, videos, surveys, and other content from around the Web inside your own sites' do
      link href: "https://www.theodinproject.com/courses/html5-and-css3/lessons/embedding-images-and-video"
    end

  end
end