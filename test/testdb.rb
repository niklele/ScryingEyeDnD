require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require './models/spell'

# put data into spells, cehck that it exists, and remove those rows
def testSpells()
    # title, level, type, time, range, components, duration, description
    spell = Spell.new('title', 1, 'type', 'time', 'range', 'components', 'duration', 'description')
    spell.save

    puts Spell.all
end

testSpells()