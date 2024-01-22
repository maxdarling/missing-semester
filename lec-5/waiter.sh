#!/bin/zsh

# basic approach (won't work in separate shells due to diff parent processes)
# sleep 10 &
# pgrep -af "sleep 60" | wait


# given a pid, wait till the process completes.
pidwait() {
    if [[ -z $1 ]]; then
        echo "pidwait: error: no pid passed"; return 1
    fi
    # approach: check if the pid exists with `kill -0`
    echo "waiting for pid $1"
    while true; do
       kill -0 $1 2> /dev/null || return 0 
       sleep 1
    done
}

