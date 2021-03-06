# frozen_string_literal: true

class IssueList
  def initialize(override: false)
    @override = override
  end

  def repos
    RepoList.new.list
  end

  def static_list
    %w[one two three]
  end

  def list
    return static_list if @override

    @val = []
    repos.each do |url|
      issues(url)
    end
    @val
  end

  def issues(url)
    response(url).each do |resp|
      next if resp['author_association'] != 'OWNER'

      @val << resp['title']
    end
  end

  def response(url)
    response = HTTParty.get(url, headers: authorization_header)
    JSON.parse(response.body)
  end

  def authorization_header
    { 'Authorization' => "token #{ENV['TOKEN']}" }
  end
end
