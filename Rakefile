require 'dotenv/load'

desc 'create spells table'
task :setup_db do
    ruby 'db/setup_db.rb'
end

desc 'drop spells table'
task :teardown_db do
    ruby 'db/teardown_db.rb'
end

desc 'import spells data from csv'
task :load_db => :setup_db do
    ruby "db/load_db.rb #{ENV['SPELLS_FILE']}"
end

desc 'run tests'
task :test do
    ruby 'test/test_db.rb'
end