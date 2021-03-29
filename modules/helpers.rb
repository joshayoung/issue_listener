module Helpers

  def authorization_header(type:)
    return { 'Authorization' => "token #{ENV['TOKEN']}" } if type == "GitHub"
    { 'PRIVATE-TOKEN' => "#{ENV['TOKEN']}" }
  end

  def response(url)
    response = HTTParty.get(url, headers: authorization_header(type: "GitLab"))
    response.body
  end
end
