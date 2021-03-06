# frozen_string_literal: true

class IssuesDashboard < Sinatra::Base
  get '/' do
    @i = Issue.new(override: true).list
    erb :index
  end
end
