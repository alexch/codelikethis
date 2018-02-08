class Site
  def host? hostname
    [self.hostname].flatten.detect do |possible_hostname|
      hostname.end_with? possible_hostname
    end
  end
end

require 'bootcamp'
require 'code_like_this'
