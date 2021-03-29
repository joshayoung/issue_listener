require 'uri'

class RepoList
  include Helpers

  def initialize(cache:, repo_type:)
    @cache = cache
    @repo_type = repo_type
  end

  def repo_type
    host = URI(@repo_type).host
    if host.split('.').count == 1
      return class_name[host.to_sym]
    end

    host = host.split('.')[-2]
    class_name[host.to_sym]
  end

  def class_name
    {
      gitlab: "GitLab",
      github: "GitHub"
    }
  end

  def list
    @list ||= all_repos.map do |repo|
      repo_class = Object.const_get(repo_type)
      repo_class.new(repo)
    end
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
    @the_repos ||= begin
      repos = HTTParty.get(@repo_type, headers: authorization_header)
      repos.body
    end
  end
end
