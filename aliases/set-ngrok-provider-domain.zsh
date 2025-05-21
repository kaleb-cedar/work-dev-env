function set-ngrok-provider-domain() {
    cmd_str="UPDATE provider_domain SET domain = 'devtest2.cedar.com' WHERE id = 37;"

    docker compose exec web bash -c "echo \"$cmd_str\" | ./manage.py dbshell"
}
