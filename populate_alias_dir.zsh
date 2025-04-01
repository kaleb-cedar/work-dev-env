#!/usr/bin/env zsh

ZSHRCS_ALIASES_DIR="$HOME/.zshrcs/src/aliases"


mkdir -p "$ZSHRCS_ALIASES_DIR"
for FILE in "$(dirname $(realpath "$0"))/aliases"/*; do
	if diff -q "$FILE" "$ZSHRCS_ALIASES_DIR/$FILE:t" >/dev/null; then
		echo "\e[1;32m$FILE:t already exists in the same state in your configuration directory.\e[0m"	
	else
		printf "\e[1;33m"
		cp -i "$FILE" "$ZSHRCS_ALIASES_DIR"
		printf "\e[0m"
	fi
done
