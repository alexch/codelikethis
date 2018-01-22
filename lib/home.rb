require 'erector'
require 'tracks_table'
require 'views'

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
              text "We're "
              a "Burlington Code Academy", href: "http://www.burlingtoncodeacademy.com"
              text " and we want to teach you how to code!"
            }
            p(class: 'card-text') {
              text "This site contains lectures and labs on Ruby, JavaScript, and more, in outline, slide, and video format."
              text " "
              text "We'll be updating it with all our new lectures, labs, and videos, so keep checking back!"
            }
          }
        }
      }

    }

  end

  def rightbar_content
    twitter
  end

end
