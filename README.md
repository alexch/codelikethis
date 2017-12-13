codelikethis
============

source for Code Like This web site

1. git clone
2. cd codelikethis
3. bundle install
4. rspec spec/
5. `rake build` (to compile CSS and copy deck.rb)
6. `rake run` (or `bundle exec rackup` on Windows)
7. open http://localhost:9292

---

SCSS currently built using Sass. Run this all the time in development, or at least once before deploy after you change anything:

    rake build

---

see <todo.md> for some todo items
