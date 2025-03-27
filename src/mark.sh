#!/bin/bash

while [[ $# -gt 0 ]]; do
    case $1 in
        -r|--remove)
            sed -i "" -e "/^$2 /d" "$HOME/.marks"
            shift
            shift
            ;;
        -j|--jump)
            #find mark
            target=$(grep -m1 "^$2 " "$HOME/.marks" | cut -d" " -f2)


            #if backmark exists
            backmark=$(grep -m1 "^backmark " "$HOME/.marks" | cut -d" " -f2)
            if [ ! -z "${backmark}" ]; then
                # echo $backmark
                sed -i "" -e "/^backmark /d" "$HOME/.marks" 2>/dev/null
            fi

            # save backmark
            mark="backmark"
            directory="$(pwd)"
            echo $mark $directory >> "$HOME/.marks"

            #jump to
            cd $target

            shift
            shift
            ;;
        -b|--back)
            #find backmark
            directory="$(pwd)"
            backmark=$(grep -m1 "^backmark " "$HOME/.marks" | cut -d" " -f2)
            # echo $backmark
            sed -i "" -e "/^backmark /d" "$HOME/.marks" 2>/dev/null
            #jump to it
            cd $backmark
            mark="backmark"
            echo $mark $directory >> "$HOME/.marks"
            shift
            ;;
        -e|--edit)
            echo "edit"
            shift
            shift
            ;;
        -l|--list)
            cat "$HOME/.marks"
            shift
            ;;

        *)
            mark=$1 # save mark
            directory="$(pwd)"
            echo $mark $directory >> "$HOME/.marks"
            shift
            ;;
    esac
done

