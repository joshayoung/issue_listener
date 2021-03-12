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

require './modules/http.rb'
require './services/repo.rb'
require './services/issue.rb'
require './services/dashboard.rb'
require './services/repo_list.rb'
require './services/issue_list.rb'
require './app'

run IssuesDashboard
