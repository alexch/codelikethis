require 'erector'

class Lab < Erector::Widget

  attr_reader :name

  def initialize course, name, href: nil
    @course, @name = course, name
    @href = href
  end

  def display_name
    name.titleize
  end

  def content
    a.lab.button display_name, href: href
  end

  def href
    @href || "http://testfirst.org/live/learn_ruby/#{name}"
  end

end
