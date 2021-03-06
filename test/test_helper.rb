require 'rubygems'
require "minitest/autorun"

require 'simplecov'

SimpleCov.command_name 'test:units'
SimpleCov.start do 
  add_filter 'test/'
end

begin
  require 'turn'
rescue LoadError
end

require 'whmcs-api'

WHMCS.configure do |config|
  config.api_username = ENV['WHMCS_USER'] or raise "You must set the env variable WHMCS_USER"
  config.api_password = ENV['WHMCS_PASS'] or raise "You must set the env variable WHMCS_PASS"
  config.api_url = ENV['WHMCS_URL']  or raise "You must set the env variable WHMCS_URL"
  config.api_key = ENV['WHMCS_KEY'] or raise "There must be a present key for WHMCS_KEY"  
end
