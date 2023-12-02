FROM ruby:3.2-alpine

RUN apk update

RUN apk add build-base

ENV INSTALL_PATH /No5

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile* $INSTALL_PATH/

RUN gem install bundler

RUN bundle install

COPY . $INSTALL_PATH

ENV PATH "${INSTALL_PATH}/bin:${PATH}"
