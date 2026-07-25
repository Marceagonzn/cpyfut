#!/bin/bash

show_ascii_colors() {

    local file="$1"
    local duration="$2"

    local cols=$(tput cols)

    # Ocultar cursor
    tput civis

    # Restaurarlo al salir
    trap 'tput cnorm; clear; exit' INT TERM

    local start=$(date +%s)

    colors=(
        255 254 253 252 251 250
        249 248 247 246 245 244
        243 242 241 240 239 238
        237 236
        46 47 48 49 50
        49 48 47 46
        82 118 154 190
        226 220 214 208 202 196
        202 208 214 220 226
        190 154 118 82
    )

    clear

    while true; do

        for color in "${colors[@]}"; do

            # Volver arriba sin parpadeo
            tput cup 0 0

            while IFS= read -r line; do

                local pad=$(( (cols - ${#line}) / 2 ))
                (( pad < 0 )) && pad=0

                printf "%*s" "$pad" ""
                printf "\e[38;5;%sm%s\e[0m\n" "$color" "$line"

            done < "$file"

            sleep 0.08

            # Si duration = 0 -> infinito
            if [[ "$duration" != "0" ]]; then

                local now=$(date +%s)

                if (( now - start >= duration )); then
                    tput cnorm
                    return
                fi

            fi

        done

    done

}
