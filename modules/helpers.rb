module Helpers

  def authorization_header
    { 'Authorization' => "token #{ENV['TOKEN']}" }
  end

  def response(url)
    response = HTTParty.get(url, headers: authorization_header)
    JSON.parse(response.body)
  end

  def static_list
    [
      {
        repo: 'My Repo Name',
        url: 'http://www.test.com',
        issues: %w[
          one
          two
          three
        ]
      },
      {
        repo: 'My Repo Name 2',
        url: 'http://www.test.com',
        issues: %w[
          one
          two
          three
        ]
      }
    ]
  end

end
