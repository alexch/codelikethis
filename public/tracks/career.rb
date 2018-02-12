require "track"

class Track
  Career = Track.new(
    name: "career",
    description: "To make coding a career requires a very particular set of skills. In this track, we discuss ways to connect with the community of employers, mentors, partners, job-seekers, and other fellow travelers along the Old Code Road. How to communicate your skills and interests? What new skills could make you more attractive to employers, improve your revenue, or be more fun? How can you improve your workplace? How do you contribute to open-source projects? What about public speaking? Are coding interviews really as grueling as they sound? What are the secrets to success?"
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
