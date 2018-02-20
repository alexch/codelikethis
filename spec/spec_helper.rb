RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

project_dir = File.expand_path(File.join(File.dirname(__FILE__), ".."))
$: << File.join(project_dir, "lib")
