require "erector"

class Home < Erector::Widget
  def self.display_name; 'Home' end
  def self.href; '/' end
end

class Breadcrumbs < Erector::Widget
  external :style, <<-CSS
.breadcrumbs {
  display: block;
  font-size: 1rem;
  font-weight: 500;
  font-family: 'Helvetica Neue', Helvetica, Arial, Sans;
  margin: 1em 0 .5em;
}
.breadcrumbs a {
  text-decoration: none;
}
.breadcrumbs .breadcrumb-item.active {
  font-weight: bold;
}
  CSS

  needs :parents => []
  needs :display_name

  def content
    # http://getbootstrap.com/docs/4.0/components/breadcrumb/
    nav(class: 'breadcrumbs', role: 'menubar', 'aria-label': 'breadcrumb') {
      ol.breadcrumb {
        @parents
          .unshift(::Home)
          .each do |parent|
            li(class: 'breadcrumb-item') {
              if parent.respond_to? :link_view
                widget parent.link_view
              else
                a parent.display_name, href: parent.href
              end
            }
          end
          li(class: 'breadcrumb-item active') {
            text @display_name
          }
        }
      }
  end
end
