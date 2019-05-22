source 'https://rubygems.org'

gem "sinatra", "~> 2.0.1"
gem "sinatra-contrib", "~> 2.0"
gem "erector", ">=0.9.0"
gem "puma", "~> 3.12"
gem "activesupport", "~> 5.2"
gem "json", "~>1.8"
gem "rack-rewrite", "~>1.5"
gem "sass", "~> 3.5.0"
gem "awesome_print", "~> 1.8"
gem "chronic", "~> 0.10.2"
gem "redcarpet", "~> 2.3"
gem "rack-ssl", "~> 1.4"
gem "barnes", "~> 0.0.7"
gem "nokogiri", "~> 1.7" # fixed versions, for Windows
gem "rack-cache", "~> 1.9.0"
gem "rake", "~> 12.3"
gem "deckrb", git: "https://github.com/alexch/deck.rb.git"

group :development, :test do
  gem "listen", "~> 3.1"
  gem 'wdm', '~> 0.1.0' if Gem.win_platform?
  gem "files", "~> 0.4.0"
  gem "pry", "~> 0.12.2"
  gem "wrong", git: "https://github.com/alexch/wrong.git"
  gem "rerun", git: "https://github.com/alexch/rerun.git"
end

group :test do
  gem "rspec", "~> 3.8"
end
