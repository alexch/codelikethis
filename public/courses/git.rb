require "course"

Course::Git = Course.new(
    name: "git",
    display_name: "Version Control with Git and GitHub",
    abstract: "Git is very powerful, but also very confusing. This course explores git as a tool"
) do
    lesson name: "git_basics" # what is VC? and some command-line labs

    lesson name: "pointers" # maybe rename; back pointers and trees

    lesson name: "git_workflows" # one user, 'git flow' with deploys, OSS with issues and releases

    lesson name: "merging" # basics and conflicts

    lesson name: "github_forks_and_clones"
    lesson name: "github_pull_requests"
    lesson name: "github_ci"

    lesson name: "squashing"
    lesson name: "rebasing"

end
