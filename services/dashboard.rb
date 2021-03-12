class Dashboard
  attr_accessor :repo, :url, :issues

  def initialize(repo:, issues:)
    @repo = repo.name
    @url = repo.url
    @issues = issues
  end

  def has_issues?
    issues.count.positive?
  end
end
