#!/usr/bin/env zsh

function client-build() {
	if [[ -z "$1" ]]; then
	  echo "Error: Missing required argument."
	  echo "Usage: $0 <client-app>"
	  return 1
	fi

	docker compose exec node bash -c "cd $1 && yarn build"
}

function _client-build_completion() {
  compadd design_system pre_visit_app next_js provider_tools_app patient_app widgets
}

compdef _client-build_completion client-build
