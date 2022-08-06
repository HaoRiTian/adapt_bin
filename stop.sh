#!/bin/bash

proc=""

function get_pid() {
    if [ -z "$1" ]; then
        echo "please input process name."
        exit 1
    fi
    PID=$(ps aux | grep -E "$1" | grep -v grep | awk '{print $2}')
    echo $PID
}

PID=$(get_pid ${proc})
if [ -z $PID ]; then
    echo "${proc} doesn't running."
    exit 1
fi

echo "the pid is ${PID} of process ${proc}."
kill -15 $PID
while true; do
    PID=$(get_pid ${proc})
    if [ -z $PID ]; then
        echo "${proc} is stop successly!"
    else
        echo "`date +"%F %T"`, waiting ${proc} stop..."
    fi
done
