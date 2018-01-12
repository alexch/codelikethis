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
    @display_name ||= titleized(name)

    instance_eval &block if block
  end

  def current= course_or_lesson
    @current = course_or_lesson
  end

  WEIRD_WORDS = [
      "API",
      "APIs",
      "ARIA",
      "CGI",
      "ECMAScript",
      "HTML",
      "JavaScript",
      "jQuery",
      "JS",
      "MVC",
      "NodeJS",
      "RegExp",
      "SQL",
      "TDD",
  ].inject({})  do |hash, word|
    hash[word.downcase] = word
    hash
  end

  private

  def titleized name
    name.split(/[_\s]/).map do |word|
      WEIRD_WORDS[word.downcase] || word.capitalize
    end.join(" ")
  end

end
