FROM ruby:2.7.0

WORKDIR /app

ENV LC_ALL ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LANG ja_JP.UTF-8

# yarnパッケージ管理ツールをインストール
RUN apt-get update && apt-get install -y curl apt-transport-https wget 
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - 
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list 
RUN apt-get update && apt-get install -y yarn

# Node.jsをインストール
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - 
RUN apt-get install nodejs

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler:2.1.4
RUN bundle install

ADD package.json package.json
ADD yarn.lock yarn.lock
RUN yarn install

COPY . .
