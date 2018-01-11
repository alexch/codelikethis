require "course"

class Course
  AgileDevelopment = Course.new(
      name: "agile_development",
      abstract: "The term 'Agile' describes many many software development methodologies: systems for designing, developing, and deploying products, and organizing the teams of people that do so in a way that respects their humanity and creativity. What makes a system Agile? What techniques can we use to increase communication, feedback, simplicity, reliability, and transparency? Take this course to find out."
    ) do
    lesson "test_driven" do
      video "tFwAailXjeA"
      video "mzcBfUu15RU"
    end
    lesson "refactoring", abstract: "Refactoring is the process of restructuring existing computer code -- changing its factoring -- without changing its behavior. You probably knew that. But did you know it's also a meditation technique? Improve your practice of mindful coding with this light overview to the Zen of Refactoring."
    lesson "inceptions"
    lesson "planning"
  end
end
