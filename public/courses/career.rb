require "course"

class Course
  Career = Course.new(
      name: "career",
    ) do
    lesson name: "linked_in"
    lesson name: "resume_building"
    lesson name: "coding_interviews"
    lesson name: "money" # freelance vs salary, negotiating, etc
  end
end
