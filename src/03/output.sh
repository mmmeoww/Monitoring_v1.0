#!/bin/bash

. ./setter.sh

str_output() {
    set_color $1 $2
    echo -ne "$5"
    reset_color
    echo -ne " = "
    set_color $3 $4
    echo -ne "$6"
    reset_color
    echo -ne "\n"
}

info_output() {
    str_output $1 $2 $3 $4 "HOSTNAME" "$HOSTNAME"
    str_output $1 $2 $3 $4 "TIMEZONE" "$(cat /etc/timezone) UTC $(date +%-:::z)"
    str_output $1 $2 $3 $4 "OS" "$(grep PRETTY_NAME /etc/os-release | cut -d '"' -f2)"
    str_output $1 $2 $3 $4 "USER" "$USER"
    str_output $1 $2 $3 $4 "DATE" "$(date +"%-d %B %Y %T")"
    str_output $1 $2 $3 $4 "UPTIME" "$(uptime -p | cut -d 'p' -f2)"
    str_output $1 $2 $3 $4 "UPTIME_SEC" "$(cat /proc/uptime | cut -d '.' -f1)"
    str_output $1 $2 $3 $4 "IP" "$(hostname -I | cut -d ' ' -f1)"
    str_output $1 $2 $3 $4 "MASK" "$(netstat -r | tail -n 1 | awk '{ print $3 }')"
    str_output $1 $2 $3 $4 "GATEWAY" "$(ip r | grep default |cut -d ' ' -f3)"
    str_output $1 $2 $3 $4 "RAM_TOTAL" "$(free -m | grep Mem | awk '{printf "%.3f GB", $2/1024}')"
    str_output $1 $2 $3 $4 "RAM_USED" "$(free -m | grep Mem | awk '{printf "%.3f GB", $3/1024}')"
    str_output $1 $2 $3 $4 "RAM_FREE" "$(free -m | grep Mem | awk '{printf "%.3f GB", $4/1024}')"
    str_output $1 $2 $3 $4 "SPACE_ROOT" "$(df / | grep / | awk '{printf "%.2f MB", $2/1024}')"
    str_output $1 $2 $3 $4 "SPACE_ROOT_USED"  "$(df / | grep / | awk '{printf "%.2f MB", $3/1024}')"
    str_output $1 $2 $3 $4 "SPACE_ROOT_FREE" "$(df / | grep / | awk '{printf "%.2f MB", $4/1024}')"
}