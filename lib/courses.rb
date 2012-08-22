require 'erector'

class Courses < Erector::Widget

  def content
    widget Breadcrumbs, display_name: display_name
    ul {
      @courses.each do |course|
        li { a course.display_name, href: course.href }
      end
    }
  end

  def display_name
    "Courses"
  end

  def href
    "/lessons"
  end

end
