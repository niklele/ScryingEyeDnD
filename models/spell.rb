require 'sequel'

# This class is for future convenience

DB = Sequel.connect(ENV['DATABASE_URL'])

class Spell < Sequel::Model
end