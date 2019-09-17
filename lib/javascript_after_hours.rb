require 'erector'
require 'views'

require 'util'
require 'track'
require 'tracks_table'

require 'site'
require 'nav_bar'

class JavascriptAfterHours < Site

  # base site has all tracks
  def hostname
    %w(
      javascript-after-hours.burlingtoncodeacademy.com
      javascript-after-hours
      js-intro.burlingtoncodeacademy.com
      js-intro
    )
  end

  def tracks
    [
        ::Track::JavascriptIntro,
    ]
  end

  def view
    View.new(site: self)
  end

  class View < Erector::Widget

    external :script, (<<-JS)
      window.addEventListener('DOMContentLoaded', (e) => {
        $(document).ready(function() {
          console.log('Hi from the collapse toggle!');
          $('#sidebar-javascript_intro-lessons').collapse('show');
        })
      })
    JS

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
                a "2019 JavaScript After Hours class",
                  href: "https://www.burlingtoncodeacademy.com/javascript-after-hours/"
                text "."
              }
            }
          }
          br
          div.card {
            iframe(
              src: "https://calendar.google.com/calendar/embed?height=600&wkst=1&bgcolor=%23ffffff&ctz=America%2FNew_York&src=M2w3Mmc5YWV0cXJsdWgycDhqc2lsY2NoZDBAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ&color=%23F09300&showTitle=1&title=JavaScript%20Part%20Time%20Fall%202019&showNav=1&showDate=1&showPrint=1&showTabs=1&showCalendars=0&mode=WEEK",
              style: 'border-width:0',
              width: '800',
              height: '600',
              frameborder: '0',
              scrolling: 'no'
            )
          }
        }
      }

    end
  end

  class NavBar < ::NavBar
    def logo klass: nil, style: nil
      a(href: 'http://www.burlingtoncodeacademy.com',
        class: 'navbar-brand') {
        img.logo(src: '/images/burlingtoncodeacademy-logo.png',
                 width: 265, height: 36,
                 alt: "Burlington Code Academy",
                 class: ['logo', klass].compact,
                 style: [style].compact)
      }
    end

    def nav_items
      nav_item name: "Bootcamp", href: "http://www.burlingtoncodeacademy.com/bootcamp/"
      nav_item name: "Hire Our Grads", href: "http://www.burlingtoncodeacademy.com/hiring-partners/"
      # nav_item name: "Events", href: "http://www.burlingtoncodeacademy.com/events/"
      # nav_item name: "Blog", href: "http://www.burlingtoncodeacademy.com/blog/"

      nav_item name: "Schedule", href: "/schedule"

      nav_item name: "Curriculum", dropdown: true do
        a(@site.display_name, class: 'dropdown-item', href: @site.href)
        @site.tracks.each do |track|
          if (track == ::Track::Separator)
            hr
          else

            a(class: ['dropdown-item', 'track-name'],
              href: track.href
            ) {
              i(class: "fas fa-angle-right")
              text nbsp
              text nbsp
              text track.display_name
            }
          end
        end


      end

      nav_item name: "Apply", href: "http://www.burlingtoncodeacademy.com/apply/", button: true
    end
  end

end
