class IssueList
  include Http

  def initialize(override: false)
    @override = override
  end

  def repos
    RepoList.new.list
  end

  def list
    return static_list if @override

    parts = []
    repos.each do |repo|
      issues = []
      response(repo.issue_link).each do |i|
        issue = Issue.new(i)
        next if issue.user_initiated?

        issues.push(issue.title)
      end
      dashboard = Dashboard.new(repo: repo, issues: issues)
      parts.push(dashboard) if dashboard.has_issues?
    end

    parts.sort! { |a, b| b.issues.count <=> a.issues.count }
  end
end
