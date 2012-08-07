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

class App < Sinatra::Base
  include Erector::Mixin

  get '/lessons' do
    all_courses = [Ruby, RubyTools, RubyBasics, RubyObjects]
    AppPage.new(:widget => Courses.new(:courses => all_courses + (Course.descendants - all_courses))).to_html
  end

  get '/' do
    AppPage.new(:widget => Home).to_html
  end

  get "/lessons/:course" do
    AppPage.new(:widget => course).to_html
  end

  get "/lessons/:course/:file.:ext" do
    if params[:ext] == "slides"
      # slides are signified with a dot instead of a slash so that relative file references don't break
      file = File.join(course_dir, "#{params[:file]}.md")
      deck_page = Deck::SlideDeck.new(:slides => Deck::Slide.from_file(file))
      deck_page.to_html
    else
      send_file(File.join(course_dir, "#{params[:file]}.#{params[:ext]}"))
    end
  end

  get "/lessons/:course/:lesson" do
    AppPage.new(:widget => lesson).to_html
  end

  error 404 do
    Deck::RackApp.public_file_server.call(env)
  end

  def course_dir
    here = File.expand_path(File.dirname(__FILE__))
    ::File.join(here, "public", "lessons", params[:course])
  end

  def course_class
    begin
      course_class_name = params[:course].split('_').map(&:capitalize).join
      course_class = Object.const_get(course_class_name)
    rescue NameError
      not_found
    end
  end

  def course
    course_class.new
  end

  def lesson
    course.lesson(params[:lesson])
  end

end

