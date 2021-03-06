# frozen_string_literal: true

require 'sinatra'
require 'httparty'
require 'sinatra/reloader' if development?
require 'json'
require 'pry-byebug'
require 'dotenv'
Dotenv.load

require './services/repo.rb'
require './server'
run Sinatra::Application
