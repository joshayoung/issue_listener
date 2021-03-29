module Helpers

  def authorization_header(type:)
    return { 'Authorization' => "token #{ENV['TOKEN']}" } if type == "github"
    { 'PRIVATE-TOKEN' => "#{ENV['TOKEN']}" }
  end

  def response(url)
    response = HTTParty.get(url, headers: authorization_header(type: ENV["TYPE"]))
    response.body
  end
end
