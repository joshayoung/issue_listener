# frozen_string_literal: true

class Issue
  def initialize; end

  def repos
    Repo.new.list
  end

  def list
    output = '<table>'
    repos.each do |url|
      response(url).each do |resp|
        next if resp['author_association'] != 'OWNER'

        title = resp['title']
        output += "<tr><td>#{title}</td></tr>"
      end
    end
    "#{output}</table>"
  end

  def response(url)
    response = HTTParty.get(url, headers: authorization_header)
    JSON.parse(response.body)
  end

  def authorization_header
    { 'Authorization' => "token #{ENV['TOKEN']}" }
  end
end
