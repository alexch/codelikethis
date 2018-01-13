require 'active_support/inflector'
require 'awesome_print'

# abstract base class for items that can be initialized
# via the DSL, like Course, Lesson, Lab
class Thing
  attr_reader :name, :display_name

  # todo: check keys against "needs"-style per-subclass attribute list

  def initialize **options, &block

    @things = [] # this thing's child things

    options.each_pair do |key, value|
      instance_variable_set("@#{key}", value)
    end

    instance_eval &block if block
  end

  def name # if no name, use class name
    @name || self.class.name
  end

  def display_name # if no display name, use name
    @display_name || titleized(name)
  end

  def method_missing thing_type, *args, &block

    getting = (thing_type[-1] == "s")
    thing_type = thing_type[0..-2] if getting
    require thing_type.to_s # in case we don't know about "foo"s yet
    thing_class = thing_type.to_s.camelize.constantize

    raise "#{thing_type} should be a Thing" unless thing_class < Thing

    if getting
      @things.select {|thing| thing.is_a? thing_class}
    else # setting
      @things << thing_class.new(**args[0], &block)
    end
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
  ].inject({}) do |hash, word|
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
