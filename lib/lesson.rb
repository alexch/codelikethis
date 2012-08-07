require 'erector'
require 'active_support'
require 'deck'

class Lesson < Erector::Widget

  external :style, "
  a.slides {
    float: right;
  }
  a.next_lesson {
    float: right;
    margin-right: -1em;
  }
  a.previous_lesson {
    float: left;
    margin-left: -1em;
  }
  a.button {
    padding: .2em .5em;
    border: 1px solid blue;
    background-color: #EEEEF2;
    display: block;
    text-decoration: none;
  }
  div.next_and_previous {
    margin: 2px;
    height: 3em;
  }
  div.footer {
    clear: both;
  }
"

  attr_reader :name

  def initialize course, name
    @course, @name = course, name
  end

  def display_name
    name.titleize
  end

  def content
    a.slides.button "Slides", href: "#{name}.slides"
    widget Breadcrumbs, :parents => [Courses.new, @course], :display_name => display_name

    slides.each do |slide|
      widget slide
    end
    
    div.next_and_previous do
      if next_lesson
        a.button.next_lesson href: next_lesson.name do
          text "Next: "
          text next_lesson.display_name
          text " >>"
        end
      end
      if previous_lesson
        a.button.previous_lesson href: previous_lesson.name do
          text "<< "
          text "Previous: "
          text previous_lesson.display_name
        end
      end
    end
  end

  def slides
    Deck::Slide.from_file File.new(File.join(@course.dir, "#{@name}.md"))
  end
  
  def next_lesson
    @course.next_lesson(name)
  end

  def previous_lesson
    @course.previous_lesson(name)
  end

end
