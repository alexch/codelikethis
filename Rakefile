require 'rspec/core/rake_task'

task :default => :spec

desc "run tests"
RSpec::Core::RakeTask.new do |task|
  task.pattern = "spec/**/*_spec.rb"
  task.rspec_opts = [
      '-f documentation',
      '-r ./rspec_config'
  ]
  task.verbose = false
end

task :copy_deck do
  puts "Copying Deck.rb..."
  gems_dir = "gems"
  deckrb_dir = "../deck.rb"
  FileUtils.cp_r deckrb_dir, gems_dir, preserve: true, remove_destination: true
  FileUtils.rm_rf File.join(gems_dir, "deck.rb", ".git")
  FileUtils.rm_rf File.join(gems_dir, "deck.rb", "pkg")
  FileUtils.rm_rf File.join(gems_dir, "deck.rb", ".idea")
end

task :build_css do
  public_dir = "public"
  css_dir = File.join public_dir, "css"
  sass_dir = File.join public_dir, "scss"
  images_dir = File.join public_dir, "images"
  javascripts_dir = File.join public_dir, "js"
  bootstrap_dir = File.join sass_dir, "bootstrap-4.0.0-beta.2/scss"

  puts "Building CSS..."
  sh(["sass",
      "--load-path #{bootstrap_dir}",
      "--line-numbers", # adds comments inside the .css file
      "--line-comments", # creates a .map file
      File.join(sass_dir, "app.scss"),
      File.join(css_dir, "app.css"),
     ].join(" "))
end

desc "build app"
task :build => [
  # :copy_deck, # for local development of deck only
  :build_css] do
  puts "Built."
end

require 'awesome_print'
desc "run app and keep building and running it"
task :rerun do
  cmd = %w{bundle exec rerun -- rake run}
  sh *cmd
end

desc "run app"
task :run => :build do
  sh "rackup"
end
