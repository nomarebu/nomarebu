#!/usr/bin/env ruby

require File.join(File.dirname(__FILE__), 'vendor', 'gems', 'environment')
Bundler.require_env ENV['RACK_ENV']

account = YAML.load_file(File.dirname(__FILE__) + "/account.yml")
c = Rubytter.new(account['nomarebu']['login'], account['nomarebu']['password'])
DB = Sequel.connect('sqlite://my.db')

DB.create_table :sakes do
  primary_key :id
  String :brand
end unless DB.table_exists?(:sakes)

sakes = DB[:sakes]
c.update(:post, sakes[:id => rand(sakes.count)]) unless sakes.count == 0
