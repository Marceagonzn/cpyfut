#!/bin/bash

show_menu() {

    options=(
        "Olimpia"
        "Olimpia (Colors)"
        "Cerro Porteño"
        "Cerro Porteño (Colors)"
        "Carousel"
        "Carousel (Colors)"
        "Exit"
    )

    selected=0

    while true; do

        clear

# Verde brillante
tput setaf 2

# Mostrar el banner
while IFS= read -r line; do
    echo "$line"
done < "$ASSETS_DIR/myname.txt"

tput sgr0

echo
echo "────────────────────────────────────────────────────────────"
echo

        for i in "${!options[@]}"; do

            if [[ $i -eq $selected ]]; then
                echo "❯ ${options[$i]}"
            else
                echo "  ${options[$i]}"
            fi

        done

        echo
        echo "↑ ↓ Moverse"
        echo "Enter Seleccionar"
        echo "q Salir"

        read -rsn1 key

        if [[ $key == $'\x1b' ]]; then

            read -rsn2 key

            case "$key" in
                "[A") ((selected--));;
                "[B") ((selected++));;
            esac

            ((selected<0)) && selected=$((${#options[@]}-1))
            ((selected>=${#options[@]})) && selected=0

        elif [[ $key == "" ]]; then

            clear

            case $selected in

                0)
                    show_ascii "$(club_file "olimpia")"
                    ;;

                1)
                    show_ascii_colors "$(club_file "olimpia")" 0
                    ;;

                2)
                    show_ascii "$(club_file "cerro")"
                    ;;

                3)
                    show_ascii_colors "$(club_file "cerro")" 0
                    ;;

                4)
                    carousel false
                    ;;

                5)
                    carousel true
                    ;;

                6)
                    clear
                    return
                    ;;

            esac

            echo
            read -n1 -s -r -p "Presiona cualquier tecla para volver..."

        elif [[ $key == "q" ]]; then

            clear
            return

        fi

    done

}
