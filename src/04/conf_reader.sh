#!/bin/bash

read_conf() {
    i=0
    while [[ $i -lt 4 ]]; do
        line_num=$((i+1))
        value=$(sed -n "${line_num}p" color.conf | cut -d '=' -f2 | tr -d '[:space:]')
        if [[ "$value" =~ ^[1-6]$ ]]; then
            result[$i]=$value
        else
            result[$i]=${defaults[$i]}
        fi
        i=$((i + 1))
    done
}
