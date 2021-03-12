class RepoList
  include Helpers

  def list
    @list ||= all_repos.map { |repo| Repo.new(repo) }
  end

  def all_repos
    @all_repos ||= begin
      repos = HTTParty.get(ENV['REPOS'], headers: authorization_header)
      JSON.parse(repos.body)
    end
  end
end
