class Site
  def host? hostname
    hostname.end_with? self.hostname
  end
end

require 'bootcamp'
require 'code_like_this'
