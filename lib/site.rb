require 'json'
require 'chronic'
require 'views'
require 'schedule'
require 'util'
require 'track'
# add "public/lessons" dir to Ruby load path
$: << Track.tracks_dir
require_all Track.tracks_dir # todo: remove once all foo.rb track files are in foo/foo.rb subdirs

require 'pathname'
#todo: move this into a unit tested Track method
lesson_dirs = Dir['public/lessons/*'].select{|f| File.directory? f}
lesson_dirs.each do |path|
  lesson_dir_path = Pathname.new(path)
  lesson_name = lesson_dir_path.basename
  lesson_file_in_dir = File.join(lesson_name, "#{lesson_name}.rb")
  lesson_file_on_disk = File.join(lesson_dir_path, "#{lesson_name}.rb")
  if File.exist? lesson_file_on_disk
    # puts "requiring #{lesson_file_in_dir}"
    require lesson_file_in_dir
  end
end

class Site < Thing
  def host? hostname
    [self.hostname].flatten.detect do |possible_hostname|
      hostname.end_with? possible_hostname
    end
  end

  def href
    "/lessons"
  end

  def tracks
    raise("You must override the tracks method in your Site subclass")
  end

  def schedule
    schedule_file = "#{self.class.name.underscore}-schedule.json"
    Schedule.from_file path: File.join(__dir__, schedule_file), site: self
  end

  def track_named name
    tracks.detect {|track| track.name == name || track.name == name.gsub('-', '_')}
  end

  def lesson_named path
    path = path.sub(/^\//, '')
    track_name, lesson_name = path.split('/')
    track_named(track_name).lesson_named(lesson_name)
  end

  def navbar
    navbar_class.new(site: self)
  end

  def navbar_class
    self.class.const_get('NavBar') || NavBar
  end

  # todo: Test
  def projects
    require 'projects'
    # for now, just get all projects ever
    Projects.new(projects: Project.all)
  end

  def all_things
    tracks.map do |track|
      track.all_things
    end.flatten.compact.uniq
  end

  def google_calendar_id
    "M2w3Mmc5YWV0cXJsdWgycDhqc2lsY2NoZDBAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ"
  end
end

require 'bootcamp'
require 'javascript_after_hours'
require 'code_like_this'
require 'curriculum'
require 'taste'
