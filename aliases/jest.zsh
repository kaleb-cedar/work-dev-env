#!/usr/bin/env zsh

function jest() {
	if [[ -z "$1" ]]; then
	  echo "Error: Missing required argument."
	  echo "Usage: $0 <client-app> [path]"
	  return 1
	fi

	jest_path=${2:-"."}

	docker compose exec node bash -c "cd $1 && yarn jest $jest_path"
}

function _jest_completion() {
  compadd design_system pre_visit_app next_js provider_tools_app
}

compdef _jest_completion jest
