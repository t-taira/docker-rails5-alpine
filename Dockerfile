FROM ruby:2.3-alpine

ENV BUILD_PACKAGES="curl-dev ruby-dev build-base bash" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev sqlite-dev postgresql-dev mysql-dev" \
    RUBY_PACKAGES="ruby-json yaml nodejs"

RUN apk update && \
    apk upgrade && \
    apk add --update \
    $BUILD_PACKAGES $DEV_PACKAGES $RUBY_PACKAGES && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /usr/src/app

WORKDIR /app
COPY . /app
EXPOSE 3000

ENV BUNDLE_PATH /bundle
