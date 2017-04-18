require 'sequel'
require 'pg'
require 'dotenv/load'

DB = Sequel.connect(ENV['DATABASE_URL'])

if DB.table_exists?(:spells)
    puts 'tearing down spells table'
    DB.drop_table :spells
end
