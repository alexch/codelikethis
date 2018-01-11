require "course"

Course::Git = Course.new(
    name: "git",
    display_name: "Version Control with Git and GitHub",
    abstract: "Git is very powerful, but also very confusing. This course explores git as a tool"
) do
    lesson "git_basics" # what is VC? and some command-line labs

    lesson "pointers" # maybe rename; back pointers and trees

    lesson "git_workflows" # one user, 'git flow' with deploys, OSS with issues and releases

    lesson "merging" # basics and conflicts

    lesson "github_forks_and_clones"
    lesson "github_pull_requests"
    lesson "github_ci"

    lesson "squashing"
    lesson "rebasing"

end
