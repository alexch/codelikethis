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

task :build_css do
  public_dir = "public"
  css_dir = File.join public_dir, "css"
  sass_dir = File.join public_dir, "scss"
  images_dir = File.join public_dir, "images"
  javascripts_dir = File.join public_dir, "js"
  bootstrap_dir = File.join sass_dir, "bootstrap-4.3.1/scss"

  puts "Building CSS..."
  scss_file = File.join(sass_dir, "app.scss")
  css_file = File.join(css_dir, "app.css")

  if File.mtime(scss_file) > File.mtime(css_file)
    sh(["bin/sass",
      "--load-path #{bootstrap_dir}",
      "--style compressed",
      "--line-comments",
      scss_file,
      css_file,
     ].join(" "))
  else
    puts "Skipping CSS build; to force build, do this:"
    puts "touch #{scss_file}"
  end

end

desc "build app"
task :build => [
  :build_css] do
  puts "Built."
end

desc "run app and keep building and running it"
task :rerun do
  cmd = %w{bundle exec rerun -- rackup}
  sh *cmd
end

desc "run app"
task :run => :build do
  sh "bundle exec rackup"
end
