class IssueList
  include Http

  def initialize(override: false)
    @override = override
  end

  def repos
    RepoList.new.list
  end

  def list_sorted
    list.sort! { |a, b| b.issues.count <=> a.issues.count }
  end

  def list
    return static_list if @override

    repos.filter_map { |repo| build_issue_list(repo) unless repo.nil? }
  end

  def build_issue_list(repo)
    return if repo.no_issues?

    issues = build_issue_array(repo)

    return if issues.count < 1

    Dashboard.new(repo: repo, issues: issues)
  end

  def build_issue_array(repo)
    issues = []
    response(repo.issue_link).each do |i|
      issue = Issue.new(i)
      next if issue.user_initiated?

      issues.push(issue.title)
    end
    issues
  end
end
