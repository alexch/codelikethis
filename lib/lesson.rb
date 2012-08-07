require 'erector'
require 'active_support'
require 'deck'

class Lesson < Erector::Widget

  external :style, "a.slides_link {
    float: right;
    padding: .2em 1em;
    border: 1px solid blue;
    background-color: #EEEEF2;
    display: block;
  }"

  attr_reader :name

  def initialize course, name
    @course, @name = course, name
  end

  def display_name
    name.titleize
  end

  def content
    a.slides_link "Slides", href: "#{name}.slides"
    widget Breadcrumbs, :parents => [Courses.new, @course], :display_name => display_name

    slides.each do |slide|
      widget slide
    end

  end

  def slides
    Deck::Slide.from_file File.new(File.join(@course.dir, "#{@name}.md"))
  end

end
