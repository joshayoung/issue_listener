# frozen_string_literal: true

class IssueList
  def initialize(override: false)
    @override = override
  end

  def repos
    RepoList.new.list
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

  def list
    return static_list if @override

    @val = []
    repos.each do |repo|
      next if repo.open_issues_count == 0

      value = issues(repo)
      # TODO: Fix this so this is not created if empty:
      next if value[:issues].empty?

      @val.push(value)
    end
    @val.sort! { |a, b| b[:count] <=> a[:count] }
  end

  def issues(repo)
    part = {
      repo: repo.name,
      url: repo.url,
      issues: [],
      count: repo.open_issues_count
    }
    response(repo.issue_link).each do |r|
      next if r['author_association'] != 'OWNER'

      part[:issues].push(r['title'])
    end
    part
  end

  def response(url)
    response = HTTParty.get(url, headers: authorization_header)
    JSON.parse(response.body)
  end

  def authorization_header
    { 'Authorization' => "token #{ENV['TOKEN']}" }
  end
end
