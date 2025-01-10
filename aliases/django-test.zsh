#!/usr/bin/env zsh

function django-test() {
	testpath=${1:-"."}
	docker compose exec web bash -c "./manage.py test $testpath"
}
