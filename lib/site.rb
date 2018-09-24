require 'json'
require 'chronic'
require 'views'
require 'schedule'

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

class Site
  def host? hostname
    [self.hostname].flatten.detect do |possible_hostname|
      hostname.end_with? possible_hostname
    end
  end

  def name
    self.class.name
  end

  def display_name
    name
  end

  def href
    "/lessons"
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

  def navbar
    navbar_class.new(site: self)
  end

  def navbar_class
    self.class.const_get('NavBar') || NavBar
  end

  # todo: Test
  def projects_view
    # for now, just get all projects ever
    ProjectsView.new(projects: Project.all)
  end

  def all_things
    tracks.map do |track|
      track.all_things
    end.flatten.compact.uniq
  end

  class ProjectsView < Erector::Widget
    include Views

    # todo: show which track(s) each project is in
    # todo: sort by schedule
    def content
      h1 "Projects"
      ul do
        @projects.each do |project|
          li do
            widget project.link_view(show_description: true)
          end
        end
      end
    end
  end
end

require 'bootcamp'
require 'javascript_nights'
require 'code_like_this'
