FROM ruby:3.0.2

RUN mkdir /chatty
WORKDIR /chatty
COPY Gemfile* ./

RUN gem install bundler
RUN bundle install

COPY . .

# Add a script to be executed every time the container starts.

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh
COPY wait-for-it.sh /usr/bin/
RUN chmod +x /usr/bin/wait-for-it.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]

