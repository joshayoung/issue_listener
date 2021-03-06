# frozen_string_literal: true

require 'sinatra'
require 'httparty'
require 'sinatra/reloader' if development?
require 'json'
require 'pry-byebug'
require 'dotenv'
require './services/repo.rb'
Dotenv.load

get '/' do
  output = '<table>'
  Repo.new.list.each do |url|
    response = HTTParty.get(url, headers: { 'Authorization' => "token #{ENV['TOKEN']}" })
    response_body = JSON.parse(response.body)
    response_body.each do |resp|
      author = resp['author_association']
      if author == 'OWNER'
        title = resp['title']
        output += "<tr><td>#{title}</td></tr>"
      end
    end
  end
  "#{output}</table>"
end
