require 'erector'
require 'active_support'

require 'breadcrumbs'
require 'courses'
require 'lesson'
require 'lab'

class Course < Erector::Widget
  attr_writer :dir

  def initialize name = "course", &block
    @name = name.underscore
    @stuff = []
    instance_eval &block if block
  end

  def lessons
    @stuff.select{|thing| thing.is_a? Lesson}
  end

  def lesson_names
    lessons.map(&:name)
  end

  def labs
    @stuff.select{|thing| thing.is_a? Lab}
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

  def href
    "/lessons/#{name}"
  end

  def content
    widget Breadcrumbs, parents: [Courses.new], display_name: self.display_name
    list_lessons
  end

  def list_lessons
    ul {
      lesson_names.each do |lesson_name|
        li {
          a lesson_name.titleize, :href => "#{self.href}/#{lesson_name}"
        }
      end
    }
  end

  def lesson lesson_name
    raise "already a lesson named #{lesson_name}" if this_lesson_index(lesson_name)

    Lesson.new(self, lesson_name).tap do |lesson|
      @stuff << lesson
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
      lesson_names.index { |name| name == lesson_name }
    end

    def this_item_index(lesson_name)
      @stuff.map(&:name).index { |name| name == lesson_name }
    end

end
