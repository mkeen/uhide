require 'rubygems'
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
require 'yaml'
require 'io/console'
require 'securerandom'
require 'colorize'
require 'active_support'

module Uhide
  
end

require_relative "uhide/main"
