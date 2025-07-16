#!/bin/bash

dirs_count(){
    path="$1"
    count=$(( $(find "$path" -type d 2>/dev/null | wc -l) - 1 ))
    echo "Total number of folders (including all nested ones) = ${count}"
}

top_5_folders() {
    path="$1"
    counter=1
    
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
    du -h "$path" 2>/dev/null | sort -rh | head -n 6 | while read size dir; do
        if [[ "$dir" != "$path" ]] && [[ $counter -le 5 ]]; then
            echo "$counter - $dir, ${size}B"
            ((counter++))
        fi
    done
}

files_count(){
    path="$1"
    count=$(find "$path" -type f 2>/dev/null | wc -l)
    echo "Total number of files = ${count}"
}

file_types(){
    path="$1"
    echo "Number of:"
    configs=$(find "$path" -type f -name "*.conf" 2>/dev/null | wc -l)
    echo "Configuration files (with the .conf extension) = $configs"
    texts=$(find "$path" -type f -name "*.txt" 2>/dev/null | wc -l)
    echo "Text files = $texts"
    exec_files=$(find "$path" -type f -executable 2>/dev/null | wc -l)
    echo "Executable files = $exec_files"
    logs=$(find "$path" -type f -name "*.log" 2>/dev/null | wc -l)
    echo "Log files (with the extension .log) = $logs"
    archives=$(find "$path" -type f \( -name "*.zip" -o -name "*.tar*" -o -name "*.rar" -o -name "*.gz" -o -name "*.7z"\) 2>/dev/null | wc -l)
    echo "Archive files = $archives"
    sym_links=$(find "$path" -type l 2>/dev/null | wc -l)
    echo "Symbolic links = $sym_links"
}

top_10_files() {
    path="$1"
    counter=1
    
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
    find "$path" -type f -exec du -h {} + 2>/dev/null | sort -rh | head -n 10 | while read -r size file; do
        filename=$(basename "$file")
        ext="${filename##*.}"
        if [[ "$filename" == "$ext" ]]; then
            echo "$counter - $file, ${size}B"
        else
            echo "$counter - $file, ${size}B, $ext"
        fi
        ((counter++))
    done
}

top_10_exec() {
    path="$1"
    counter=1
    
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
    find "$path" -type f -executable -exec du -h {} + 2>/dev/null | sort -rh | head -n 10 | while read -r size file; do
        echo "$counter - $file, ${size}B, $(md5sum "$file" | cut -d ' ' -f 1)"
        ((counter++))
    done
}
