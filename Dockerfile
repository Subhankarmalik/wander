From ruby:3.1.4
COPY . /application
RUN bundle config set --deployment "true"
RUN bundle config set --without "development test"

WORKDIR /application
RUN gem install bundler
RUN bundle install

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
