def require_all(in_dir, recurse: false)
  pattern = recurse ? '**/*.rb' : '*.rb'
  Dir[File.join(File.absolute_path(in_dir), pattern)].sort.each do |file|
    file.slice! /^#{in_dir}\//
    file.slice! /\.rb$/
    require file
  end
end

