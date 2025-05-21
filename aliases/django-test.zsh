#!/usr/bin/env zsh

function django-test() {
    zparseopts -D -E u=u_flag

    if [[ -z "$1" ]]; then
        echo "Error: Missing required argument."
        echo "Usage: $0 <django-project> [path]"
        return 1
    fi

    testpath=${2:-"."}
    if (($#u_flag)); then
        docker compose exec web bash -c "cd ../$1 && ./manage.py test $testpath --snapshot-update"
    else
        docker compose exec web bash -c "cd ../$1 && ./manage.py test $testpath"
    fi
}

function _django-test_completion() {
    local -a first_arg_options=(
        "api"
        "integrations"
    )

    if ((CURRENT == 2)); then
        compadd "${first_arg_options[@]}"
    fi
}

compdef _django-test_completion django-test
