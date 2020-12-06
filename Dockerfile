FROM docker.elastic.co/logstash/logstash-oss:7.10.0

USER root

COPY ./spec /app/tests/spec
COPY ./data /app/tests/data
COPY ./bin /app/tests/bin
COPY ./.rspec /app/tests
COPY ./Gemfile /app/tests
COPY ./Gemfile.lock /app/tests

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

WORKDIR /app/tests

RUN ruby -S gem install bundler
RUN ruby -S bundle install

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "sh" ]