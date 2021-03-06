# frozen_string_literal: true

class IssuesDashboard < Sinatra::Base
  set :bind, '0.0.0.0'
  set :port, 4567

  configure :development do
    register Sinatra::Reloader
    set :logging, true
  end

  get '/' do
    @issues = if params[:cache] == 'false'
                IssueList.new.list_sorted
              else
                IssueList.new(cache: true).list_sorted
              end
    erb :index
  end

  get '/wip' do
    erb :wip
  end

  get '/archived' do
    erb :archived
  end

  get '/summary' do
    content_type "application/json"
    erb :summary, layout: nil
  end
end
