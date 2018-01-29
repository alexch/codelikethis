require 'erector'
require 'thing'

class Lab < Thing

  attr_reader :name, :href

  def href
    @href || "http://testfirst.org/live/learn_ruby/#{name}"
  end

  def view
    View.new(target: self)
  end

  class View < Erector::Widget
    needs :target

    def content
      a.lab.button @target.display_name, href: @target.href
    end
  end

end

