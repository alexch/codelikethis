require_relative('util')
require_relative('track')

# add "public/tracks" dir to Ruby load path
here = ::File.expand_path(File.dirname(__FILE__))
public_dir = ::File.expand_path(File.join(here, "..", "public"))
tracks_dir = File.join(public_dir, "tracks")
$: << tracks_dir
# load every track before making the ordered list of all tracks
require_all(tracks_dir)

class Tracks
  ALL = [
      ::Track::Agile,

      ::Track::Separator,

      ::Track::LearnToCodeWithJavascript,
      ::Track::HelloNode,
      ::Track::TheWorldWideWeb,
      ::Track::ClientSideCoding,
      ::Track::Javascript, # "JavaScript Topics"
      ::Track::ServerSideJavascript,
      ::Track::Db,
      ::Track::ClientSideCodingWithReact,

      ::Track::Separator,

      ::Track::Git,
      ::Track::JustEnoughComputerScience,
      ::Track::UserExperience,
      ::Track::TricksOfTheTrade, # or "trade secrets" ?
      ::Track::Career,

      ::Track::Separator,

      ::Track::LearnToCode, # in Ruby
      ::Track::RubyTools,
      ::Track::RubyBasics,
      ::Track::RubyBlocks,
      ::Track::RubyObjects,
      ::Track::Ruby, # "Ruby Topics"


  ]
end
