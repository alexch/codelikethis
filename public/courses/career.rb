require "course"

class Course
  Career = Course.new(
      name: "career",
    ) do
    lesson "linked_in"
    lesson "resume_building"
    lesson "coding_interviews"
    lesson "money" # freelance vs salary, negotiating, etc
  end
end
