require 'erector'
require 'active_support'
require 'deck'

require 'thing'
require 'disqus'

class Lesson < Thing

  attr_reader :track, :abstract

  contains :videos
  contains :links

  def href
    @track.href + "/" + name
  end

  def labs
    slide_labs + next_labs
  end

  def slides
    Deck::Slide.from_file File.new(File.join(@track.dir, "#{@name}.md"))
  rescue Errno::ENOENT, Errno::EINVAL
    []
  end

  def next_lesson
    @track.next_lesson(name)
  end

  def previous_lesson
    @track.previous_lesson(name)
  end

  def slide_labs
    slides.select do |slide|
      slide.title =~ /lab: /i
    end.map do |slide|
      Lab.new track: track, name: slide.title.slice(4..-1).strip, href: "#{self.href}#anchor/#{slide.slide_id}"
    end
  end

  def next_labs
    @track.next_labs(name)
  end

  def video?
    !videos.empty?
  end

  def slides?
    !slides.empty?
  end

  public

  def view
    View.new(target: self)
  end

  class View < Erector::Widget
    needs :target
    attr_reader :target


    # proxy readers to the target (model) object
    # todo: use DelegateClass?
    [
        :labs, :track, :name, :display_name,
        :abstract, :slides, :videos,
        :slides?, :video?,
        :next_lesson, :previous_lesson,
        :next_labs,
    ].each do |method|
      define_method method do
        @target.send method
      end
    end

    def labs_list
      div(class: 'list-group') {
        labs.each do |lab|
          div(class: 'list-group-item') {
            widget lab.view
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
        span(class: 'track-name') {
          text track.display_name
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
        videos.each {|video| widget video.view}
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

        if target.links?
          h2 "Links"
          ul(class: 'links') do
            target.links.each do |link|
              li {widget link.view}
            end
          end
        end

        next_and_previous
        br

        div.comments {
          h2 "Comments"
          widget Disqus, shortname: "codelikethis",
                 developer: (Thread.current[:development] ? 1 : nil),
                 identifier: "lesson_#{track.name}_#{name}",
                 title: "#{track.display_name}: #{display_name}"
        }
      }


    end

    def next_and_previous
      div.next_and_previous {
        previous_lesson_button
        next_lesson_button
        center {
          a track.display_name, href: track.href
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
  end

end
