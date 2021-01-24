FROM ruby:2.7.0

WORKDIR /app

ENV LC_ALL ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LANG ja_JP.UTF-8

RUN apt-get update -qq
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y build-essential nodejs yarn 

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler:2.1.4
RUN bundle install

COPY package.json package.json
COPY yarn.lock yarn.lock
RUN yarn upgrade webpack@^4.0.0 \
    yarn install


COPY . .
