require 'erector'
require 'active_support/inflector'

require 'breadcrumbs'
require 'courses_table'
require 'lesson'
require 'lab'
require 'awesome_print'

class Course < Erector::Widget

  external :style, <<-CSS
  span.video_link {
    float: right;
    border: 1px dotted black;
    padding: 1px 2px;
  }
  CSS

  attr_writer :dir

  def initialize name = "course", &block
    @name = name.underscore
    @stuff = []
    instance_eval &block if block
  end

  def current= course_or_lesson
    @current = course_or_lesson
  end

  def lessons
    @stuff.select {|thing| thing.is_a? Lesson}
  end

  def lesson_names
    lessons.map(&:name)
  end

  def labs
    @stuff.select {|thing| thing.is_a? Lab}
  end

  def lab_names
    labs.map(&:name)
  end

  def name
    @name
  end

  def display_name
    name.titleize
  end

  def href anchor: nil
    "/lessons/#{name}#{"##{anchor}" if anchor}"
  end

  def content
    widget Breadcrumbs, parents: [CoursesTable.new], display_name: self.display_name
    div style: "max-width: 30em;" do
      list_items
    end
  end

  def list_items items = @stuff, options = {}
    options = options.dup
    element_name = options.delete(:element) || 'li'
    items.each do |item|
      div(class: ['list-group-item', ('active' if @current == item)]) {
        item_name = item.display_name
        item_name = "Lab: #{item_name}" if item.is_a? Lab
        a href: "#{item.href}#content" do
          text item_name
          span.video_link "Video" if item.respond_to? :video? and item.video?
        end
      }
    end
  end

  def list_lessons
    list_items lessons
  end

  def list_labs
    list_items labs
  end

  def lesson lesson_name, &block
    raise "already a lesson named #{lesson_name}" if this_lesson_index(lesson_name)

    Lesson.new(self, lesson_name).tap do |lesson|
      @stuff << lesson
      lesson.instance_eval(&block) if block
    end
  end

  def lab lab_name
    Lab.new(self, lab_name).tap do |lab|
      @stuff << lab
    end
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

  private

  def this_lesson_index(lesson_name)
    lesson_names.index {|name| name == lesson_name}
  end

  def this_item_index(lesson_name)
    (@stuff.map(&:name).index {|name| name == lesson_name}) or raise "No lesson named #{lesson_name}"
  end

end
