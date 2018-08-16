class Topic < Thing

  # todo: validate against topics.json

  def href
    "/topics/#{name}"
  end

  def link_view
    Link::View.new(target: self)
  end

  class View < Erector::Widget
    needs :target
    needs :site

    def content
      h1 "Topic: " + @target.display_name

      p {
        i "This topic is covered in the following lessons."
      }
      tracks = @site.tracks.select do |track|
        track.topics.include? @target
      end

      tracks.each do |track|
        p {
          span(class: 'track-name') {
            i(class: "fas fa-paw")
            text nbsp
            widget track.link_view
            text ':'
          }
        }

        lessons = track.lessons.select do |lesson|
          lesson.topics.include? @target
        end
        ul {
          lessons.each do |lesson|
            li {
              i(class: "fas fa-clone")
              text nbsp
              widget lesson.link_view
            }
          end
        }
      end

    end
  end

end
