#!/usr/bin/env ruby

require 'rubygems'
require 'rubytter'

account = YAML.load_file(File.dirname(__FILE__) + "/account.yml")
c = Rubytter.new(account['nomarebu']['login'], account['nomarebu']['password'])
s = File.read(File.join(File.dirname(__FILE__), "sake.txt")).split
c.update(s[rand(s.size)])
