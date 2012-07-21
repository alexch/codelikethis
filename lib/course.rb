require 'erector'

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

  def content
    ul {
      @lesson_names.each do |name|
        li {
          a name, :href => "#{name}/"
        }
      end
    }
  end
end
