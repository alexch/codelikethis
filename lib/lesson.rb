require 'erector'
require 'active_support'
require 'deck'

class Lesson < Erector::Widget

  attr_reader :name

  def initialize course, name
    @course, @name = course, name
  end

  def title
    name.titleize
  end

  def content
    h2 {
      span.course {
        a @course.title, href: "/#{@course.name}"  # todo: @course.link_to or something
      }
      text " > "
      span.lesson title
    }

    slides.each do |slide|
      widget slide
    end

  end

  def slides
    here = File.expand_path(File.dirname(__FILE__))
    project = File.expand_path("#{here}/..")
    slides = Deck::Slide.from_file File.new("#{project}/lessons/#{@course.name}/#{@name}.md")
  end

end
