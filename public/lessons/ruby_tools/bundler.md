!SLIDE subsection

# Bundler Explained

* `Gemfile` is *abstract*
  * should be as general as possible
  * lists top-level gem names
  * each gem may also have a version *range*
    * default range is "any version"
    * `>=` means "greater or equal"
    * `~>` means "approximately"
      * `"~> 1.0.0"` matches 1.0.1 but not 1.1.0

* `Gemfile.lock` is *specific*
  * always generated, never edited by you
  * lists *all* gem names with *exact* versions
    * including dependent gems

* you always check in both `Gemfile` and `Gemfile.lock`
  * same Gemfile.lock => same gems and versions
  * assures consistency between all developers and servers

# `bundle install` vs. `bundle update`

* you usually run `bundle install`
* you occasionally run `bundle update`

# `bundle update`

  * queries the gem repository (usually `rubygems.org`)
  * tries to find the most recent versions of all gems
  * figures out the *best* versions of all gems
    * best = most compatible x most recent
  * rewrites `Gemfile.lock`
  * runs bundle install

# `bundle install`

  * if there is no `Gemfile.lock`, does a `bundle update`
  * if there is `Gemfile.lock`, then:
      * looks for the *specific* version of each gem inside `Gemfile.lock`
      * if not found, tries to download and install it

# `bundle exec`

`bundle exec command`

  * sets up the environment so that *all* and *only* the gems inside `Gemfile.lock` are available
  * then runs `command`

# more help

* `bundle help`
* <http://gembundler.com>
* <http://gembundler.com/gemfile.html>












