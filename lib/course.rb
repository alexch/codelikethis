require 'erector'
require 'active_support'

class Course < Erector::Widget
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

  def title
    self.class.name.titleize
  end

  def content
    h2 title
    ul {
      @lesson_names.each do |lesson_name|
        li {
          a lesson_name.titleize, :href => "/lessons/#{self.name}/#{lesson_name}"
        }
      end
    }
  end

  def lesson lesson_name
    Lesson.new(self, lesson_name)
  end

end
