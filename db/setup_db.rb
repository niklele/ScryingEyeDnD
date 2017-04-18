require 'sequel'
require 'pg'
require 'dotenv/load'

DB = Sequel.connect(ENV['DATABASE_URL'])

if !DB.table_exists?(:spells)
    puts 'creating spells table'
    DB.create_table :spells do
        primary_key :id
        String :name
    end
end