FROM ruby:3.1.2-alpine3.15

ENV LANG C.UTF-8 \
    TZ Asia/Tokyo

ENV APP_HOME /app

ENV BUILD_PACKAGES="build-base" \
    DB_PACKAGES="sqlite-dev postgresql-dev" \
    RAILS_PACKAGES="tzdata nodejs imagemagick" \
    FAVORITE_PACKAGES="less" 

RUN apk update && \
    apk upgrade && \
    apk --update --no-cache add \
        ${BUILD_PACKAGES} \
        ${DB_PACKAGES} \
        ${RAILS_PACKAGES} \
        ${FAVORITE_PACKAGES} \
        bash \
        git \
        curl \
        imagemagick

WORKDIR /${APP_HOME}

RUN gem install bundler -v 2.3.14

RUN echo "gem: --no-document" >> ~/.gemrc
RUN gem install rails -v 7.0.4

COPY Gemfile \
     Gemfile.lock \
     /${APP_HOME}/

RUN bundle _2.3.14_ config set --local without 'production'
RUN bundle _2.3.14_ install --jobs=4

# https://github.com/bundler/bundler/issues/6154
ENV BUNDLE_GEMFILE="/app/Gemfile"


