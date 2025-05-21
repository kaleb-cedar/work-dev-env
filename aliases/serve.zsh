#!/usr/bin/env zsh

function serve() {
    if [[ -z "$1" ]]; then
        echo "Error: Missing required argument."
        echo "Usage: $0 <client-app> [path]"
        return 1
    fi

    docker compose exec node bash -c "cd $1 && yarn serve"
}

function _serve_completion() {
    compadd pre_visit_app provider_tools_app
}

compdef _serve_completion serve
