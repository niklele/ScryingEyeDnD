require 'sequel'
require 'pg'
require 'dotenv/load'
require 'csv'

DB = Sequel.connect(ENV['DATABASE_URL'])

CSV.foreach(ARGV[0]) do |e|
    spells = DB[:spells]
    begin
        spells.insert(e)
    rescue Exception => e 
        puts e.message
    end
end