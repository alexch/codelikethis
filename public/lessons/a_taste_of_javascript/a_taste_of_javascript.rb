require "track"

require_relative '../../../lib/link.rb' # :-(

Track::ATasteOfJavascript = Track.new(
    name: 'a_taste_of_javascript',
    description: "JavaScript is the language of the web and is growing ever more important in the world of software. In this introductory workshop you will use JavaScript, HTML, and CSS to deploy a small application from your laptop to the cloud using the command line, Node.js, Heroku, and Github."
) do
  lesson name: "a_taste_of_javascript"
  lesson name: "web_apps_and_the_cloud"
  lesson name: "/server_side_javascript/hello_express"
  lesson name: "what_next"
end
