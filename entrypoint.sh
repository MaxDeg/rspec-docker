#!/bin/bash

cp /specs/* /app/tests/spec/

ruby -S gem install bundler
ruby -S bundle install

INPUT_LOGS=/app/data/output.log ruby -S bin/rspec
