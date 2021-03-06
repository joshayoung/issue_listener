# frozen_string_literal: true

get '/' do
  @i = Issue.new.list
  erb :index
end
