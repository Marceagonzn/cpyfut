#!/bin/bash

club_exists() {

    local file="$ASSETS_DIR/$1.txt"

    [[ -f "$file" ]]

}

club_file() {

    echo "$ASSETS_DIR/$1.txt"

}

list_clubs() {

    echo
    echo "Clubes disponibles"
    echo

    for file in "$ASSETS_DIR"/*.txt
    do

        club=$(basename "$file" .txt)

        case "$club" in

            olimpia)

                echo "⚪⚫ Olimpia"

                ;;

            cerro)

                echo "🔵🔴 Cerro Porteño"

                ;;

            *)

                echo "$club"

                ;;

        esac

    done

    echo

}
