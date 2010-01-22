require File.join(File.dirname(__FILE__), 'vendor', 'gems', 'environment')
Bundler.require_env ENV['RACK_ENV']

require 'app'
run App
