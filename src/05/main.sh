#!/bin/bash

dir=$1

if [ -f dir_analyze.sh ]; then
    if [[ $# -eq 1 ]]; then
        if [[ -d "$dir" ]]; then
            . ./dir_analyze.sh
            start=$(date +%s.%N)
            dirs_count $dir
            top_5_folders $dir
            files_count $dir
            file_types $dir
            top_10_files $dir
            top_10_exec $dir
            stop=$(date +%s.%N)
            duration=$( echo "$stop - $start" | bc)
            if ! [[ $(echo "$duration" | cut -d '.' -f 1) ]]; then
                echo "Script execution time (in seconds) = 0$duration"
            else
                echo "Script execution time (in seconds) = $duration"
            fi
        else
            echo "Directory $1 not found"
        fi
    else
        echo -e "1 parameter must be entered\nUsage: bash main.sh <dir_name>"
    fi
else
    echo "dir_analyze.sh not found"
fi