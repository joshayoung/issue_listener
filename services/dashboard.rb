class Dashboard
  attr_accessor :repo, :url, :issues

  def initialize(repo:, issues:)
    @repo = repo.name
    @url = repo.url
    @issues = issues
  end

  def count
    issues.count
  end

  def issues?
    issues.count.positive?
  end
end
