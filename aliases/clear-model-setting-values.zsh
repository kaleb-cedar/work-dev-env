#!/usr/bin/env zsh

function clear-model-setting-values() {
	if [[ -z "$1" ]]; then
	  echo "Error: Missing required argument."
	  echo "Usage: $0 <model-setting>"
	  return 1
	fi

	cmd_str="DELETE FROM django_model_settings_modelsettingvalue v USING django_model_settings_modelsetting s WHERE s.id = v.model_setting_id AND s.name = '$1';"

	docker compose exec web bash -c "echo \"$cmd_str\" | ./manage.py dbshell"
} 

function _clear-model-setting-values_completion() {
	local -a first_arg_options=(
		"show_new_york_debt_protection_disclaimer_option"
		"show_new_york_debt_protection_disclaimer_for_unknown_location_experiment"
		"enable_nextjs_pcw_checkout_flow"
		"pre_visit__pre_visit_checkout_v2_ui_enabled"
		"customization_editor_enabled"
	)

	compadd "${first_arg_options[@]}"
}

compdef _clear-model-setting-values_completion clear-model-setting-values
