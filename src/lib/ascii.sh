#!/bin/bash

show_ascii() {

    local file="$1"
    local cols=$(tput cols)

    while IFS= read -r line; do

        local pad=$(( (cols - ${#line}) / 2 ))
        (( pad < 0 )) && pad=0

        printf "%*s%s\n" "$pad" "" "$line"

    done < "$file"

}
