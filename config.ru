require './app'
require 'rack/rewrite'

use Rack::ShowExceptions
use Rack::ShowStatus

# https://github.com/jtrupiano/rack-rewrite
use Rack::Rewrite do

  moved_permanently %r{^/(.*)/+$}, '/$1' # always remove trailing /

  moved_permanently %r{^(/lessons/learn[_-]to[_-]code[_-]with[_-]javascript)(/.*)?$}, (lambda do |match, env|
    "/lessons/javascript#{match[2] && match[2].gsub(/_+/, '-')}"
  end)

  # replace underscores with dashes...
  moved_permanently %r{^.*_.*$}, (lambda do |match, env|
    match[0].gsub(/_+/, '-')
  end), :if => (lambda do |rack_env|
    # ...except for media file requests
    rack_env["REQUEST_PATH"] !~ /\.(jpg|jpeg|gif|png|svg|js|css|html|mp4|wav|mp3)$/
  end)

  moved_permanently '/lessons/learn_to_code/learn_to_code', '/lessons/learn_to_code/intro'
  moved_permanently '/lessons/ruby_advanced/intro', '/lessons/ruby/ruby_for_programmers'
  moved_permanently '/lessons/ruby/intro', '/lessons/ruby/ruby_for_programmers'
  moved_permanently '/lessons/javascript/dom', '/lessons/client_side_coding/dom'
  moved_permanently '/lessons/javascript/jquery', '/lessons/client_side_coding/jquery'
  moved_permanently '/lessons/javascript/ajax', '/lessons/client_side_coding/ajax'
  moved_permanently '/lessons/javascript/filter-functions', '/lessons/javascript/iteration-methods'
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

run Rack::Cascade.new([
                          App,
                          Deck::RackApp.build([]) # so support files from the deckrb gem get served too
                      ])
