ENV['RACK_ENV'] ||= 'development'
require "rubygems"
require "bundler/setup"
require File.expand_path('main', File.dirname(__FILE__))

run Hak5Notifier