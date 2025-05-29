#!/bin/bash

directory="$(pwd)"
MARK_CMD="alias m='source $directory/mark.sh'"
JUMP_CMD="alias j='source $directory/mark.sh -j'"
BACK_CMD="alias b='source $directory/mark.sh -b'"


SHELL_CONFIG_FILE=""

if [[ "$SHELL" == *"/zsh" ]]; then
  SHELL_CONFIG_FILE="$HOME/.zshrc"
elif [[ "$SHELL" == *"/bash" ]]; then
  SHELL_CONFIG_FILE="$HOME/.bashrc"
else
  echo "Warning: Unknown shell. Appending to .bashrc by default."
  SHELL_CONFIG_FILE="$HOME/.bashrc"
fi

if grep -qF "$MARK_CMD" "$SHELL_CONFIG_FILE"; then
    echo "Line already exists in $SHELL_CONFIG_FILE, not appending."
else
    echo "$MARK_CMD" >> "$SHELL_CONFIG_FILE"
    echo "$JUMP_CMD" >> "$SHELL_CONFIG_FILE"
    echo "$BACK_CMD" >> "$SHELL_CONFIG_FILE"
    echo "Lines appended to $SHELL_CONFIG_FILE"
fi
