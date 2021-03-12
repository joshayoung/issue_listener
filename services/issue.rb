class Issue
  ATTRIBUTES = %i(url number title state created_at updated_at author_association body).freeze
  attr_accessor(*ATTRIBUTES)

  def initialize(issue)
    ATTRIBUTES.each do |attr|
      send("#{attr}=", issue[attr.to_s])
    end
  end

  def user_initiated?
    author_association != 'OWNER'
  end
end
