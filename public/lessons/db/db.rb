require "track"

class Track
  Db = Track.new(name: "db",
                 display_name: 'Databases',
                 description: "In general terms, a database is a service running alongside your application software that allows your code to save, search, and modify information that will survive past a single run (or session, or instance, or application). This track provides a broad overview of concepts common to all databases, using two particular widely-used database engines -- PostgreSQL and MongoDB -- for illustration and practical examples of relational (SQL) and document (NoSQL) DBs."
  ) do
    goal 'the general history of databases'
    goal 'the relational database model'
    goal 'the "NoSQL" document database model'

    lesson name: 'overview' do
      topic name: "databases"
      topic name: "servers"
      topic name: "application-vs-integration-databases"
      topic name: "connection"
      topic name: "collection"
      topic name: "record"
      topic name: "primary-key"
      topic name: "index"
      topic name: "crud"
      topic name: "create"
      topic name: "read"
      topic name: "update"
      topic name: "delete"
      topic name: "collection"
      topic name: "record"
      topic name: "primary-key"
      topic name: "query-search"
      topic name: "transaction"
      topic name: "blob"
      topic name: "join"
      topic name: "schema"
    end

    # lesson name: 'tables' # in Mongo, "collections"
    # lesson name: 'crud'
    #
    # lesson name: 'sql_and_relations'
    # lesson name: 'nosql_and_documents'
    #
    # lesson name: 'indexes'
    # lesson name: 'seeding_and_migration'

    # NoSQL
    # lesson name: 'documents'

    lesson name: "mongodb" do
      topic name: "document-database"
      topic name: "sharding"
      topic name: "mongodb"
      topic name: "mongodb-shell"
      topic name: "collection"
      topic name: "document"
      link href: "http://mongoosejs.com/", name: "mongoose",
           description: "mongodb object modeling for node.js"
    end

    lesson name: "mongodb_example" do
      topic name: "mongodb"
      topic name: "connection"
      topic name: "callbacks"
      topic name: "til-app"
    end

    lesson name: "mongodb_queries" do
      topic name: "mongodb-queries"
      topic name: "mongodb-shell"

      link href: "https://docs.mongodb.com/manual/tutorial/query-documents/",
           name: "MongoDB 'Query Documents' tutorial"
    end

    lesson name: "mongodb_array_queries" do
      topic name: "mongodb-queries"
      topic name: "mongodb-shell"
    end

    lesson name: 'map_reduce' do
      link href: "https://docs.mongodb.com/manual/core/map-reduce/"
    end

    # SQL
    lesson name: "sql" do
      link href: "https://node-postgres.com/"
      link href: "https://github.com/brianc/node-postgres"
      # link href: 'http://docs.sequelizejs.com/',
      #      name: 'Sequelize',
      #      description: 'a promise-based Object-Relational Mapper for Node.js'
    end

    # lesson name: 'joins'

    # lesson name: 'transactions_and_acid'
    # lesson name: 'security_authentication_and_authorization'
    # lesson name: 'triggers_and_stored_procedures'
    # lesson name: 'replication'
    # lesson name: 'sharding'



  end
end
