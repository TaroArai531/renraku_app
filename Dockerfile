FROM ruby:2.7.3-buster

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       mariadb-client \
                       nodejs \
                       graphviz \
                       yarn && \
    apt-get clean && \
    rm --recursive --force /var/lib/apt/lists/*

RUN mkdir /renraku_app
WORKDIR /renraku_app
COPY Gemfile /renraku_app/Gemfile
COPY Gemfile.lock /renraku_app/Gemfile.lock
RUN bundle install
COPY . renraku_app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
