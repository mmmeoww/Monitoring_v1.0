#!/bin/bash

set_color(){
    case $1 in
        1) echo -ne "\033[107m";;  # white bg
        2) echo -ne "\033[41m";;   # red bg
        3) echo -ne "\033[42m";;   # green bg
        4) echo -ne "\033[44m";;   # blue bg
        5) echo -ne "\033[45m";;   # purple bg
        6) echo -ne "\033[40m";;   # black bg
        *) echo -ne "\033[49m";;   # default bg
    esac

    case $2 in
        1) echo -ne "\033[97m";;   # white fg
        2) echo -ne "\033[31m";;   # red fg
        3) echo -ne "\033[32m";;   # green fg
        4) echo -ne "\033[34m";;   # blue fg
        5) echo -ne "\033[35m";;   # purple fg
        6) echo -ne "\033[30m";;   # black fg
        *) echo -ne "\033[39m";;   # default fg
    esac
}

reset_color() {
    echo -ne "\033[0m"
}