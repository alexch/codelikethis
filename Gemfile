source 'https://rubygems.org'
ruby '2.4.4'

gem "sinatra", "~> 2.0.1"
gem "erector", ">=0.9.0"
gem "thin"
gem "activesupport"
gem "coderay"
gem "json", "~>1.8"
gem "rack-codehighlighter"
gem "rack-rewrite", "~>1.5"
gem "sass", "~> 3.5.0"
gem "awesome_print"
gem "chronic"
gem "redcarpet" # todo: , "~> 3.4"

# gem "deckrb", path: "../deck.rb"  # for local development
gem "deckrb", git: "https://github.com/alexch/deck.rb.git"

group :development, :test do
  gem "rerun", git: "https://github.com/alexch/rerun.git"
  # gem "rerun", path: "../rerun"  # for local development

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
