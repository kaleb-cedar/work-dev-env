#!/usr/bin/env zsh

function sync-reference-data() {
	if [[ -z "$1" ]]; then
	  echo "Error: Missing required argument."
	  echo "Usage: $0 <django-app>"
	  return 1
	fi

	docker compose exec web bash -c "./manage.py syncreferencedata --app="$1""
}

function _sync-reference-data_completion() {
	compadd engagements payment_models
}

compdef _sync-reference-data_completion sync-reference-data
