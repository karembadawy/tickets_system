#!/bin/bash

set -xe;

bundle install

rm -rf /home/tickets_system/app/tmp/pids/server.pid;

# any initializing commands
rails db:create

echo '[+] starting up...'

exec "$@"
