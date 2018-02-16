require 'erector'
require 'thing'

class Project < Thing
  def href
    # todo: figure out href based on type of project
    # -- CLT or FCC or what
  end

  def view
    Link::View.new(target: self)
  end
end
