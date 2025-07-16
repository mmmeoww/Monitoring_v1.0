#!/bin/bash

info_output(){
    echo "HOSTNAME = $HOSTNAME"
    echo "TIMEZONE = $(cat /etc/timezone) UTC $(date +%-:::z)"
    echo "OS = $(grep PRETTY_NAME /etc/os-release | cut -d '"' -f2)"
    echo "USER = $USER"
    echo "DATE = $(date +"%-d %B %Y %T")"
    echo "UPTIME =$(uptime -p | cut -d 'p' -f2)"
    echo "UPTIME_SEC = $(cat /proc/uptime | cut -d '.' -f1)"
    echo "IP = $(hostname -I | cut -d ' ' -f1)"
    echo "MASK = $(netstat -r | tail -n 1 | awk '{ print $3 }')"
    echo "GATEWAY = $(ip r | grep default |cut -d ' ' -f3)"
    echo "RAM_TOTAL = $(free -m | grep Mem | awk '{printf "%.3f GB", $2/1024}')"
    echo "RAM_USED = $(free -m | grep Mem | awk '{printf "%.3f GB", $3/1024}')"
    echo "RAM_FREE = $(free -m | grep Mem | awk '{printf "%.3f GB", $4/1024}')"
    echo "SPACE_ROOT = $(df / | grep / | awk '{printf "%.2f MB", $2/1024}')"
    echo "SPACE_ROOT_USED = $(df / | grep / | awk '{printf "%.2f MB", $3/1024}')"
    echo "SPACE_ROOT_FREE = $(df / | grep / | awk '{printf "%.2f MB", $4/1024}')"
}
