class GitLab
  ATTRIBUTES = %i[name description _links created_at web_url
    open_issues_count
    ].freeze

  attr_accessor(*ATTRIBUTES)

  def initialize(*args)
    ATTRIBUTES.each { |attr| send("#{attr}=", args.first[attr.to_s]) }
  end

  def issue_link
    _links["issues"]
  end

  def url
    web_url
  end

  def no_issues?
    open_issues_count.zero?
  end
end
