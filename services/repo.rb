# frozen_string_literal: true

class Repo
  def initialize; end

  def list
    @list ||= begin
      names = []
      response = HTTParty.get(ENV['REPOS'], headers: { 'Authorization' => "token #{ENV['TOKEN']}" })
      response_body = JSON.parse(response.body)
      response_body.each do |resp|
        name = "#{resp['url']}/issues"
        names << name
      end
      names
    end
  end
end
