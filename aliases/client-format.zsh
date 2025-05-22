#!/usr/bin/env zsh

function client-format() {
    if [[ -z "$1" ]]; then
        echo "Error: Missing required argument."
        echo "Usage: $0 <client-app>"
        return 1
    fi

    docker compose exec node bash -c "cd $1 && yarn format"
}

function _client-format_completion() {
    compadd design_system pre_visit_app patient_app widgets next_js
}

compdef _client-format_completion client-format

