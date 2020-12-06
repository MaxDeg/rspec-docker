FROM docker.elastic.co/logstash/logstash-oss:7.10.0

USER root

# Define spec directory as volume to enable hot-reload
VOLUME /specs

# Rspec base directory
COPY ./tests /app/tests

WORKDIR /app/tests

# Installing ruby bundler
RUN ruby -S gem install bundler
RUN ruby -S bundle install

# Copying test data
COPY ./data /app/data

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

# ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "sh" ]