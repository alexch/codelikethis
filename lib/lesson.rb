require 'erector'
require 'active_support'
require 'deck'

class Lesson < Erector::Widget

  attr_reader :name, :course

  def initialize course, name
    @course, @name = course, name
    @videos = []
  end

  def display_name
    name.titleize
  end

  def href
    @course.href + "/" + name
  end

  def video youtube_id
    @videos << youtube_id
  end

  def labs
    div(class: 'list-group') {
      next_labs.each do |lab|
        div(class: 'list-group-item') {
          widget lab
        }
      end
    }
  end

  def outline
    div.outline {
      h3 "Outline"
      ul(class: 'list-group') {
        slides.each do |slide|
          li(class: 'list-group-item') {
            a slide.title, href: "##{slide.slide_id}"
          }
        end
      }
    }
    br
    a.slides("View Slides", href: "#{name}.slides", class: 'btn btn-primary')

  end

  def content
    br; br
    next_and_previous

    br; br
    h1(display_name, class: 'lesson-name')

    div.extras {
      labs
    }

    br

    div.videos {
      @videos.each do |youtube_id|
        # see https://developers.google.com/youtube/player_parameters
        s = %Q(<iframe class="video youtube" type="text/html" width="640" height="390" src="http://www.youtube.com/embed/#{youtube_id}" frameborder="0"></iframe>\n)
        rawtext s
      end
    }

    div.main_column {
      slides.each do |slide|
        widget slide
      end

      next_and_previous

      widget Disqus, shortname: "codelikethis",
        developer: (Thread.current[:development] ? 1 : nil),
        identifier: "lesson_#{@course.name}_#{name}",
        title: "#{@course.display_name}: #{display_name}"
    }
  end

  def next_and_previous
    div.next_and_previous {
      previous_lesson_button
#      text raw('&nbsp;')
      next_lesson_button
      center {
        a @course.display_name, href: @course.href
      }
    }
  end

  def previous_lesson_button
    if previous_lesson
      a.button.previous_lesson href: previous_lesson.name do
        text "<< "
        text previous_lesson.display_name
        text " <<"
      end
    end
  end

  def next_lesson_button
    if next_lesson
      a.button.next_lesson href: next_lesson.name do
        text ">> "
        text next_lesson.display_name
        text " >>"
      end
    end
  end

  def slides
    Deck::Slide.from_file File.new(File.join(@course.dir, "#{@name}.md"))
  end

  def next_lesson
    @course.next_lesson(name)
  end

  def previous_lesson
    @course.previous_lesson(name)
  end

  def next_labs
    @course.next_labs(name)
  end

  def video?
    !@videos.empty?
  end

end
