require "course"

class Course
  Db = Course.new(name: "db", display_name: 'Databases') do
    goal 'the general history of databases'
    goal 'the relational database model'
    goal 'the "NoSQL" document database model'

    lesson name: 'overview'
    lesson name: 'crud'
    lesson name: 'sql_and_relations'
    lesson name: 'nosql_and_documents'
    lesson name: 'indexes'
    lesson name: 'joins'
    lesson name: 'transactions_and_acid'
    lesson name: 'authorization'
    lesson name: 'triggers_and_stored_procedures'
  end
end
