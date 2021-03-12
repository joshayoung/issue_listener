class IssuesDashboard < Sinatra::Base
  get '/' do
    @issues = IssueList.new(override: false).list_sorted
    erb :index
  end
end
