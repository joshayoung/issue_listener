FROM ruby:2.7.1

WORKDIR /app

COPY Gemfile /app
COPY Gemfile.lock /app

EXPOSE 4567

RUN bundle install

#CMD ["bundle", "exec", "ruby", "--host", "0.0.0.0", "-p", "4567"]
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]