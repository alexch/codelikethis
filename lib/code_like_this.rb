require 'erector'
require 'views'

require 'util'
require 'track'
require 'tracks_table'


# add "public/tracks" dir to Ruby load path
here = ::File.expand_path(File.dirname(__FILE__))
public_dir = ::File.expand_path(File.join(here, "..", "..", "public"))
tracks_dir = File.join(public_dir, "tracks")
$: << tracks_dir
# load every track before making the ordered list of all tracks
require_all(tracks_dir)

require 'active_support/core_ext'

class CodeLikeThis < Site
  def hostname
    ["codelikethis.com", "localhost"]
  end

  def tracks
    ::Track.constants.map {|c| Track.const_get(c)}.select {|t| (t.is_a? Track and t != Track::Separator)}
  end

  def view
    Home.new
  end

  class Home < Erector::Widget
    include Views

    def content
      div.row {
        br
        centered_codelikethis_logo
        br
      }

      div.row {
        div(class: 'col-sm') {
          div.card {
            div(class: 'card-body') {
              p(class: 'card-text') {
                b "Code Like This"
                text " is a repository of open-source lessons on software development maintained by "

                a "Alex Chaffee", href: "http://www.alexchaffee.com"
                text " and "
                a "Burlington Code Academy", href: "http://www.burlingtoncodeacademy.com"
                text "."
              }
              p(class: 'card-text') {
                text "We'll be updating it with all our new lectures, labs, and videos, so keep checking back!"
              }
            }
          }
          br
          div.card {
            div(class: 'card-body') {
              p(class: 'card-text') {
                h2 "What next?"
                ul {
                  li {
                    text "Peruse the "
                    i(class: 'fas fa-angle-double-left')
                    b "Tracks"
                    i(class: 'fas fa-angle-double-left')
                    text " in the sidebar"
                  }
                  li {
                    text "Browse the "
                    a "GitHub repository", href: "http://github.com/alexch/codelikethis"
                  }
                  li {
                    text "Learn more about our in-person "
                    a "2018 Web Development Bootcamp", href: "http://www.burlingtoncodeacademy.com/bootcamp/"
                  }
                  li {
                    text "See the full "
                    a "Web Development Bootcamp Curriculum", href: "http://bootcamp.burlingtoncodeacademy.com/"
                  }
                }
              }
            }
          }
        }
      }

    end
  end
end
