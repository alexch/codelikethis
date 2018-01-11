require 'active_support/inflector'
require 'awesome_print'

# abstract base class for items that can be initialized
# via the DSL, like Course, Lesson, Lab
class Thing

  attr_reader :name, :display_name

  # todo: check keys against "needs"-style per-subclass attribute list

  def initialize **options, &block
    options.each_pair do |key, value|
      instance_variable_set("@#{key}", value)
    end

    # if no name, use class name
    @name ||= self.class.name
    # snake_case the name
    @name = @name.underscore

    # if no display name, use name
    @display_name ||= name.titleize # todo: special words

    instance_eval &block if block
  end

  def current= course_or_lesson
    @current = course_or_lesson
  end

end
