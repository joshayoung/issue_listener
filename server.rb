# frozen_string_literal: true

get '/' do
  Issue.new.list
end
