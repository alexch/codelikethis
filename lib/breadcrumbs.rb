require "erector"

class Breadcrumbs < Erector::Widget
  external :style, <<-CSS
.breadcrumbs {
  display: block;
  font-size: 1.5em;
  font-weight: bold;
  font-family: 'Helvetica Neue', Helvetica, Arial, Sans;

  margin: .5em 0 1em -1em;
}
.breadcrumbs a {
  text-decoration: none;
  cursor: auto;
}
  CSS

  needs :parents => []
  needs :display_name

  def content
    div.breadcrumbs {
      @parents.each do |parent|
        span.parent {
          a parent.display_name, href: parent.href
        }
        text " > "
      end
      span.self @display_name
    }
  end
end
