FROM ruby:alpine

RUN apk --no-cache add make g++

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile Gemfile.lock $APP_HOME/
RUN bundle install && \
    bundle clean && \
    rm -rf /usr/lib/ruby/gems/*/cache/* && \
    rm -rf /usr/local/bundle/cache/* && \
    rm -rf /usr/local/bundle/bundler/gems/*/.git

VOLUME /usr/local/bundle

ADD app.rb $APP_HOME/
ADD lib $APP_HOME

CMD ["ruby", "app.rb"]
