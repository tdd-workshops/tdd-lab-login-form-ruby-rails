FROM gitpod/workspace-full:latest

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bash -lc "\
    rvm use 2.6 && \
    gem install bundler -v 2.1.4 && \
    bundle install"

COPY package.json package.json
COPY yarn.lock yarn.lock

RUN bash -lc "yarn install --check-files"
