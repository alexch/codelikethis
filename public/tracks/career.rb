require "track"

class Track
  Career = Track.new(
    name: "career",
    ) do
    lesson name: "linked_in"
    lesson name: "resume_building"
    lesson name: "coding_interviews" do
      link href: "https://technology.cloverhealth.com/how-to-interview-entry-level-software-engineers-daaecf9db97"
      link href: "https://imranontech.com/2007/01/10/why-logic-puzzles-make-good-interview-questions/"
      link href: "https://www.keyvalues.com/culture-queries",
           name: "questions to ask in your job interview",
           description: "a job interview should be two-way. This site helps you think about questions gets a job seeker should ask about the company."
    end

    lesson name: "money" # freelance vs salary, negotiating, etc
    lesson name: "public_speaking"
    lesson name: "contributing_to_open_source"

    link href: 'https://hackernoon.com/how-i-landed-my-post-bootcamp-software-developer-job-in-just-seven-weeks-7b213c1bb867'

    lesson name: 'freelancing_and_consulting'

  end
end
