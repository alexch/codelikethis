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
    h2 "Licensing and Donations"
    p "Please click the 'Donate' button in the top right corner to support this project financially."
    p "I intend to make the vast majority of these materials open source, and completely free for either personal use or open workshops."
    p "If you're using them to teach a class that you're getting paid for, I ask for a donation of $25 (or more) per student in your class."
  end

  def lesson lesson_name
    Lesson.new(self, lesson_name)
  end

end
