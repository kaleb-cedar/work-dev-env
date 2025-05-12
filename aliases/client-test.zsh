#!/usr/bin/env zsh

function client-test() {
	if [[ -z "$1" ]]; then
	  echo "Error: Missing required argument."
	  echo "Usage: $0 <client-app>"
	  return 1
	fi

	docker compose exec node bash -c "yarn --cwd $1 test"
}

function _client-test_completion() {
  compadd design_system pre_visit_app patient_app scenario_builder/util widgets
}

compdef _client-test_completion client-test
