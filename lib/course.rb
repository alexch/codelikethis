require 'erector'
require 'active_support'

require 'breadcrumbs'
require 'courses'

class Course < Erector::Widget
  attr_writer :dir

  # http://stackoverflow.com/questions/2393697/look-up-all-descendants-of-a-class-in-ruby
  def self.descendants
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end

  def self.lesson lesson_name
    default_lessons << lesson_name
  end

  def self.default_lessons
    @default_lessons ||= []
  end

  def initialize lesson_names = nil
    @lesson_names = (lesson_names or self.class.default_lessons)
  end

  def lesson_names
    @lesson_names
  end

  def lessons
    @lesson_names.map do |lesson_name|
      lesson(lesson_name)
    end
  end

  def name
    self.class.name.underscore
  end

  def display_name
    self.class.name.titleize
  end

  def href
    "/lessons/#{name}"
  end

  def content
    widget Breadcrumbs, parents: [Courses.new], display_name: self.display_name
    ul {
      @lesson_names.each do |lesson_name|

        li {
          a lesson_name.titleize, :href => "#{self.href}/#{lesson_name}"
        }
      end
    }
  end

  def lesson lesson_name
    Lesson.new(self, lesson_name)
  end

  def previous_lesson lesson_name
    this_lesson_index = this_lesson_index(lesson_name)
    this_lesson_index == 0 ? nil : lessons[this_lesson_index - 1]
  end

  def this_lesson_index(lesson_name)
    lesson_names.index { |name| name == lesson_name }
  end

  def next_lesson lesson_name
    lessons[this_lesson_index(lesson_name) + 1]
  end

  def dir
    @dir || File.join(courses_dir, name)
  end

  def courses_dir
    here = File.expand_path(File.dirname(__FILE__))
    project = File.expand_path("#{here}/..")
    courses_dir = "#{project}/public/lessons/"
  end

end
