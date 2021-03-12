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
      part = {
        repo: repo.name,
        url: repo.url,
        issues: []
      }
      response(repo.issue_link).each do |i|
        next if i['author_association'] != 'OWNER'

        part[:issues].push(i['title'])
        # TODO: Utilize a combo of 'open_issue_count' and 'author_association' instead of recounting:
        part[:count] = part[:issues].count
      end
      parts.push(part) if part[:issues].count > 0
    end

    parts.sort! { |a, b| b[:count] <=> a[:count] }
  end
end
