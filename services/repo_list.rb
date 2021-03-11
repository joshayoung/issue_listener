class RepoList
  include Http

  def list
    @list ||= all_repos.map { |a| Repo.new(a) }
  end

  def all_repos
    @all_repos ||= begin
      repos = HTTParty.get(ENV['REPOS'], headers: authorization_header)
      JSON.parse(repos.body)
    end
  end
end
