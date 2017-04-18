class CreateSpells < ActiveRecord::Migration[5.0]
    def change
    end
    def up
        create_table :spells do |t|
            # title, level, type, time, range, components, duration, description
            t.text :title
            t.int :level
            t.text :type
            t.text :range
            t.text :components
            t.text :duration # TODO change to time
            t.text :description
        end
    end
    def down
        drop_table :spells
    end
end
