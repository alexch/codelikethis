require 'erector'
require 'awesome_print'

class NavBar < Erector::Widget

  needs :site

  def content
    nav(class: 'navbar navbar-expand-md fixed-top navbar-light') {
      div(class: 'container') {
        div(class: 'col navbar-left') {
          logo
        }

        # # hamburger button for top navbar
        button(class: 'navbar-toggler navbar-right navbar-toggler-right border-0',
               type: 'button',
               'data-toggle' => 'collapse',
               'data-target' => '#pageNavbar',
               'aria-controls' => 'navbarsExampleDefault',
               'aria-expanded' => 'false',
               'aria-label' => 'Toggle navigation') {
          span class: 'navbar-toggler-icon'
        }

        div(class: 'col collapse navbar-collapse navbar-right', id: 'pageNavbar') {
          ul(class: 'navbar-nav ml-auto align-items-center') {
            # nav_item name: "Home", href: "http://www.burlingtoncodeacademy.com/"

            nav_item name: "Bootcamp", href: "http://www.burlingtoncodeacademy.com/bootcamp/"
            nav_item name: "Hire Our Grads", href: "http://www.burlingtoncodeacademy.com/hiring-partners/"
            nav_item name: "Events", href: "http://www.burlingtoncodeacademy.com/events/"
            nav_item name: "Blog", href: "http://www.burlingtoncodeacademy.com/blog/"
            nav_item name: "Apply Now", href: "http://www.burlingtoncodeacademy.com/apply/", button: true

            nav_item name: "Curriculum", href: "/"
          }
        }
      }
      # }
    }
  end

  # render a single nav item (an `li` with class `nav-item`)
  def nav_item name: 'Item', href: '#', active: false, disabled: false, bordered: false, button: false
    li_css_classes = ['nav-item',
                      ('active' if active),
                      ('disabled' if disabled),
                      ('bordered' if bordered),
    ]
    li class: li_css_classes do
      a class: ['nav-link', ('btn btn-primary btn-sm' if button)],
        href: href do
        text name
        if active
          # be nice to the visually impaired
          span class: 'sr-only' do
            text '(current)'
          end
        end
      end
    end
  end

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


end
