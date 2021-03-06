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

set :bind, '0.0.0.0'

require './services/repo.rb'
require './services/issue.rb'
require './server'

run Sinatra::Application
