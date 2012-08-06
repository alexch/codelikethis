require 'erector'
require 'courses'

class Home < Erector::Widget

  def content
    p {
      a "Alex Chaffee", href: "http://alexchaffee.com"
      text " has been teaching Ruby and JavaScript for years. This site contains his lectures and labs, in outline, slide, and video format."
    }
    p {
      text "It's pretty barren at the moment, but click on "
      a "Lessons", href: "/lessons"
      text " in the nav bar to get started."
    }
  end

  def lesson lesson_name
    Lesson.new(self, lesson_name)
  end

end
