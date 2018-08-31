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

    lesson name: "intro",
           display_name: "Introductions and Requirements"

    lesson name: "hello_world",
           display_name: "Hello World!" do 
            topic name: "html"
            topic name: "element-structure"
            topic name: "developer-tools"
          end

    lesson name: "http",
          display_name: "How the Web Works" do 
            topic name: "browsers"
            topic name: "http"
            topic name: "request-response-cycle"
            topic name: "http-methods"
            topic name: "dns"
          end 

    lesson name: "urls",
           display_name: "URLs" do
            topic name: "urls"
            topic name: "protocols"
            topic name: "host"
            topic name: "path"
            topic name: "query-parameters"
      link href: "https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_is_a_URL",
           name: "MDN - URL components overview"
    end

    lesson name: "html",
           display_name: "Introduction to HTML" do
            topic name: "html"
            topic name: "element-tags"
            topic name: "element-structure"
            topic name: "style"
            topic name: "attributes"
            topic name: "layout"
            topic name: "html-elements"
          end

    lesson name: "html_structure",
           display_name: "Going Further With HTML" do
            topic name: "html"
            topic name: "element-tags"
            topic name: "commenting"
            topic name: "html-elements"
          end

    lab href: "https://learn.freecodecamp.org/responsive-web-design/basic-html-and-html5",
         name: "FreeCodeCamp 'Responsive Web Design - Basic HTML and HTML5'"

    lesson name: "html5",
           display_name: "Web Page Structure With HTML5" do
            topic name: "html"
            topic name: "element-structure"
            topic name: "element-tags"
            topic name: "html-elements"
      link href: "https://www.thoughtco.com/whats-new-in-html5-3467974",
           name: "What's new in HTML5?"
      link href: "http://diveintohtml5.info/"
    end

    lesson name: "css",
           display_name: "Styling with CSS" do
            topic name: "css"
            topic name: "styling"
            topic name: "inline-styling"
            topic name: "properties"
            topic name: "selectors"
            topic name: "compound-selectors"
            topic name: "pseudo-class-selectors"
            topic name: "html-linking"
            topic name: "html-elements"
            topic name: "element-box-model"
            topic name: "style-overrides"
      link href: "https://meyerweb.com/eric/tools/css/reset/"
      link href: "http://learnlayout.com/box-model.html"
    end

    lesson name: "layout_survey",
      display_name: "A Historical Survey of Web Layout" do
        topic name: "css-alignment"
        topic name: "css-flexbox"
        topic name: "css-grid"
        topic name: "bootstrap"
        topic name: "bootstrap-layout"
      end

    lesson name: "dom_debugging",
           display_name: "DOM Debugging" do
            topic name: "document-object-model" 
            topic name: "debugging"
            topic name: "browsers"
            topic name: "dom-manipulation"
          end

    lesson name: "dom_scripting" do 
      topic name: "document-object-model"
      topic name: "dom-manipulation"
      topic name: "script-tags"
      topic name: "document"
      topic name: "finding-elements"
      topic name: "dom-nodes"
      topic name: "html-elements"
      topic name: "events"
      topic name: "event-handlers"
      topic name: "callbacks"
    end

    lesson name: "forms" do
      topic name: "forms"
      topic name: "http-methods"
      topic name: "html-elements"
      topic name: "values"
      topic name: "event-handlers"
    end

    lesson name: "embedding_media" do 
      topic name: "embedding"
      topic name: "html-elements"
      topic name: "iframes"
      topic name: "hacking"
    end

    lab href: "https://learn.freecodecamp.org/responsive-web-design/basic-css",
        name: 'FreeCodeCamp "Responsive Web Design - Basic CSS"'

    link href: "http://docs.railsbridge.org/javascript-to-do-list/",
         name: "RailsBridge To Do List",
         description: "this is a paint-by-numbers lab where students use CSS and JavaScript to make a to do list; it uses jQuery not Vanilla DOM"

    project name: "portfolio_prettification",
      description: "now that you know how to use styles and layouts, gussy up your profile page"

  end
end
