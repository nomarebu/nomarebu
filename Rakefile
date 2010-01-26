require File.join(File.dirname(__FILE__), 'vendor', 'gems', 'environment')
Bundler.require_env ENV['RACK_ENV']

namespace :db do
  task :create do
    db = Sequel.connect('sqlite://my.db')
    db.create_table :sakes do
      primary_key :id
      String :brand
    end
  end

  task :import do
    db = Sequel.connect('sqlite://my.db')
    sakes = db[:sakes]
    File.open("sake.txt") do |f|
      f.each do |line|
        sakes.insert(:brand => line)
      end
    end
  end
end
