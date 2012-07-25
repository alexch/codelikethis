require 'sinatra/base'
require 'erector'

here = File.expand_path(File.dirname(__FILE__))
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
    AppPage.new.to_html
  end

  get "/lessons/:course" do
    AppPage.new(:widget => course).to_html
  end

  get "/lessons/:course/:file.:ext" do
    here = File.expand_path(File.dirname(__FILE__))
    send_file(File.join(here, "public", "lessons", params[:course], "#{params[:file]}.#{params[:ext]}"))
  end

  get "/lessons/:course/:lesson" do
    AppPage.new(:widget => lesson).to_html
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

