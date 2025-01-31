#!/usr/bin/env zsh

function make-empty-migration() {
	if [[ -z "$1" ]]; then
	  echo "Error: Missing required argument."
	  echo "Usage: $0 <django-app> [path]"
	  return 1
	fi

	docker compose exec web bash -c "./manage.py makemigrations $1 --empty"
}

function _make-empty-migration_completion() {
	compadd engagements api_app
}

compdef _make-empty-migration_completion make-empty-migration
