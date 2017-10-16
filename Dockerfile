FROM ruby:2.3.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /zuidlaren
WORKDIR /zuidlaren
RUN apt-get update -qq && apt-get install -y alsa-utils
RUN apt-get update -qq && apt-get install -y mplayer
ADD Gemfile /zuidlaren/Gemfile
ADD Gemfile.lock /zuidlaren/Gemfile.lock
RUN bundle config --global path /bundle
RUN bundle install
ADD . /zuidlaren
