#!/usr/bin/env zsh

ZSHRCS_ALIASES_DIR="$HOME/.zshrcs/src/aliases"


mkdir -p "$ZSHRCS_ALIASES_DIR"
for FILE in "$(dirname $(realpath "$0"))/aliases"/*; do
    cp -i "$FILE" "$ZSHRCS_ALIASES_DIR"
done
