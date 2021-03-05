require 'sinatra'
require 'httparty'
require 'sinatra/reloader' if development?
require 'json'
require 'pry-byebug'

get '/' do
  output = "<table>"
  response = HTTParty.get('https://api.github.com/repos/joshayoung/plot-notes/issues')
  response_body = JSON.parse(response.body)
  response_body.each do |resp|
    author = resp["author_association"]
    if author == "OWNER"
      title = resp["title"]
      output += "<tr><td>#{title}</td></tr>"
    end
  end
  "#{output}</table>"
end
