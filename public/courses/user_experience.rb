require "course"

class Course
  UserExperience = Course.new(
      name: "user_experience",
    ) do
    lesson "The Design Of Everyday Things"
    lesson "Information Architecture and Site Maps"
    lesson "Wireframes and Mockups"
    lesson "Paper Prototypes"
  end
end
