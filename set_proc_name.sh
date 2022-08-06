#!/bin/bash

if [ -z $1 ]; then
    echo "please input process name to set in all shell script."
    exit 1
fi

replace="proc=\"$1\""
for file in `ls | egrep "*.sh"`; do
    sed -i "s/proc=\"\"/$replace/g" $file
done
