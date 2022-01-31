#!/bin/bash

# Remove a potentially pre-existing server.pid for Rails.
rm -f /chatty/tmp/pids/server.pid

# Wait for services
/usr/bin/wait-for-it.sh db:3306 -t 0
/usr/bin/wait-for-it.sh redis:6379 -t 0
/usr/bin/wait-for-it.sh elasticsearch:9200 -t 0

cd chatty
# Run Sidekiq

#bundle exec sidekiq &

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
