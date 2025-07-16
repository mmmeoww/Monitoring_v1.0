#!/bin/bash

check_params_count() {
    flag=0
    if [ $# -ne 1 ]; then 
        flag=1
    else
        flag=0
    fi
    return $flag
}

check_param(){
    flag=0
    if [[ $1 =~ ^[0-9]+$ ]]; then 
        flag=1
    else
        flag=0
    fi
    return $flag
}
