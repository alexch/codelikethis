def require_all(in_dir)
  Dir[File.join(File.absolute_path(in_dir), '**/*.rb')].each do |file|
    file.slice! /^#{in_dir}\//
    file.slice! /\.rb$/
    require file
  end
end

