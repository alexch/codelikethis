RSpec.configure do |configuration|
  configuration.expect_with :rspec do |config|
    config.syntax = %i[should expect]
  end
end

project_dir = File.expand_path(File.join(File.dirname(__FILE__), '..'))
$LOAD_PATH << File.join(project_dir, 'lib')
