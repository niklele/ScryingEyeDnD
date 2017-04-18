require 'sequel'
require 'pg'
require 'dotenv/load'

DB = Sequel.connect(ENV['DATABASE_URL'])

# load data from csv

puts 'TODO'