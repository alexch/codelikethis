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
  contains :goals
  contains :labs

  def initialize **options, &block
    super **options, &block
    scan_content
  end

  attr_reader :content

  def scan_content
    begin
      content = File.read(content_file)
      content_lines = content.split("\n")
      headers = []
      while (content_lines.first =~ /^(    |\t)/)
        header_line = content_lines.shift
        headers.push header_line
      end
      headers_joined = headers.join("\n")
      begin
        instance_eval headers_joined
      rescue => e
        $stderr.print "Error scanning file #{content_file.path.split('/')[-4..-1].join('/')}:"
        $stderr.puts e
        $stderr.puts headers_joined
        raise e
      end

      @content = content_lines.join("\n")
    rescue Errno::ENOENT, Errno::EINVAL, Errno::ENOTDIR => e
      # ap e
      @content = ""
    end
  end

  def href
    @track.href + "/" + name
  end

  def slides_href
    href + ".slides"
  end

  def labs
    things_of_class(Lab) +
        slide_labs + next_labs
  end

  def dir
    @dir || (@track && @track.dir) || "/dev/null"
  end

  def content_file
    File.new(File.join(dir, "#{@name}.md"))
  end

  def slides
    ::Deck::Slide.split content
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
        :topics, :goals
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
          if target.labs?
            li(class: 'list-group-item') {
              a 'Labs', href: '#labs'
            }
          end
          if target.links?
            li(class: 'list-group-item') {
              a 'Links', href: '#links'
            }
          end
          if target.projects?
            li(class: 'list-group-item') {
              a 'Projects', href: '#projects'
            }
          end
        }
      }
      br
      if slides?
        div(class: 'row text-center') {
          div(class: 'col') {
            a("Show Slides", href: @target.slides_href, class: 'slides btn btn-primary')
            br
          }
        }
        br
      end

    end

    def content

      if description?
        div(class: 'description', id: 'description') {
          h2 "Description"
          p description
        }
        br
      end

      if !topics.empty?
        div(class: 'topics', id: 'topics') {
          h2 "Topics"
          topics.each do |topic|
            widget topic.link_view
            text raw(nbsp)
          end
        }
        br
      end

      if !goals.empty?
        div(class: 'goals', id: 'goals') do
          h2 "Goals"
          p "The student will learn..."
          ul do
            goals.each do |goal|
              li goal.view
            end
          end
        end
        br
      end

      if videos?
        div(class: 'videos', id: 'videos') {
          h2 {
            i(class: "fas fa-video")
            text nbsp
            text "Videos"
          }
          videos.each { |video| widget video.view }
        }
      end

      br

      div.main_column {
        if slides?
          div(class: 'slides', id: 'slides') {
            h2 {
              i(class: "fas fa-clone")
              text nbsp
              text "Slides"
            }
            slides.each do |slide|
              widget slide
            end
            br
          }
        end

        unless labs.empty?
          div(class: 'labs', id: 'labs') {
            h2 "Labs"
            labs_list
          }
          br
        end

        if target.links?
          div(class: 'links', id: 'links') {
            h2 "Links"
            ul(class: 'links') do
              target.links.each do |link|
                li { widget link.view }
              end
            end
          }
        end

        if target.projects?
          div(class: 'projects', id: 'projects') {
            h2 "Suggested Projects"
            ul(class: 'links') do
              target.projects.each do |project|
                li { widget project.link_view }
              end
            end
          }
        end

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

    def breadcrumbs
      div(class: 'row') do
        div(class: 'col-3') do
          previous_lesson_button
        end

        div(class: 'col-6 text-center') do
          a(with_tooltip("This Track") + {href: track.href}) {
            i(class: "fas fa-paw")
            text nbsp
            text track.display_name
            text nbsp
            i(class: "fas fa-paw")
          }
          br
          h1(display_name, class: 'lesson-name')

        end

        div(class: 'col-3') do
          next_lesson_button
        end
      end
    end

    def previous_lesson_button
      if previous_lesson
        a.button.previous_lesson(with_tooltip(previous_lesson.display_name) +
                                     {href: previous_lesson.name}) do
          i(class: "fas fa-arrow-left")
          text nbsp
          text "Previous Lesson"
        end
      end
    end

    def next_lesson_button
      if next_lesson
        a(with_tooltip(next_lesson.display_name) +
              {href: next_lesson.name,
               class: ['button', 'next_lesson', 'float-right']
              }) do
          text "Next Lesson"
          text nbsp
          i(class: "fas fa-arrow-right")
        end
      end
    end
  end

end
