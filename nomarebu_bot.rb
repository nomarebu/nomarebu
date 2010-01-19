#!/usr/bin/env ruby

require 'rubygems'
require 'twitter'

c = Twitter::Client.from_config(File.join(File.dirname(__FILE__), "account.yml"), "nomarebu")
s = File.read(File.join(File.dirname(__FILE__), "sake.txt")).split
c.status(:post, s[rand(s.size)])
