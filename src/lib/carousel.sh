#!/bin/bash

carousel() {

    local animated="$1"

    while true; do

          for file in "$ASSETS_DIR"/clubs/*.txt; do

            if [[ "$animated" == "true" ]]; then

                show_ascii_colors "$file" 5

		if [[ $? -ne 0 ]]; then
    			clear
    			return
		fi

            else

                clear
		show_ascii "$file"

			for ((i=0; i<50; i++)); do

    				read -rsn1 -t 0.1 key

    				if [[ "$key" == "q" ]]; then
        				clear
        				return
    				fi

			done
                

            fi

        done

    done

}
