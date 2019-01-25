require 'erector'
require 'thing'

class Goal < Thing
  def view
    View.new(target: self)
  end

  class View < Erector::Widget
    needs :target
    attr_reader :target

    def content
      span target.name
    end
  end
end
