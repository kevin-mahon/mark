#!/bin/bash

while [[ $# -gt 0 ]]; do
    case $1 in
        -r|--remove)
            if [[ "$OSTYPE" == "darwin"* ]]; then
                sed -i "" -e "/^$2 /d" "$HOME/.marks"
            else
                sed -i -e "/^$2 /d" "$HOME/.marks"
            fi
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
                if [[ "$OSTYPE" == "darwin"* ]]; then
                    sed -i "" -e "/^backmark /d" "$HOME/.marks" 2>/dev/null
                else
                    sed -i -e "/^backmark /d" "$HOME/.marks" 2>/dev/null
                fi
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
            if [[ "$OSTYPE" == "darwin"* ]]; then
                sed -i "" -e "/^backmark /d" "$HOME/.marks" 2>/dev/null
            else
                sed -i -e "/^backmark /d" "$HOME/.marks" 2>/dev/null
            fi
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
        -h|--help)
            cat <<STOP

                                            MARKS: 

mark.sh is a utility to mark directories with a short identifier to allow quickly switching between
directories.

To use simply source the script with the relevant argument.

The install.sh script will add bash aliases for sourcing the script with different arguments.


    m <name>    : marks a directory with identifier <name>
    m -j <name> : jump to directory corresponding to identifier <name>
    m -b        : jump back to previous directory
    m -l        : list all marks
    m -r <name> : remove a mark with identifier <name>
    m -h        : displays this text 

STOP
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

