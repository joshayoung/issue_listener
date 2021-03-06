# frozen_string_literal: true

class Repo
  attr_accessor :url,
                :tags_url,
                :language,
                :has_issues,
                :has_projects,
                :archived,
                :open_issues_count,
                :open_issues,
                :name,
                :issues_url

  def initialize(*args)
    @url = args.first['html_url']
    @tags_url = args.first['tags_url']
    @language = args.first['language']
    @has_issues = args.first['has_issues']
    @has_projects = args.first['has_projects']
    @archived = args.first['archived']
    @open_issues_count = args.first['open_issues_count']
    @open_issues = args.first['open_issues']
    @name = args.first['name']
    @issues_url = args.first['issues_url']
  end

  def issue_link
    issues_url.gsub!('{/number}', '')
  end
end
