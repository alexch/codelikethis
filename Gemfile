source 'https://rubygems.org'
ruby '2.3.3'

gem "sinatra"
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

# gem "deckrb", path: "gems/deck.rb"  # for local development
gem "deckrb", git: "https://github.com/alexch/deck.rb.git"

group :development, :test do
  gem "rerun", git: "https://github.com/alexch/rerun.git"
  # gem "rerun", path: "../rerun"  # for local development

  gem "listen"
  gem 'wdm', '>= 0.1.0' if Gem.win_platform?
  gem "rspec"
  gem "rake", ">=10.0.1"
  gem "wrong", git: "https://github.com/alexch/wrong.git"
  gem "files"
end

# odd fixed versions, for Windows
gem "nokogiri", "~>1.7"
