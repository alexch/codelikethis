require 'erector'
require 'views'

require 'util'
require 'track'
require 'tracks_table'

# add "public/tracks" dir to Ruby load path
tracks_dir = ::File.expand_path(File.join(File.dirname(__FILE__), "..", "public", "tracks"))
$: << tracks_dir
# load every track before making the ordered list of all tracks
require_all(tracks_dir)


class Bootcamp < Site

  # base site has all tracks
  def hostname
    "bootcamp.burlingtoncodeacademy.com"
  end

  def host? hostname
    super or (hostname == "bootcamp")
  end

  def tracks
    [
      ::Track::LearnToCodeWithJavascript,
      ::Track::TheWorldWideWeb,
      ::Track::ClientSideCoding,
      ::Track::Javascript, # "JavaScript Topics"
      ::Track::ServerSideJavascript,
      ::Track::Db,
      ::Track::ClientSideCodingWithReact,

      ::Track::Separator,

      ::Track::Agile,
      ::Track::Git,
      ::Track::JustEnoughComputerScience,
      ::Track::UserExperience,
      ::Track::TricksOfTheTrade, # or "trade secrets" ?
      ::Track::Career,

    ]
  end

  def view
    View.new
  end

  class View < Erector::Widget
    def content
      text ""
    end

    def notice
      p.notice {
        text "This site is a "
        b "preview"
        text " of the curriculum for our "
        a "Summer 2018 bootcamp", href: "http://burlingtoncodeacademy.com/bootcamp"
        text " in Burlington, Vermont. "
        text "As we continue our preparation, courses and lessons will appear and disappear; we will rename, rearrange, clarify, and obfuscate as needed... "
        text "Please consider this a work in progress and keep checking in."
      }
    end
  end
end
