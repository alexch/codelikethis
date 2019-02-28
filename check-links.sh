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
function finish() {
    # stop the server softly
    kill $server_pid
    # wait a second then if it's still running, stop it hard
    kill -0 $server_pid 2>/dev/null && sleep 1
    kill -0 $server_pid 2>/dev/null && kill -9 $server_pid 2>/dev/null
}
trap finish EXIT

sleep 2

# run BLC https://github.com/stevenvachon/broken-link-checker/
blc --ordered --recursive --exclude-external http://127.0.0.1:9293
blc_exit=$?

exit $blc_exit
