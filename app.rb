# frozen_string_literal: true

class IssuesDashboard < Sinatra::Base

  set :bind, '0.0.0.0'
  #set :run, true
  set :port, 4567

  configure :development do
    register Sinatra::Reloader
    set :logging, true
  end

  get '/' do
    @issues = if params[:cache] == 'true'
                IssueList.new(cache: true).list_sorted
              else
                IssueList.new.list_sorted
              end
    erb :index
  end
end
