require "course"

class Course
  AgileDevelopment = Course.new(name: "agile_development") do
    lesson "test_driven" do
      video "tFwAailXjeA"
      video "mzcBfUu15RU"
    end
    lesson "refactoring"
    lesson "inceptions"
    lesson "planning"
  end
end
