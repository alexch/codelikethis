require 'erector'
require 'active_support'
require 'deck'

require 'thing'
require 'disqus'
require 'views'

class Lesson < Thing

  attr_reader :track, :description

  contains :videos
  contains :links
  contains :projects
  contains :topics

  def href
    @track.href + "/" + name
  end

  def slides_href
    href + ".slides"
  end

  def labs
    slide_labs + next_labs
  end

  def dir
    @dir || @track.dir
  end

  def content_file
    File.new(File.join(dir, "#{@name}.md"))
  end

  def slides
    ::Deck::Slide.from_file content_file
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
    View.new(target: self, development_mode: Thread.current[:development_mode])
  end

  class View < Erector::Widget
    include Views

    needs :target, :development_mode
    attr_reader :target

    # proxy readers to the target (model) object
    # todo: use DelegateClass?
    [
        :labs, :track,
        :name, :display_name,
        :description, :description?,
        :slides, :slides?,
        :videos, :videos?, :video?,
        :next_lesson, :previous_lesson,
        :next_labs,
        :topics
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
          a("Show Slides", href: @target.slides_href, class: 'slides btn btn-primary')
        }
      }
      br
    end

    def content

      div(class: 'lesson-title') {
        div(class: 'track-name') {
          i(class: "fas fa-paw")
          text nbsp
          text track.display_name
          text ':'
        }

        h1(display_name, class: 'lesson-name')

        next_and_previous(show_track: false)
      }

      if description?
        div(class: 'description') {
          h2 "Description"
          p description
        }
        br
      end

      if !topics.empty?
        div(class: 'topics') {
          h2 "Topics"
          topics.each do |topic|
            widget topic.link_view
            text raw(nbsp)
          end
        }
        br
      end

      if videos?
        div(class: 'videos', id: 'videos') {
          h2 {
            i(class: "fas fa-video")
            text nbsp
            text "Videos"
          }
          videos.each {|video| widget video.view}
        }
      end

      br

      div.main_column {
        if slides?
          h2 {
            i(class: "fas fa-clone")
            text nbsp
            text "Slides"
          }
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

        if target.projects?
          h2 "Suggested Projects"
          ul(class: 'links') do
            target.projects.each do |project|
              li {widget project.link_view}
            end
          end
        end

        next_and_previous(show_track: true)
        br

        # todo: put comments back on codelikethis.com only
        # div(class: 'comments', id: 'comments') {
        #   h2 "Comments"
        #   widget Disqus,
        #          shortname: "codelikethis",
        #          developer: (@development_mode ? 1 : nil),
        #          identifier: "lesson_#{track.name}_#{name}",
        #          title: "#{track.display_name}: #{display_name}"
        # }
      }

    end

    def next_and_previous(show_track: true)
      div.next_and_previous {
        previous_lesson_button
        next_lesson_button
        if show_track
          center {
            a(with_tooltip("This Track") + {href: track.href}) {
              i(class: "fas fa-paw")
              text nbsp
              text track.display_name
              text nbsp
              i(class: "fas fa-paw")
            }
          }
        end
      }
      br clear: 'both'
    end


    def previous_lesson_button
      if previous_lesson
        a.button.previous_lesson(with_tooltip(previous_lesson.display_name) + {href: previous_lesson.name}) do
          i(class: "fas fa-arrow-left")
          text nbsp
          text "Previous Lesson"
        end
      end
    end

    def next_lesson_button
      if next_lesson
        a.button.next_lesson(with_tooltip(next_lesson.display_name) + {href: next_lesson.name}) do
          text "Next Lesson"
          text nbsp
          i(class: "fas fa-arrow-right")
        end
      end
    end
  end

end
