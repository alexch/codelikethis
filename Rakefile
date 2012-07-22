# This Rakefile has all the right settings to run the tests inside each lab
gem 'rspec', '~>2'
require 'rspec/core/rake_task'

task :default => :spec

desc "run tests"
RSpec::Core::RakeTask.new do |task|
  lab = Rake.application.original_dir
  task.pattern = "spec/**/*_spec.rb"
  task.rspec_opts = [
      '-f documentation',
      '-r ./rspec_config'
  ]
  task.verbose = false
end

desc "run app"
task :run do
  sh "rerun rackup"
end
