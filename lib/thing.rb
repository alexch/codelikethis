require 'active_support/inflector'
require 'awesome_print'

# abstract base class for items that can be initialized
# via the DSL, like Track, Lesson, Lab
class Thing
  # every Thing has a name
  attr_reader :name
  # every Thing has a display name
  attr_reader :display_name

  # todo: check keys against "needs"-style per-subclass attribute list

  def initialize **options, &block

    @things = [] # this thing's child things

    options.each_pair do |key, value|
      instance_variable_set("@#{key}", value)
      ap("@#{key}=#{value}")
    end

    instance_eval &block if block
  end

  def name # if no name, use class name
    @name || self.class.name
  end

  def display_name # if no display name, use name
    @display_name || titleized(name)
  end

  def description?
    !!@description
  end

  def self.contains name, &arg_munger

    plural_name = name
    raise "#{name} must be plural" unless plural_name[-1] == "s"
    singular_name = name[0...-1]

    require singular_name.to_s # in case we don't know about "foo"s yet
    thing_class = singular_name.to_s.camelize.constantize

    define_method(singular_name) do |**args, &block|
      args = arg_munger.call(self, args) if arg_munger
      add_thing singular_name, args, block
    end

    define_method(plural_name) do
      @things.select {|thing| thing.is_a? thing_class}
    end

    define_method("#{plural_name}?") do
      things_of_this_type = self.send plural_name
      (things_of_this_type and not things_of_this_type.empty?)
    end
  end


  def add_thing thing_type, options, block
    require thing_type.to_s # in case we don't know about "foo"s yet
    thing_class = thing_type.to_s.camelize.constantize
    @things << thing_class.new(**options, &block)
  end

  def current= track_or_lesson
    @current = track_or_lesson
  end

  def self.lookup a
    a.inject({}) do |hash, word|
      hash[word.downcase] = word
      hash
    end
  end

  # please keep this list sorted alphabetically
  WEIRD_WORDS = lookup %w[
    AJAX
    API
    APIs
    ARIA
    CSS
    CGI
    DOM
    ECMAScript
    HTML
    HTTP
    JavaScript
    jQuery
    JS
    MVC
    NodeJS
    NoSQL
    RegExp
    SEO
    SQL
    TDD
    XP
  ]

  HYPHENATES = %w[
    Object-Oriented
    Client-Side
    Server-Side
  ]

  # https://english.stackexchange.com/questions/14/which-words-in-a-title-should-be-capitalized
  SMALL_WORDS = lookup %w[
    a
    an
    and
    at
    but
    by
    for
    from
    in
    nor
    of
    on
    or
    so
    the
    to
    with
    yet
  ]

  private

  def titleized name
    first_word = true
    HYPHENATES.each do |hyphenate|
      name = name.sub(hyphenate.underscore, hyphenate)
    end
    if name.include?('-')
      return name.split('-').map {|part| titleized(part)}.join('-')
    end

    name.split(/[_\s]/).map do |word|
      word = WEIRD_WORDS[word.downcase] ||
        (!first_word && SMALL_WORDS[word.downcase]) ||
        word.capitalize
      first_word = false
      word
    end.join(" ")
  end

end

