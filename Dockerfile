FROM ruby:2.7.1

WORKDIR /app

COPY Gemfile /app
COPY Gemfile.lock /app

EXPOSE 4567

RUN bundle install

# Dev Only:
# ENTRYPOINT ["rerun", "bundle exec rackup -o 0.0.0.0 -p 4567"]

ENTRYPOINT ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]
# CMD ["/bin/bash"]
