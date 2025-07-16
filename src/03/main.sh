#!/bin/bash

if [ -f output.sh ] && [ -f setter.sh ] && [ -f check_input.sh ]; then
    . ./check_input.sh
    correct_input "$@"
    input_status=$?
    if [ $input_status -eq 0 ]; then
        . ./output.sh
        info_output $1 $2 $3 $4
    else 
        next_try
    fi
else 
    echo "output.sh/setter.sh/check_input.sh not found"
fi