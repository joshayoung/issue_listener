# frozen_string_literal: true

class IssuesDashboard < Sinatra::Base
  get '/' do
    @issues = IssueList.new(override: false).list
    erb :index
  end
end
