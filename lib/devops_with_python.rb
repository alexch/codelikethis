require 'erector'
require 'views'

require 'util'
require 'track'
require 'tracks_table'

require 'site'
require 'nav_bar'

class DevopsWithPython < Site

  # base site has all tracks
  def hostname
    ["devops.burlingtoncodeacademy.com", "devops"]
  end

  def tracks
    [
        ::Track::Python,
        ::Track::Devops
    ]
  end

  def view
    View.new(site: self)
  end

  class View < Erector::Widget
    p "work in progress - DevOps with Python class"
  end
end
