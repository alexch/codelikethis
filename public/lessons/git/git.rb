require "track"

Track::Git = Track.new(
  name: "git",
  display_name: "Version Control with Git and GitHub",
  description: "Git is very powerful, but also very confusing. This track explores git as a tool and as a lifestyle, discussing how to build workflows of increasing complexity for teams of increasing size and varying cohesion -- from a single developer, to tightly-knit application teams and loosely-knit open-source projects."
) do

  link href: "https://try.github.io", name: "Try Github",
       description: "interactive online git demo"
  link href: "http://gitimmersion.com", name: "Git Immersion",
       description: "a guided tour that walks through the fundamentals of git"
  link href: "https://medium.com/@keeayluh/git-all-the-things-a359c23745aa"
  link href: "https://git-scm.com/book"
  link href: "https://vimeo.com/152746496", time: "10 min", name: "Git Demo",
       description: "screencast demo of basic git commands"
  link href: "https://www.freecodecamp.org/news/beaucarnes/how-to-use-GitHub--7mdMGAPL"

  lesson name: "git_intro"

  # one user, 'git flow' with deploys, OSS with issues and releases, feature & story branches
  lesson name: "git_branches" do
    link href: "https://github.com/thoughtbot/guides/tree/master/protocol/git"
    link href: "https://twitter.com/jezhumble/status/982991911937036288"
    link href: "http://www.davefarley.net/?p=247"
  end

  lesson name: "git_basics" # todo: rewrite and distribute to the below lessons

  lesson name: "git_workflows"

  # lesson name: "remotes" # basics, origin vs upstream
  # lesson name: "merging" # basics, conflicts
  # lesson name: "rebasing_and_squashing"

  # should this be a separate "GitHub" track?
  # lesson name: "github"
  lesson name: "github_forks_and_clones"
  lesson name: "github_pull_requests" do
    link href: "https://medium.freecodecamp.org/unlearning-toxic-behaviors-in-a-code-review-culture-b7c295452a3c"
  end

end
