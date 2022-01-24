FROM ruby:3.0.2

WORKDIR /chatty
COPY Gemfile* ./

RUN gem install bundler
RUN bundle install