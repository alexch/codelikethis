codelikethis
============

source for Code Like This web site

1. git clone
2. cd codelikethis
3. bundle install
4. rspec spec/
5. rake run
6. open http://localhost:9292

---

SCSS currently built using Compass. Run this all the time in development, or at least once before deploy:

    bundle exec compass watch --time

see http://compass-style.org/help/documentation/configuration-reference/

---

# TODO:

make a Heroku buildpack to run bower install (instead of checking in bower stuff)?

