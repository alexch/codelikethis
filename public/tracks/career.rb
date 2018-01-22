require "track"

class Track
  Career = Track.new(
      name: "career",
    ) do
    lesson name: "linked_in"
    lesson name: "resume_building"
    lesson name: "coding_interviews"

    link href: "https://technology.cloverhealth.com/how-to-interview-entry-level-software-engineers-daaecf9db97"

   
    lesson name: "money" # freelance vs salary, negotiating, etc
  end
end
