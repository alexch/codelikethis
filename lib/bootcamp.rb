require 'erector'
require 'views'

require 'util'
require 'track'
require 'tracks_table'

require 'site'
require 'nav_bar'

class Bootcamp < Site

  # base site has all tracks
  def hostname
    ["bootcamp.burlingtoncodeacademy.com", "bootcamp", "localhost"]
  end

  def google_calendar_id
    'YnVybGluZ3RvbmNvZGVhY2FkZW15LmNvbV9hazFxMDRvNzBwYXBqODJkb2ZsYXVnMGM1c0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29t'
  end

  def tracks
    [
      ::Track::Javascript,
      ::Track::Www,
      ::Track::ResponsiveLayout,
      ::Track::ClientSideCoding,
      ::Track::Bootstrap,
      ::Track::ServerSideJavascript,
      ::Track::Oo,
      ::Track::Db,
      ::Track::React,

      ::Track::Separator,

      ::Track::Prerequisites,
      ::Track::Agile,
      ::Track::Git,
      ::Track::TricksOfTheTrade, # or "trade secrets" ?
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
                a "Spring 2020 JavaScript Software Development Bootcamp",
                  href: "https://www.burlingtoncodeacademy.com/software-development-bootcamp/"
                text "."
              }
              p(class: 'card-text') {
                text "Common answers and explanations are in the "
                a "References section",
                  href: "https://bootcamp.burlingtoncodeacademy.com/references/"
                text "."
              }
              p(class: 'card-text') {
                text "The course projects are in the "
                a "Project Section",
                  href: "https://bootcamp.burlingtoncodeacademy.com/projects/"
                text "."
              }
            }
          }
          br
          div.card {
            iframe(
              src: "https://calendar.google.com/calendar/embed?height=600&wkst=1&bgcolor=%23ffffff&ctz=America%2FNew_York&src=YnVybGluZ3RvbmNvZGVhY2FkZW15LmNvbV9hazFxMDRvNzBwYXBqODJkb2ZsYXVnMGM1c0Bncm91cC5jYWxlbmRhci5nb29nbGUuY29t&src=M2w3Mmc5YWV0cXJsdWgycDhqc2lsY2NoZDBAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ&color=%23009688&color=%23F09300&showTabs=1&showCalendars=1&mode=WEEK&title=Spring%202020%20Software%20Development%20Bootcamp",
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
      a(href: '/',
        class: 'navbar-brand') {
        img.logo(src: '/images/burlingtoncodeacademy-logo.png',
                 width: 265, height: 36,
                 alt: "Burlington Code Academy",
                 class: ['logo', klass].compact,
                 style: [style].compact)
      }
    end

    def nav_items
      nav_item name: 'Home', href: 'https://www.burlingtoncodeacademy.com/'
      nav_item name: 'Bootcamp', href: 'https://www.burlingtoncodeacademy.com/software-development-bootcamp/'
      nav_item name: 'Events', href: 'http://www.burlingtoncodeacademy.com/events/'
      nav_item name: 'Blog', href: 'http://www.burlingtoncodeacademy.com/blog/'
      nav_item name: 'Apply',
               href: 'http://www.burlingtoncodeacademy.com/apply/',
               button: true
    end
  end
end
