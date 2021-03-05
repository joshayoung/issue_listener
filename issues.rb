require 'sinatra'
require 'httparty'
require 'sinatra/reloader' if development?
require 'json'
require 'pry-byebug'

get '/' do
  response = HTTParty.get('https://api.github.com/repos/joshayoung/plot-notes/issues')
  test = JSON.parse(response.body).to_s
  test
end
