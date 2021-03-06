# frozen_string_literal: true

require 'sinatra'
require 'httparty'
require 'sinatra/reloader' if development?
require 'json'
require 'pry-byebug'
require 'dotenv'

after_reload do
  puts 'reloaded'
end

Dotenv.load

require './services/repo.rb'
require './services/issue.rb'
require './server'

run Sinatra::Application
