#!/bin/bash

# 填入项目程序名
proc=""

info=$(ps aux | grep ${proc} | grep -v grep)
if [ -z "${info}" ]; then
    echo ${proc} + "doesn't running."
else
    echo ${info}
fi