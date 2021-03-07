# frozen_string_literal: true

class RepoList
  def initialize; end

  def list
    names = []
    @list ||= begin
      all_repos.each do |resp|
        names << Repo.new(resp)
      end
      names
    end
  end

  def all_repos
    @all_repos ||= begin
      repos = HTTParty.get(ENV['REPOS'], headers: authorization_header)
      JSON.parse(repos.body)
    end
  end

  def authorization_header
    { 'Authorization' => "token #{ENV['TOKEN']}" }
  end
end
