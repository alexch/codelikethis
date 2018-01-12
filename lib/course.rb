require 'erector'
require 'active_support/inflector'
require 'awesome_print'

require 'thing'
require 'lesson'
require 'lab'

require 'breadcrumbs'
require 'courses_table'

class Course < Thing

  attr_writer :dir

  def initialize **options, &block
    @stuff = [] # lessons and labs
    @goals = []
    @links = []
    super
  end

  # setters (for use during initialize block)

  def lesson **args, &block
    lesson_name = args[:name]
    raise "already a lesson named #{lesson_name}" if this_lesson_index(lesson_name)

    @stuff << Lesson.new(**(args + {course: self}), &block)
  end

  def lab lab_name
    Lab.new(self, lab_name).tap do |lab|
      @stuff << lab
    end
  end

  def goal text
    @goals << text
  end

  def link **options
    @links << Link.new(**options)
  end

  # current page (for sidebar highlighting)
  def current= course_or_lesson
    @current = course_or_lesson
  end

  attr_reader :abstract, :goals, :links

  def abstract?
    !!abstract
  end

  def goals?
    goals and not goals.empty?
  end

  def links?
    links and not links.empty?
  end

  def lessons
    @stuff.select {|thing| thing.is_a? Lesson}
  end

  def lesson_names
    lessons.map(&:name)
  end

  def labs
    @stuff.map do |thing|
      if thing.is_a? Lab
        thing
      elsif thing.is_a? Lesson
        thing.slide_labs
      end
    end.compact.flatten
  end

  def lab_names
    labs.map(&:name)
  end

  def name
    (@name || "course").underscore
  end

  def display_name
    @display_name or name.titleize
  end

  def href anchor: nil
    "/lessons/#{name}#{"##{anchor}" if anchor}"
  end


  def lesson_named lesson_name
    @stuff[this_item_index(lesson_name)]
  end

  def previous_lesson lesson_name
    this_lesson_index = this_lesson_index(lesson_name)
    this_lesson_index == 0 ? nil : lessons[this_lesson_index - 1]
  end

  def next_lesson lesson_name
    lessons[this_lesson_index(lesson_name) + 1]
  end

  def next_labs lesson_name
    next_item = this_item_index(lesson_name) + 1
    labs = []
    while (item = @stuff[next_item]).is_a? Lab
      labs << item
      next_item += 1
    end
    labs
  end

  def dir
    @dir || File.join(courses_dir, name)
  end

  def courses_dir
    here = File.expand_path(File.dirname(__FILE__))
    project = File.expand_path("#{here}/..")
    courses_dir = "#{project}/public/lessons/"
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

    def target_items
      target.instance_variable_get(:@stuff) == item
    end

    def content
      widget Breadcrumbs, parents: [CoursesTable.new], display_name: target.display_name
      if target.abstract?
        div(class: 'abstract') do
          h2 "Abstract"
          p target.abstract # todo: markdown?
        end
      end
      if target.goals?
        div(class: 'goals') do
          h2 "Goals"
          p "The student will learn..."
          ul do
            target.goals.each do |goal|
              li goal
            end
          end
        end
      end
      div.container {
        div.row {
          div(class: 'col-12 col-md-6 lessons') {
            h2 "Lessons"
            list_lessons
          }
          unless target.labs.empty?
            div(class: 'col-12 col-md-6 lessons') {
              h2 "Labs"
              list_labs
            }
          end
        }
      }
      if target.links?
        h2 "Links"
        ul(class: 'links') do
          target.links.each do |link|
            li {widget link}
          end
        end
      end
    end

    def list_items items = target_items, options = {}
      options = options.dup
      element_name = options.delete(:element) || 'li'
      items.each do |item|
        div(class: ['list-group-item', 'border-0', ('active' if current_page? item)]) {
          item_name = item.display_name
          # item_name = "Lab: #{item_name}" if item.is_a? Lab
          href = if current_page? item
                   ""
                 else
                   "#{item.href}"
                 end
          href += "#content" unless href.include?("#")

          a href: href do
            text item_name
            span.loading_image unless current_page? item

            # todo: handle lessons with videos better
            span.video_link "Video" if item.respond_to? :video? and item.video?
          end
        }
      end
    end

    def list_lessons
      list_items target.lessons
    end

    def list_labs
      list_items target.labs
    end

  end

  Separator = new(name: "---")

  private

  def this_lesson_index(lesson_name)
    lesson_names.index {|name| name == lesson_name}
  end

  def this_item_index(lesson_name)
    (@stuff.map(&:name).index {|name| name == lesson_name}) or raise "No lesson named #{lesson_name}"
  end

end
