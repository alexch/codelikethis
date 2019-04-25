require "track"

require_relative '../../../lib/link.rb' # :-(

Track::ATasteOfJavascript = Track.new(

                                     name: 'a_taste_of_javascript',
) do
  lesson name: "a_taste_of_javascript"
  lesson name: "web_apps_and_the_cloud"
  lesson name: "/server_side_javascript/hello_express"
  lesson name: "what_next"

end
