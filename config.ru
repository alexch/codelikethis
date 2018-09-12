require './app'
require 'coderay'
require 'rack/codehighlighter'
require 'rack/rewrite'

use Rack::ShowExceptions
use Rack::ShowStatus

# todo: look into using Refractor for these redirects

# https://github.com/jtrupiano/rack-rewrite
use Rack::Rewrite do
  moved_permanently '/lessons/', '/lessons'
  moved_permanently '/projects/', '/projects'
  moved_permanently '/topics/', '/topics'

  moved_permanently '/lessons/learn_to_code/learn_to_code', '/lessons/learn_to_code/intro'
  moved_permanently '/lessons/ruby_advanced/intro', '/lessons/ruby/ruby_for_programmers'
  moved_permanently '/lessons/ruby/intro', '/lessons/ruby/ruby_for_programmers'
  moved_permanently '/lessons/javascript/dom', '/lessons/client_side_coding/dom'
  moved_permanently '/lessons/javascript/jquery', '/lessons/client_side_coding/jquery'
  moved_permanently '/lessons/javascript/ajax', '/lessons/client_side_coding/ajax'

  moved_permanently '/lessons/test_driven/test_driven',
    '/lessons/agile_development/test_driven'

  # renamed tracks
  {
    ruby_advanced: 'ruby',
    agile_development: 'agile',
    the_world_wide_web: 'www',
  }.each_pair do |old_name, new_name|
    moved_permanently %r{/lessons/#{old_name}(/\w*)?}, "/lessons/#{new_name}$1"
  end
end

use Rack::Codehighlighter, :coderay,
    :element => "pre>code",
    :markdown => true,
    :pattern => /\A[:@]{3}\s?(\w+)\s*(\n|&#x000A;)/i

run Rack::Cascade.new([
                        App,
                        Deck::RackApp.build([])
                      ])
