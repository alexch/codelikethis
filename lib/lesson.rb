require 'erector'
require 'active_support'
require 'deck'

class Lesson < Erector::Widget

  attr_reader :name, :course, :abstract

  def initialize course, name, abstract: nil, display_name: nil
    @course, @name, @abstract, @display_name = course, name, abstract, display_name
    @videos = []
  end

  def display_name
    @display_name || name.titleize
  end

  def href
    @course.href + "/" + name
  end

  def video youtube_id
    @videos << youtube_id
  end

  def labs
    slide_labs + next_labs
  end

  def labs_list
    div(class: 'list-group') {
      labs.each do |lab|
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
            a slide.title, href: "#anchor/#{slide.slide_id}"
          }
        end
      }
    }
    br
    div(class: 'row text-center') {
      div(class: 'col') {
        a.slides("Show Slides", href: "#{name}.slides", class: 'btn btn-primary')
      }
    }
    br

  end

  def content
    h1(class: 'lesson-name') {
      span(class: 'course-name') {
        text course.display_name
        text ':'
      }
      br
      text display_name
    }
    next_and_previous

    if abstract
      div(class: 'abstract') {
        h2 "Abstract"
        p abstract
      }
      br
    end

    div.videos {
      @videos.each do |youtube_id|
        # see https://developers.google.com/youtube/player_parameters
        # see https://css-tricks.com/NetMag/FluidWidthVideo/Article-FluidWidthVideo.php
        #
        div(class: "video") {
          s = %Q(<iframe class="youtube" type="text/html" width="560" height="349" src="http://www.youtube.com/embed/#{youtube_id}" frameborder="0" allowfullscreen></iframe>\n)
          rawtext s
        }
      end
    }

    br

    div.main_column {
      if slides?
        h2 "Slides"
        slides.each do |slide|
          widget slide
        end
        br
      end

      unless next_labs.empty?
        div(class: 'next-labs') {
          h2 "Labs"
          labs_list
        }
        br
      end

      next_and_previous
      br

      div.comments {
        h2 "Comments"
        widget Disqus, shortname: "codelikethis",
               developer: (Thread.current[:development] ? 1 : nil),
               identifier: "lesson_#{@course.name}_#{name}",
               title: "#{@course.display_name}: #{display_name}"
      }
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
  rescue Errno::ENOENT, Errno::EINVAL
    []
  end

  def next_lesson
    @course.next_lesson(name)
  end

  def previous_lesson
    @course.previous_lesson(name)
  end

  def slide_labs
    slides.select do |slide|
      slide.title =~ /lab: /i
    end.map do |slide|
      Lab.new @course, slide.title.slice(4..-1).strip, href: "#{self.href}#anchor/#{slide.slide_id}"
    end
  end

  def next_labs
    @course.next_labs(name)
  end

  def video?
    !@videos.empty?
  end

  def slides?
    !slides.empty?
  end

end
