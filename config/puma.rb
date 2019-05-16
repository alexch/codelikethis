require 'barnes'

workers 4
threads 8, 8
preload_app!

before_fork do
  Barnes.start
end
