class IssueList
  include Helpers

  def initialize(cache: nil)
    @cache = cache
  end

  def repos
    RepoList.new(@cache).list
  end

  def list_sorted
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
    my_response(repo.issue_link)
      .filter { |issue| issue['author_association'] == 'OWNER' }
      .map { |custom_issue| Issue.new(custom_issue) }
  end

  def my_response(link)
    JSON.parse(response(link))
  end
end
