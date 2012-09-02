require 'erector'
require 'courses'

class Home < Erector::Widget

  def content
    p {
      a "Alex Chaffee", href: "http://alexchaffee.com"
      text " has been teaching Ruby and JavaScript for years. This site contains his lectures and labs, in outline, slide, and video format."
    }
    p {
      text "Click on "
      a "Lessons", href: "/lessons"
      text " in the nav bar to get started. And I'm updating it every week or so with new videos and notes, so keep checking back!"
    }
  end

  def lesson lesson_name
    Lesson.new(self, lesson_name)
  end

end
