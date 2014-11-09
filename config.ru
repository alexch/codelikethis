require './app'
require 'coderay'
require 'rack/codehighlighter'

use Rack::ShowExceptions
use Rack::ShowStatus
use Rack::Codehighlighter, :coderay,
    :element => "pre>code",
    :markdown => true,
    :pattern => /\A[:@]{3}\s?(\w+)\s*(\n|&#x000A;)/i

run Rack::Cascade.new([
                        App,
                        Deck::RackApp.build([])
                      ])
