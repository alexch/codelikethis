require "track"

class Track
  UserExperience = Track.new(
      name: "user_experience",
    ) do
    lesson name: "The Design Of Everyday Things"
    lesson name: "Information Architecture and Site Maps"
    lesson name: "Wireframes and Mockups"
    lesson name: "Paper Prototypes"
  end
end
