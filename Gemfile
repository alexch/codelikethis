source 'https://rubygems.org'

gem "sinatra", "~> 3.0.4"
gem "sinatra-contrib"
gem "erector", ">=0.9.0"
gem "thin"
gem "activesupport"
gem "json", "~>1.8"
gem "rack-rewrite", "~>1.5"
gem "sass", "~> 3.5.0"
gem "awesome_print"
gem "chronic"
gem "redcarpet" # todo: , "~> 3.4"

# gem "deckrb", path: "../deck.rb"  # uncomment for local development
gem "deckrb", git: "https://github.com/alexch/deck.rb.git"

group :development, :test do
  # gem "rerun", path: "../rerun"  # uncomment for local development
  gem "rerun", git: "https://github.com/alexch/rerun.git"

  gem "listen"
  gem 'wdm', '>= 0.1.0' if Gem.win_platform?
  gem "rake", ">=10.0.1"
  gem "wrong", git: "https://github.com/alexch/wrong.git"
  gem "files", ">=0.4.0"
end

group :test do
  gem "rspec"
end

# odd fixed versions, for Windows
gem "nokogiri", "~>1.7"
