class IssueList
  include Helpers

  def initialize(override: false)
    @override = override
  end

  def repos
    RepoList.new.list
  end

  def list_sorted
    list.sort! { |a, b| b.count <=> a.count }
  end

  def list
    return static_list if @override

    repos.filter_map { |repo| build_issue_list(repo) }
  end

  def build_issue_list(repo)
    return if repo.no_issues?

    issues = build_issue_array(repo)
    return if issues.count < 1

    Dashboard.new(repo: repo, issues: issues)
  end

  def build_issue_array(repo)
    response(repo.issue_link)
      .filter { |issue| issue['author_association'] == 'OWNER' }
      .map { |custom_issue| Issue.new(custom_issue).title }
  end
end
