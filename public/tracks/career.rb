require "track"

class Track
  Career = Track.new(
      name: "career",
    ) do
    lesson name: "linked_in"
    lesson name: "resume_building"
    lesson name: "coding_interviews" do

    link href: "https://technology.cloverhealth.com/how-to-interview-entry-level-software-engineers-daaecf9db97"
    end

    lesson name: "money" # freelance vs salary, negotiating, etc
    lesson name: "public_speaking"

  end
end
