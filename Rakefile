if defined? RSpec

  gem 'rspec', '~>2'
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
end

desc "run app"
task :run do
  sh "rerun rackup"
end
