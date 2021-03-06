# frozen_string_literal: true

class Repo
  def initialize; end

  def list
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
end
