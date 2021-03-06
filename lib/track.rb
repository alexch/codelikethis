require 'erector'
require 'active_support/inflector'
require 'awesome_print'

require 'hash_extensions'

require 'thing'
require 'link'
require 'lesson'
require 'lab'
require 'breadcrumbs'
require 'tracks_table'
require 'util'

class Track < Thing

  # @return a class object representing the track
  # @raise NameError if not found
  def self.named track_name
    # first load every track in the filesystem
    require_all(tracks_dir)

    track_constant_name = track_name.split(/[_-]/).map(&:capitalize).join
    Track.const_get(track_constant_name)
  rescue => e
    raise "Could not find track named '#{track_name}'"
  end

  attr_writer :dir

  contains :labs do |object, args|
    args ||= {}
    args + {track: object}
  end

  contains :lessons do |track, args|
    args ||= {}
    extra = {track: track}

    lesson_name = args[:name]
    starts_with_slash = /^\//
    if lesson_name =~ starts_with_slash
      require 'pathname'
      path = Pathname.new(File.join(track.tracks_dir, lesson_name))
      extra[:dir] = path.dirname.to_s
      extra[:name] = lesson_name = path.basename.to_s
    end

    raise "already a lesson named #{lesson_name}" if track.this_lesson_index(lesson_name)

    args + extra
  end

  contains :links
  contains :projects
  contains :topics
  contains :goals

  # current page (for sidebar highlighting)
  def current= track_or_lesson
    @current = track_or_lesson
  end

  attr_reader :description

  def description?
    !!description
  end

  def goals?
    goals and not goals.empty?
  end

  # todo: test
  def links
    super + @things.map(&:links).flatten
  end

  # todo: test
  def topics
    things_of_class(Topic, all_things) # is this line useful? might have a side effect?
    (super || []) + (@things.map do |thing|
      thing.respond_to?(:topics) ? thing.topics : nil
    end.compact).flatten.sort.uniq
  end

  def lesson_names
    lessons.map(&:name)
  end

  def labs
    list = []
    @things.map do |thing|
      if thing.is_a? Lesson
        list += thing.slide_labs
      elsif thing.is_a? Lab
        list << thing
      end
    end
    list
  end

  # todo: unit test this
  def projects
    track_defined_projects = things_of_class(Project)
    lesson_defined_projects = []
    things_of_class(Lesson).each do |lesson|
      lesson_defined_projects += lesson.projects
    end
    (track_defined_projects + lesson_defined_projects).uniq
  end

  def lab_names
    labs.map(&:name)
  end

  def name
    (@name || super).underscore
  end

  def href anchor: nil
    if anchor
      "/lessons/#{name}" + '#' + anchor.to_s
    else
      "/lessons/#{name}"
    end
  end

  def lesson_named lesson_name
    @things[this_item_index(lesson_name)]
  end

  def previous_lesson lesson_name
    this_lesson_index = this_lesson_index(lesson_name)
    if this_lesson_index == 0
      nil
    else
      lessons[this_lesson_index - 1]
    end
  end

  def next_lesson lesson_name
    lessons[this_lesson_index(lesson_name) + 1]
  end

  def next_labs lesson_name
    next_item = this_item_index(lesson_name) + 1
    labs = []
    while (item = @things[next_item]).is_a? Lab
      labs << item
      next_item += 1
    end
    labs
  end

  def dir
    @dir || File.join(tracks_dir, name)
  end

  def self.tracks_dir
    @@tracks_dir ||= begin
      app_dir = File.expand_path(File.dirname(File.dirname(__FILE__)))
      File.join(app_dir, "public", "lessons")
    end
  end

  def tracks_dir
    self.class.tracks_dir
  end

  def view
    View.new(target: self)
  end

  class View < Erector::Widget
    needs :target
    attr_reader :target

    def current_page? item
      target.instance_variable_get(:@current) == item
    end

    def content
      widget Breadcrumbs, parents: [TracksTable.new], display_name: target.display_name
      div(class: 'container no-gutters') do
        if target.description?
          div(class: 'description') do
            h2 "Description"
            p target.description # todo: markdown?
          end
        end

        if target.goals?
          div(class: 'goals') do
            h2 "Goals"
            p "The student will learn..."
            ul do
              target.goals.each do |goal|
                li goal.view
              end
            end
          end
        end

        if target.topics?
          div(class: 'topics') {
            h2 "Topics"
            p do
              list_topics
            end
          }
        end

        div.row {
          if target.lessons?
            div(class: 'col-sm-12 col-md-6 lessons') {
              h2 "Lessons"
              list_lessons
            }
          end
          if target.labs?
            div(class: 'col-sm-12 col-md-6 lessons') {
              h2 "Labs"
              list_labs
            }
          end
        }

        if target.projects?
          h2 "Projects"
          ul(class: 'projects') do
            target.projects.each do |project|
              li { widget project.link_view }
            end
          end
        end

        if target.links?
          h2 "Links"
          ul(class: 'links') do
            target.links.each do |link|
              li { widget link.view }
            end
          end
        end
      end
    end

    def list_items items, options = {}
      options = options.dup
      element_name = options.delete(:element) || 'li'
      items.each do |item|
        css_classes = ['list-group-item', 'border-0', ('active' if current_page? item)]
        div(class: css_classes) {

          item_name = item.display_name
          # item_name = "Lab: #{item_name}" if item.is_a? Lab
          href = if current_page? item
                   ""
                 else
                   "#{item.href}"
                 end
          href += "#content" unless href.include?("#")

          tooltip = if item.description?
                      {
                          # https://getbootstrap.com/docs/4.0/components/tooltips/
                          title: item.description,
                          'data-html': true,
                          'data-toggle': "tooltip",
                          'data-placement': "right",
                      }
                    else
                      {}
                    end

          a(**({href: href} + tooltip)) {
            i(class: 'fas fa-clone') # clone icon looks like slides
            text nbsp
            text item_name
            span.loading_image unless current_page? item

            # todo: handle lessons with videos better
            if item.respond_to? :video? and item.video?
              span.video_link {
                i(class: 'fas fa-video')
                text nbsp
                text "Video"
              }
            end

            if item.respond_to?(:slides)
              text ' '
              span("(#{item.slides.length} slides)", class: 'slide_count')
            end

          }
        }
      end
    end

    def list_lessons
      list_items target.lessons
    end

    def list_labs
      list_items target.labs
    end

    def list_topics
      target.topics.each do |topic|
        widget topic.link_view
      end
    end

  end

  Separator = new(name: "---")

  def this_lesson_index(lesson_name)
    lesson_names.index { |name| name == lesson_name }
  end

  def this_item_index(lesson_name)
    # handle both URL-friendly dashes and filename-friendly underscores
    snake_case_lesson_name = lesson_name.gsub('-', '_')
    kebab_case_lesson_name = lesson_name.gsub('_', '-')
    (@things.map(&:name).index do |name|
      [lesson_name, snake_case_lesson_name, kebab_case_lesson_name].include? name
    end) or raise "No lesson named #{lesson_name}"
  end

end
