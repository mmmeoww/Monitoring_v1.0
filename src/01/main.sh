#!/bin/bash

if [ -f check.sh ]; then
    . ./check.sh

    check_params_count "$@" #send all params
    correct_count=$?

    check_param "$1" #send first param
    correct_param=$?

    if [ $correct_count -eq 0 ] && [ $correct_param -eq 0 ]; then
        echo "$1"
    else
        echo "incorrect parametr or count"
    fi
else
    echo "check.sh not found"
fi