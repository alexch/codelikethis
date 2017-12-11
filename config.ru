require './app'
require 'coderay'
require 'rack/codehighlighter'
require 'rack/rewrite'

use Rack::ShowExceptions
use Rack::ShowStatus

# https://github.com/jtrupiano/rack-rewrite
use Rack::Rewrite do
  moved_permanently '/lessons/learn_to_code/learn_to_code', '/lessons/learn_to_code/intro'
end

use Rack::Codehighlighter, :coderay,
    :element => "pre>code",
    :markdown => true,
    :pattern => /\A[:@]{3}\s?(\w+)\s*(\n|&#x000A;)/i

run Rack::Cascade.new([
                        App,
                        Deck::RackApp.build([])
                      ])
