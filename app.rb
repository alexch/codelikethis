require 'sinatra/base'
require 'erector'
require 'deck/slide'
require 'deck/slide_deck'
require 'deck/rack_app'

# add "lib" dir to Ruby load path
here = ::File.expand_path(File.dirname(__FILE__))
lib = "#{here}/lib"
$: << lib

require 'util'
require "#{lib}/hash_extensions"
require_all(lib)

module AppHelpers
  def page_title object, extra = nil
    [
      (object.display_name rescue object.to_s),
      extra,
      "- Code Like This"
    ].compact.join(' ')
  end
end

class App < Sinatra::Base
  include Erector::Mixin
  include AppHelpers

  before do
    Thread.current[:development] = (request.host =~ /^localhost/)
  end

  after do
    Thread.current[:development] = nil
  end

  def all_courses
    Courses::ALL
  end

  def courses_widget
    CoursesTable.new(:courses => all_courses)
  end

  get '/lessons' do
    AppPage.new(:widget => courses_widget, :title => page_title("Lessons")).to_html
  end

  get '/' do
    AppPage.new(:widget => Home, :title => "Code Like This").to_html
  end

  get "/lessons/:course" do
    AppPage.new(:widget => course.view, :title => page_title(course)).to_html
  end

  get "/lessons/:course/:file.slides" do
    # slides are signified with a dot instead of a slash so that relative file references don't break
    file = File.join(course_dir, "#{params[:file]}.md")
    slides = Deck::Slide.from_file(file)

    # todo: Extract, move to Courses object
    course = all_courses.detect do |course|
      course.name == params[:course]
    end

    if course
      slides << begin
        slide = Deck::Slide.new(slide_id: '_next')

        lesson = course.lesson_named(params[:file])

        slide << lesson.view.to_html(content_method_name: :labs)
        slide << lesson.view.to_html(content_method_name: :next_lesson_button)
        slide << lesson.view.to_html(content_method_name: :previous_lesson_button)

        slide << "<p><a href='#{lesson.href}'>Outline</a></p>"
        slide
      end
    end

    deck_page = Deck::SlideDeck.new(:slides => slides,
                                    :title => page_title(lesson, "Slides"))
    deck_page.to_html
  end

  get "/lessons/:course/:file.:ext" do
    send_file(File.join(course_dir, "#{params[:file]}.#{params[:ext]}"))
  end

  get "/lessons/:course/:lesson" do
    AppPage.new(:widget => lesson.view, :title => lesson.display_name + " - Code Like This").to_html
  end

  def course_dir
    here = File.expand_path(File.dirname(__FILE__))
    ::File.join(here, "public", "lessons", params[:course])
  end

  def course
    begin
      course_constant_name = params[:course].split('_').map(&:capitalize).join
      course = Course.const_get(course_constant_name)
    rescue NameError
      not_found
    end
  end

  def lesson
    course.lesson_named(params[:lesson] || params[:file])
  end

end

