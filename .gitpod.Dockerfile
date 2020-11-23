FROM gitpod/workspace-full:latest

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install