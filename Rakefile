require 'rspec/core/rake_task'
require 'rake/notes/rake_task'
require 'sassc'

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
  public_dir = 'public'
  css_dir = File.join public_dir, 'css'
  sass_dir = File.join public_dir, 'scss'
  bootstrap_dir = File.join sass_dir, 'bootstrap-4.3.1/scss'

  puts 'Building CSS...'
  scss_path = File.join(sass_dir, 'app.scss')
  css_path = File.join(css_dir, 'app.css')
  source_map_path = File.join(css_dir, 'app.css.map')

  if !File.exist?(css_path) || File.mtime(scss_path) > File.mtime(css_path)
    scss = File.new(scss_path).read
    engine = SassC::Engine.new(
      scss,
      style: :compressed,
      load_paths: [bootstrap_dir],
      source_map_file: source_map_path,
      source_map_contents: true
    )

    css_output = engine.render
    output_file = File.new(css_path, 'w')
    output_file.write(css_output)

    source_map = engine.source_map
    source_map_file = File.new(source_map_path, 'w')
    source_map_file.write(source_map)
  else
    puts 'Skipping CSS build; to force build, do this:'
    puts "touch #{scss_path}"
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

desc "clean"
task :clean do
  public_dir = "public"
  css_dir = File.join public_dir, "css"
  css_file = File.join(css_dir, "app.css")
  map_file = File.join(css_dir,"app.css.map")
  File.delete(css_file)
  File.delete(map_file)
end
