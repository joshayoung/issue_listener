class Repo
  ATTRIBUTES = %i(name description url tags_url languages_url commits_url issues_url created_at
                  updated_at size language has_issues has_projects archived open_issues_count
                  open_issues).freeze
  attr_accessor(*ATTRIBUTES)

  def initialize(*args)
    ATTRIBUTES.each do |attr|
      send("#{attr}=", args.first[attr.to_s])
    end
  end

  def issue_link
    issues_url.gsub!('{/number}', '')
  end

  def no_issues?
    open_issues_count.zero?
  end
end
