FROM ruby:3.2.2

WORKDIR /myapp

COPY Gemfile* /myapp/

RUN apt -qq update && apt install -y build-essential

RUN gem update --system && \
    bundle install

COPY . /myapp

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]
