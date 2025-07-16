#!/bin/bash

 info_write(){
    file=$(date +"%d_%m_%Y_%H_%M_%S").status
    info_output > "$file"
    echo "info saved to $file"
 }