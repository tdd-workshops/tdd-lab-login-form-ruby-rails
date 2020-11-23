FROM gitpod/workspace-full:latest

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install

COPY package.json package.json
COPY yarn.lock yarn.lock

RUN yarn install --check-files
