FROM ruby:2.4

RUN apt-get update
RUN apt-get install -y nodejs

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

# This is a type of documentation, to publish the port, use -p option with docker run
EXPOSE 3000

CMD ["rails", "server", "--binding=0.0.0.0"]
