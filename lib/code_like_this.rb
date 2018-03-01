require 'active_support/core_ext'
require 'erector'

require 'views'
require 'util'
require 'track'
require 'tracks_table'
require 'site'
require 'nav_bar'

class CodeLikeThis < Site
  def hostname
    ["codelikethis.com", "localhost"]
  end

  def tracks
    # load every track before making the ordered list of all tracks
    require_all(Track.tracks_dir)
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
                text " is a repository of open-source lessons on software development, created and maintained by "

                a "Alex Chaffee", href: "http://www.alexchaffee.com"
                text " and "
                a "Burlington Code Academy", href: "http://www.burlingtoncodeacademy.com"
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

  class NavBar < ::NavBar
    needs :site

    def logo klass: nil, style: nil
      a(href: '/',
        class: 'navbar-brand') {
        img.logo(src: '/images/codelikethis-logo.png',
                 width: 265, height: 36,
                 alt: "Code Like This",
                 class: ['logo', klass].compact,
                 style: [style].compact)
      }
    end

    def nav_items
      nav_item name: "Lessons", href: "/lessons"
      nav_item name: "Bootcamp", href: "http://www.burlingtoncodeacademy.com/bootcamp/"
      nav_item name: "Blog", href: "http://www.burlingtoncodeacademy.com/blog/"
    end
  end

end
