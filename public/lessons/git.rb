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
  link href: "https://git-scm.com/book/en/v2"
  link href: "https://vimeo.com/152746496", time: "10 min", name: "Git Demo",
       description: "screencast demo of basic git commands"

  lesson name: "git_basics" # what is VC? and some command-line labs
  lesson name: "git_history" # maybe rename; back pointers and trees/branches and merges
  lesson name: "git_workflows" # one user, 'git flow' with deploys, OSS with issues and releases, feature & story branches
  link href: "https://github.com/thoughtbot/guides/tree/master/protocol/git"

  lesson name: "merging" # basics and conflicts

  lesson name: "github"

  lesson name: "github_forks_and_clones"
  lesson name: "github_pull_requests"
  lesson name: "github_ci"

  lesson name: "squashing"
  lesson name: "rebasing"

end
