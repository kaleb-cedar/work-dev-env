# This is needed sometimes when working on html templates and you need the app to refresh
# See https://cedar-slack.slack.com/archives/CHVLQK3B9/p1733257833075389?thread_ts=1733256936.862759&cid=CHVLQK3B9
alias restart-wsgi='docker compose exec web bash -c "supervisorctl restart app-uwsgi"'
