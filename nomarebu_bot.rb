#!/usr/bin/env ruby

require 'rubygems'
require 'rubytter'
require 'sequel'

account = YAML.load_file(File.dirname(__FILE__) + "/account.yml")
c = Rubytter.new(account['nomarebu']['login'], account['nomarebu']['password'])
DB = Sequel.connect('sqlite://my.db')

DB.create_table :sakes do
  primary_key :id
  String :brand
end unless DB.table_exists?(:sakes)

sakes = DB[:sakes]
c.update(:post, sakes[:id => rand(sakes.count)]) unless sakes.count == 0
