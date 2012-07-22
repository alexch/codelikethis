require 'erector'

class Courses < Erector::Widget
  def content
    widget Breadcrumbs, display_name: display_name
    ul {
      @courses.each do |course_class|
        course = course_class.new
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

  def lesson lesson_name
    Lesson.new(self, lesson_name)
  end

end
