require 'thing'

class Projects < Thing

  def view
    ProjectsView.new(projects: @projects)
  end

  class ProjectsView < Erector::Widget
    include Views

    # TODO: show which track(s) each project is in
    # TODO: sort by schedule
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
