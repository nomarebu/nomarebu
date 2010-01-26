#!/usr/bin/env ruby

require File.join(File.dirname(__FILE__), 'vendor', 'gems', 'environment')
Bundler.require_env ENV['RACK_ENV']

account = YAML.load_file(File.dirname(__FILE__) + "/account.yml")
c = Rubytter.new(account['nomarebu']['login'], account['nomarebu']['password'])

DB = Sequel.connect('sqlite://my.db')
sakes = DB[:sakes]

c.update(sakes[:id => rand(sakes.count)][:brand]) unless sakes.count == 0
