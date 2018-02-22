require 'erector'
require 'thing'

class Project < Thing
  attr_reader :optional

  def href
    # todo: figure out href based on type of project
    # -- CLT or CC or FCC or what
    @href
  end

  def link_view
    Link::View.new(target: self)
  end
end
