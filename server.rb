# frozen_string_literal: true

get '/' do
  repos = Repo.new.list
  repos = [repos.first, repos.last]
  output = '<table>'
  repos.each do |url|
    response = HTTParty.get(url, headers: { 'Authorization' => "token #{ENV['TOKEN']}" })
    response_body = JSON.parse(response.body)
    response_body.each do |resp|
      author = resp['author_association']
      next if author != 'OWNER'

      title = resp['title']
      output += "<tr><td>#{title}</td></tr>"
    end
  end
  "#{output}</table>"
end
