# frozen_string_literal: true

require 'sinatra'
require 'httparty'
require 'sinatra/reloader' if development?
require 'json'
require 'pry-byebug'
require 'dotenv'

Dotenv.load

require './modules/helpers.rb'
require './services/repo.rb'
require './services/issue.rb'
require './services/dashboard.rb'
require './services/repo_list.rb'
require './services/issue_list.rb'
require './services/local_file.rb'
require './app'

run IssuesDashboard