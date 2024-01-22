#!/bin/bash

# usage: `harness <executable>`
# output: run the program specified by 'executable' until it exits with a non-zero error code. print 
# the stdout and stderr and the number of runs.

n=0
while true; do
    n=$((n+1))
    eval $1  > outputfile 2>&1
    if [[ $? -ne 0 ]]; then
        echo "failure hapened! ($n runs)"
        cat outputfile
        exit 0
    fi
done
