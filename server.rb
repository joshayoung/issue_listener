# frozen_string_literal: true

get '/' do
  @i = Issue.new(override: true).list
  erb :index
end
