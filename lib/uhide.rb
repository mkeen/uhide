require 'rubygems'
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
require 'yaml'
require 'io/console'
require 'securerandom'

Bundler.require(:default)

module Uhide
  
end

require_relative "uhide/main"
