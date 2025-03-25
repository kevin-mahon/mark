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
            backmark=$(grep -m1 "^backmark " "$HOME/.marks" | cut -d" " -f2)
            # echo $backmark
            sed -i "" -e "/^backmark /d" "$HOME/.marks"
            #jump to it
            cd $backmark
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

