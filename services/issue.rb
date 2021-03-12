class Issue
  attr_accessor :url, :number, :title, :state, :created_at, :updated_at, :author_association, :body

  def initialize(issue)
    @url = issue["url"]
    @number = issue["number"]
    @title = issue["title"]
    @state = issue["state"]
    @created_at = issue["created_at"]
    @updated_at = issue["updated_at"]
    @author_association = issue["author_association"]
    @body = issue["body"]
  end
end
