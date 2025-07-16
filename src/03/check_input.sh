#!/bin/bash

correct_input(){
    flag=1
    if [ $# -eq 4 ]; then
        params_check "$@"
        all_nums=$?
        if [ $all_nums -eq 0 ]; then
            if [ $1 -ne $2 ] && [ $3 -ne $4 ]; then
                flag=0
            else 
                echo "Error: background and font parameters should not match"
            fi
        else
            echo "Error: all parameters shold be numbers between 1 and 6"
        fi
    else 
        echo "Error: need to specify 4 parameters"
    fi

    return $flag
}

params_check(){
    false=0
    for param in "$@"; do
        if ! [[ "$param" =~ ^[1-6]$ ]]; then
            false=1
        fi
    done
    return $false
}

next_try(){
    read -p "Try again? (y/n)" answer
    if [[ "$answer" =~ ^[Yy]$ ]]; then

        read -p "Enter 4 parameters: " color1 color2 color3 color4
        bash main.sh $color1 $color2 $color3 $color4 
    fi
}