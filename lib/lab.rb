require 'erector'

class Lab < Erector::Widget

  attr_reader :name

  def initialize course, name
    @course, @name = course, name
  end

  def display_name
    name.titleize
  end

  def content
    a.lab.button "Lab: #{display_name}", href: href
  end

  def href
    "http://testfirst.org/live/learn_ruby/#{name}"
  end

end
