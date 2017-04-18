require 'sequel'
require 'pg'
require 'dotenv/load'

DB = Sequel.connect(ENV['DATABASE_URL'])

if !DB.table_exists?(:spells)
    puts 'creating spells table'
    DB.create_table :spells do
        String :title, :unique => true
        Integer :level
        String :type
        String :time
        String :range
        String :components
        String :duration
        String :description, :text => true
    end
end