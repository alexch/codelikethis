require 'erector'
require 'active_support'
require 'deck'

class Lesson < Erector::Widget

  attr_reader :name

  def initialize course, name
    @course, @name = course, name
  end

  def display_name
    name.titleize
  end

  def content
    widget Breadcrumbs, :parents => [Courses.new, @course], :display_name => display_name

    slides.each do |slide|
      widget slide
    end

  end

  def slides
    here = File.expand_path(File.dirname(__FILE__))
    project = File.expand_path("#{here}/..")
    slides = Deck::Slide.from_file File.new("#{project}/public/lessons/#{@course.name}/#{@name}.md")
  end

end
