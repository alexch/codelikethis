require "track"

class Track
  Ux = Track.new(
    name: "ux",
    display_name: "User Experience"
  ) do

    lesson name: "what_is_user_experience",
      display_name:"What is User Experience (UX)?" do
      video youtube_id: "Ovj4hFxko7c"
    end

    lesson name: "the_design_of_everyday_things" do
      link href: "https://smile.amazon.com/Design-Everyday-Things-Revised-Expanded/dp/0465050654/"
      link href: "https://smile.amazon.com/Dont-Make-Think-Revisited-Usability/dp/0321965515/"
    end
    lesson name: "principles_of_web_design" do
      link href: "https://shortiedesigns.com/2014/03/10-top-principles-effective-web-design/"
      link href: "https://smile.amazon.com/Dont-Make-Think-Revisited-Usability/dp/0321965515/"
    end
    lesson name: "information_architecture_and_site_maps"
    lesson name: "navigation"
    lesson name: "mockups",
           display_name: "Mockups and Wireframes"
    lesson name: "web_fonts" do
      link href: "https://twitter.com/jamescullen123/status/966672438816858113"
    end
    lesson name: "agile_design"
    lesson name: "user_research" do
      link href: "http://info.carbonfive.com/user-research-guide"
    end
    lesson name: "paper_prototypes"

    lesson name: "accessibility_and_aria" do
      link href: 'https://github.com/turingschool/front-end-curriculum/blob/gh-pages/lessons/module-1/aria-accessibility.md'
        link href: 'https://alistapart.com/article/aria-and-progressive-enhancement'
    end
    lab name: 'FreeCodeCamp "Responsive Web Design - Applied Accessibility"'

  end
end

# https://twitter.com/joeerl/status/951357931559284736

