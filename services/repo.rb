class Repo
  attr_accessor :name,
                :description,
                :url,
                :tags_url,
                :languages_url,
                :commits_url,
                :issues_url,
                :created_at,
                :updated_at,
                :size,
                :language,
                :has_issues,
                :has_projects,
                :archived,
                :open_issues_count,
                :open_issues

  def initialize(*args)
    @name = args.first['name']
    @description = args.first['description']
    @url = args.first['html_url']
    @tags_url = args.first['tags_url']
    @languages_url = args.first['languages_url']
    @commits_url = args.first['commits_url']
    @issues_url = args.first['issues_url']
    @created_at = args.first['created_at']
    @updated_at = args.first['updated_at']
    @size = args.first['size']
    @language = args.first['language']
    @has_issues = args.first['has_issues']
    @has_projects = args.first['has_projects']
    @archived = args.first['archived']
    @open_issues_count = args.first['open_issues_count']
    @open_issues = args.first['open_issues']
  end

  def issue_link
    issues_url.gsub!('{/number}', '')
  end
end
