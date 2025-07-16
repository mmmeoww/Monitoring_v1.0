#!/bin/bash

if [ -f output.sh ] && [ -f writer.sh ]; then
    . ./output.sh
    . ./writer.sh

    info_output
    read -p "Do u wanna write to rhe file? (y/n) " answer
    if [[ "$answer" =~ ^[Yy]$ ]]; then
        info_write
    fi
else 
    echo "output.sh or writer.sh not found"
fi