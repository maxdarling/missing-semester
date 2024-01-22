#!/bin/sh

# make paper and stop commit if it fails.

make
retval=$?
if [ $retval -ne 0 ]; then
    echo "make failed! fix and commit again"
fi
exit $retval
