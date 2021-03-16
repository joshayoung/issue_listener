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
      if LocalFile.new.written?('repos.txt')
        return LocalFile.new.read('repos.txt')
      else
        LocalFile.new.write('repos.txt', the_repos)
        return LocalFile.new.read('repos.txt')
      end
    end
    JSON.parse(the_repos)
  end

  def the_repos
    @all_repos ||= begin
      binding.pry
      repos = HTTParty.get(ENV['REPOS'], headers: authorization_header)
      repos.body
    end
  end
end
