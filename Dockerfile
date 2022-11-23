FROM ruby:3.1.2-alpine

RUN apk add --no-cache build-base postgresql postgresql-dev libpq

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN gem install bundler -v 2.3.26 && bundle install -j4 --quiet
COPY . /app

EXPOSE 2300
