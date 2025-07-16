#!/bin/bash

color_names=([1]="white" [2]="red" [3]="green" [4]="blue" [5]="purple" [6]="black")
defaults=(6 1 2 4)
result=()

if [ -f output.sh ] && [ -f setter.sh ] && [ -f conf_reader.sh ]; then
    . ./output.sh
    . ./conf_reader.sh
        read_conf
    if [ ${result[0]} -ne ${result[1]} ] && [ ${result[2]} -ne ${result[3]} ]; then
        info_output ${result[0]} ${result[1]} ${result[2]} ${result[3]}
        print_color_scheme
    else 
        echo -e "background and font parameters should not match!\nChange color.conf and try again!"
    fi
else 
    echo "output.sh/setter.sh/check_input.sh not found"
fi
