# frozen_string_literal: true

class IssuesDashboard < Sinatra::Base
  get '/' do
    @issues = if params[:cache] == 'true'
                IssueList.new(cache: true).list_sorted
              else
                IssueList.new.list_sorted
              end
    erb :index
  end
end
