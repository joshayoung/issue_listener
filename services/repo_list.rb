# frozen_string_literal: true

class RepoList
  include Helpers

  def initialize(cache)
    @cache = cache
  end

  def list
    @list ||= all_repos.map { |repo| Repo.new(repo) }
  end

  def all_repos
    if @cache
      if LocalFile.new.written?('cache/repos.txt')
        return LocalFile.new.read('cache/repos.txt')
      else
        LocalFile.new.write('cache/repos.txt', the_repos)
        return LocalFile.new.read('cache/repos.txt')
      end
    end
    JSON.parse(the_repos)
  end

  def the_repos
    @all_repos ||= begin
      repos = HTTParty.get(ENV['REPOS'], headers: authorization_header)
      repos.body
    end
  end
end
