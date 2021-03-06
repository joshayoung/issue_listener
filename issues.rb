# frozen_string_literal: true

require 'sinatra'
require 'httparty'
require 'sinatra/reloader' if development?
require 'json'
require 'pry-byebug'
require 'dotenv'
Dotenv.load

get '/' do
  output = '<table>'
  repos.each do |url|
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

def repos
  response = HTTParty.get('https://api.github.com/users/joshayoung/repos?per_page=200',
                          headers: { 'Authorization' => "token #{ENV['TOKEN']}" })

  response_body = JSON.parse(response.body)
  names = []
  response_body.each do |resp|
    name = "#{resp['url']}/issues"
    names << name
  end
  names
end
