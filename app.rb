require 'sinatra/base'
require 'erector'
require 'deck/slide'
require 'deck/slide_deck'
require 'deck/rack_app'

here = ::File.expand_path(File.dirname(__FILE__))
lib = "#{here}/lib"
$: << lib

Dir["#{lib}/**/*.rb"].each do |file|
  file.slice! /^#{lib}\//
  file.slice! /\.rb$/
  require file
end

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

  get '/lessons' do
    all_courses = [
        Course::AgileDevelopment,
        Course::Ruby,
        Course::RubyTools,
        Course::RubyBasics,
        Course::RubyBlocks,
        Course::RubyObjects,
        Course::Javascript,
    ]
    courses = Courses.new(:courses => all_courses)
    AppPage.new(:widget => courses, :title => page_title("Lessons")).to_html
  end

  get '/' do
    AppPage.new(:widget => Home, :title => "Code Like This").to_html
  end

  # todo: use Refractor for these redirects
  get '/lessons/test_driven/test_driven' do
    response.redirect '/lessons/agile_development/test_driven'
  end

  get "/lessons/:course" do
    AppPage.new(:widget => course, :title => page_title(course)).to_html
  end

  get "/lessons/:course/:file.:ext" do
    if params[:ext] == "slides"
      # slides are signified with a dot instead of a slash so that relative file references don't break
      file = File.join(course_dir, "#{params[:file]}.md")
      deck_page = Deck::SlideDeck.new(:slides => Deck::Slide.from_file(file),
                                      :title => page_title(lesson, "Slides"))
      deck_page.to_html
    else
      send_file(File.join(course_dir, "#{params[:file]}.#{params[:ext]}"))
    end
  end

  get "/lessons/:course/:lesson" do
    AppPage.new(:widget => lesson, :title => lesson.display_name + " - Code Like This").to_html
  end

  error 404 do
    Deck::RackApp.public_file_server.call(env)
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

