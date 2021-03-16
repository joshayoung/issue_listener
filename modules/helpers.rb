module Helpers

  def authorization_header
    { 'Authorization' => "token #{ENV['TOKEN']}" }
  end

  def response(url)
    response = HTTParty.get(url, headers: authorization_header)
    response.body
  end
end
