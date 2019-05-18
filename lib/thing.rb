require 'active_support/inflector'
require 'awesome_print'

# abstract base class for items that can be initialized
# via the DSL, like Track, Lesson, Lab
class Thing
  # every Thing has a name
  attr_reader :name
  # every Thing has a display name
  attr_reader :display_name
  # every Thing might have a description
  attr_reader :description
  # # every Thing might have topics
  attr_reader :topics

  # todo: check keys against "contains" per-subclass attribute list

  def initialize **options, &block
    @things = [] # this thing's child things

    #TODO: test
    options = {name: options} if options.is_a? String

    options.each_pair do |key, value|
      instance_variable_set("@#{key}", value)
      # ap("@#{key}=#{value}")
    end

    instance_eval &block if block
  end

  # todo: make these equality functions respect "contains" ivars
  def ==(other)
    other.class == self.class and other.name == name
  end

  def <=>(other)
    self.name <=> other.name
  end

  # This should not be necessary -- the docs for object.c say
  # "The <code>eql?</code> method returns <code>true</code> if +obj+ and
  # +other+ refer to the same hash key."
  # but apparently the base class doesn't do that, instead just comparing
  # object pointers -- see https://github.com/ruby/ruby/edit/trunk/object.c#L205
  def eql?(other)
    self.hash == other.hash
  end

  def hash
    [self.class, self.name].hash
  end

  def name # if no name, use class name
    @name || self.class.name.underscore
  end

  def display_name # if no display name, use name
    @display_name || titleized(name)
  end

  def type_name
    @type_name || self.class.name.split('::').last
  end

  def description?
    !!@description
  end

  def all_things
    @things.map do |child_thing|
      [child_thing] + child_thing.all_things
    end
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
      self.things_of_class(thing_class)
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

  def things_of_class(thing_class, things = @things)
    things.select {|thing| thing.is_a? thing_class}
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
    ARGV
    ARIA
    CI
    CodeCademy
    CLI
    CSS
    CGI
    DOM
    ECMAScript
    FreeCodeCamp
    freeCodeCamp:
    GitHub
    HTML
    HTML5
    HTTP
    JavaScript
    jQuery
    JS
    JSX
    JSON
    LinkedIn
    MVC
    NodeJS
    NoSQL
    PR
    PRs
    RegExp
    RegEx
    SEO
    SQL
    TDD
    XP
    WWW
  ]

  HYPHENATES = %w[
    Object-Oriented
    Client-Side
    Server-Side
  ]

  ALIASES = {
      "oo" => "Object-Oriented",
      "js" => "JavaScript"
  }

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

  def link_view show_description: false
    Link::View.new(target: self, show_description: show_description)
  end

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
      (prefix, word) = word.scan(/^(["']*)(.*)$/).flatten

      word = WEIRD_WORDS[word.downcase] ||
        ALIASES[word.downcase] ||     # todo: test ALIASES
        (!first_word && SMALL_WORDS[word.downcase]) ||
        word.capitalize
      first_word = false

      prefix + word
    end.join(" ")
  end
end
