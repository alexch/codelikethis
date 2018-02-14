require 'json'
require 'chronic'
require 'views'
require 'schedule'

class Site
  def host? hostname
    [self.hostname].flatten.detect do |possible_hostname|
      hostname.end_with? possible_hostname
    end
  end

  def name
    self.class.name
  end

  def schedule
    Schedule.from_file path: File.join(__dir__, "#{self.class.name.underscore}-schedule.json"), site: self
  end

  def track_named name
    tracks.detect {|track| track.name == name}
  end

  def schedule_view
    schedule.view
  end

end

require 'bootcamp'
require 'code_like_this'
