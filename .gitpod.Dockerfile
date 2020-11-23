FROM gitpod/workspace-full:latest

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN gem install bundler -v 2.1.4
RUN bundle install

COPY package.json package.json
COPY yarn.lock yarn.lock

RUN yarn install --check-files
