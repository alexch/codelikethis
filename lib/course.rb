require 'erector'
require 'active_support'

require 'breadcrumbs'
require 'courses'

class Course < Erector::Widget
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

end
