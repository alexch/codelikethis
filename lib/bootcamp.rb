require 'erector'
require 'views'

require 'util'
require 'track'
require 'tracks_table'

require 'site'

class Bootcamp < Site

  # base site has all tracks
  def hostname
    ["bootcamp.burlingtoncodeacademy.com", "bootcamp"]
  end

  def tracks
    [
      ::Track::LearnToCodeWithJavascript,
      ::Track::Www,
      ::Track::ClientSideCoding,
      ::Track::Javascript, # "JavaScript Topics"
      ::Track::ServerSideJavascript,
      ::Track::Db,
      ::Track::React,

      ::Track::Separator,

      ::Track::Agile,
      ::Track::Git,
      ::Track::Cs,
      ::Track::Ux,
      ::Track::TricksOfTheTrade, # or "trade secrets" ?
      ::Track::Career,

    ]
  end

  def view
    View.new(site: self)
  end

  class View < Erector::Widget
    def content
      div.row {
        div(class: 'col-sm') {
          div.card {
            div(class: 'card-body') {
              p(class: 'card-text') {
                b "Burlington Code Academy"
                text " offers in-person coding classes in Burlington, Vermont."
              }
              p(class: 'card-text') {
                text "This site contains the curriculum for our "
                a "2018 Web Development Bootcamp", href: "http://www.burlingtoncodeacademy.com/bootcamp/"
                text "."
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
                    text " in the sidebar to see what we are teaching."
                  }
                  li {
                    text "Browse the "
                    a "GitHub repository", href: "http://github.com/alexch/codelikethis"
                    text "."
                  }
                  li {
                    text "Visit the central "
                    a "Code Like This", href: "http://codelikethis.com/"
                    text " site, with even more lessons."
                  }
                }
              }
            }
          }
        }
      }

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
