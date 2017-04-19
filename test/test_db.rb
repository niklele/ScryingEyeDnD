require 'dotenv/load'
require 'sequel'
require 'pg'

require "test/unit"

DB = Sequel.connect(ENV['DATABASE_URL'])

class TestDB < Test::Unit::TestCase

    def test_spells
        assert(DB.table_exists?(:spells), "spells table doesn't exist")

        spells = DB[:spells]

        sleepSpell = spells[:title => 'Sleep']
        assert_not_nil(sleepSpell, 'Should find the spell Sleep')

        assert_equal(1, sleepSpell[:level], 'Sleep should be level 1')
        assert_equal('enchantment', sleepSpell[:type], 'Sleep should be an enchantment')
        assert_equal('1 action', sleepSpell[:time], 'Sleep should take 1 action')
        assert_equal('90 feet', sleepSpell[:range], 'Sleep should have range of 90 feet')

        assert_equal(49, spells.where(:level => 3).count, 'should be 49 level 3 spells')
    end
 
end