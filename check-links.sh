#!/usr/bin/env bash

function error_exit {
    echo "$1" >&2   ## Send message to stderr. Exclude >&2 if you don't want it that way.
    exit "${2:-1}"  ## Return a code specified by $2 or 1 by default.
}

which blc >/dev/null || npm install -g broken-link-checker

# launch our own copy of the server in the background
# "--option quiet" tells the server not to log accesses -- without it, a log goes to the terminal despite the 2>&1>file redirect, not sure why, maybe because Thin uses STDOUT instead of $stdout
rackup --host 127.0.0.1 --port 9293 --option quiet 2>&1 1> /tmp/broken-link-server-log &
server_pid=$!

sleep 2

# run BLC https://github.com/stevenvachon/broken-link-checker/
blc --ordered --recursive --exclude-external http://127.0.0.1:9293
blc_exit=$?

# stop the server
kill $server_pid

exit $blc_exit
