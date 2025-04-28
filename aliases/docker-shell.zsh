#!/usr/bin/env zsh

function docker-shell() {
	if [[ -z "$1" ]]; then
	  echo "Error: Missing required argument."
	  echo "Usage: $0 <docker service>"
	  return 1
	fi

	docker compose exec "$1" bash
}

function _docker-shell_completion() {
	local -a first_arg_options=(
		"node"
		"web"
	)

  	if (( CURRENT == 2 )); then
    		compadd "${first_arg_options[@]}"
  	fi
}

compdef _docker-shell_completion docker-shell
