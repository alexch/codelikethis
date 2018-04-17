require 'json'
require 'chronic'
require 'views'
require 'schedule'

require 'track'
# add "public/lessons" dir to Ruby load path
$: << Track.tracks_dir
require_all(Track.tracks_dir)

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
require 'code_like_this'
