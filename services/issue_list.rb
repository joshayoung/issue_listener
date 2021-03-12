class IssueList
  include Helpers

  def initialize(override: false)
    @override = override
  end

  def repos
    RepoList.new.list
  end

  def list_sorted
    return static_list if @override

    list.sort! { |a, b| b.count <=> a.count }
  end

  def list
    repos.map { |repo| build_dashboards(repo) }
         .filter { |b| !b.nil? }
         .filter(&:issues?)
  end

  def build_dashboards(repo)
    return if repo.no_issues?

    Dashboard.new(repo: repo, issues: build_issue_array(repo))
  end

  def build_issue_array(repo)
    response(repo.issue_link)
      .filter { |issue| issue['author_association'] == 'OWNER' }
      .map { |custom_issue| Issue.new(custom_issue) }
  end
end
