#!/bin/bash

carousel() {

    local animated="$1"

    while true; do

        for file in "$ASSETS_DIR"/*.txt; do

            if [[ "$animated" == "true" ]]; then

                show_ascii_colors "$file" 5

            else

                clear
                show_ascii "$file"
                sleep 5

            fi

        done

    done

}
