class Issue
  ATTRIBUTES = %i[url web_url number title state created_at updated_at author_association body html_url].freeze
  attr_accessor(*ATTRIBUTES)

  def initialize(issue)
    ATTRIBUTES.each do |attr|
      send("#{attr}=", issue[attr.to_s])
    end
  end

  def url
    @html_url || @web_url
  end

  def html_url
    url
  end

  def showit?
    return true if author_association.nil?

    author_association == "OWNER"
  end

  def user_initiated?
    author_association != 'OWNER'
  end
end
