require 'sinatra/base'
require 'erector'

here = File.expand_path(File.dirname(__FILE__))

$: << "#{here}/lib"
require "course"
require "lesson"
require "ruby"
require "app_page"

class App < Sinatra::Base
  include Erector::Mixin

  get '/lessons' do
    "<h1>Lessons:</h1>" + Course.new("/lessons/ruby.json").to_list
  end

  get '/' do
    AppPage.new.to_html
  end

  get "/:course" do
    AppPage.new(:widget => course).to_html
  end

  get "/:course/:lesson" do
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

