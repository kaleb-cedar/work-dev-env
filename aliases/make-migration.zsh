#!/usr/bin/env zsh

function make-migrations() {
    docker compose exec web bash -c "./manage.py makemigrations $1"
}

function _make-migrations_completion() {
    compadd engagements api_app
}

compdef _make-migrations_completion make-migrations
