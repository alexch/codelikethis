require 'barnes'

workers Integer(ENV['WEB_CONCURRENCY'] || 2)

min_threads = Integer(ENV['MIN_THREADS'] || 1)
max_threads = Integer(ENV['MAX_THREADS'] || 4)
threads min_threads, max_threads

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

before_fork do
  Barnes.start
end
