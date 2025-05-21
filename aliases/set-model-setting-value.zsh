#!/usr/bin/env zsh

function set-model-setting-value() {
    if [[ -z "$1" ]]; then
        echo "Error: Missing required argument."
        echo "Usage: $0 <model-setting> <value>"
        return 1
    fi

    if [[ -z "$2" ]]; then
        echo "Error: Missing required argument."
        echo "Usage: $0 <model-setting> <value>"
        return 1
    fi

    cmd_str="UPDATE django_model_settings_modelsetting SET value = '$2' WHERE name = '$1';"

    docker compose exec web bash -c "echo \"$cmd_str\" | ./manage.py dbshell"
}

function _set-model-setting-value_completion() {
    local -a first_arg_options=(
        "show_new_york_debt_protection_disclaimer_option"
        "show_new_york_debt_protection_disclaimer_for_unknown_location_experiment"
        "enable_nextjs_pcw_checkout_flow"
        "pre_visit__pre_visit_checkout_v2_ui_enabled"
        "customization_editor_enabled"
        "hide_balance_of_invoices_in_collections"
        "payment_history_ui_enabled"
        "patient_history_enabled"
        "operator_portal__receipts_enabled"
        "hba_saved_payment_method_enabled"
        "refunds_enabled"
        "enable_improved_stripe_dispute_handling"
        "enable_stripe_failed_refund_handling"
        "stripe_express_checkout_enabled"
        "use_stripe_payment_intents_api"
        "nextjs_visit_details_enabled"
        "nextjs_visit_details_show_visits_on_payment_checkout_pages"
        "show_payment_method_login_cta_experiment"
    )

    case "$words[2]" in
    show_new_york_debt_protection_disclaimer_for_unknown_location_experiment | \
        enable_nextjs_pcw_checkout_flow | \
        pre_visit__pre_visit_checkout_v2_ui_enabled | \
        customization_editor_enabled | \
        hide_balance_of_invoices_in_collections | \
        payment_history_ui_enabled | \
        patient_history_enabled | \
        operator_portal__receipts_enabled | \
        hba_saved_payment_method_enabled | \
        refunds_enabled | \
        enable_improved_stripe_dispute_handling | \
        enable_stripe_failed_refund_handling | \
        stripe_express_checkout_enabled | \
        use_stripe_payment_intents_api | \
        nextjs_visit_details_enabled | \
        nextjs_visit_details_show_visits_on_payment_checkout_pages | \
        show_payment_method_login_cta_experiment)
        local -a second_arg_options=("true" "false")
        ;;
    show_new_york_debt_protection_disclaimer_option)
        local -a second_arg_options=(
            "never"
            "for_new_york_visits"
            "for_new_york_visits_and_visits_without_locations"
        )
        ;;
    *)
        local -a second_arg_options=()
        ;;
    esac

    if ((CURRENT == 2)); then
        compadd "${first_arg_options[@]}"
    elif ((CURRENT == 3)); then
        compadd "${second_arg_options[@]}"
    fi
}

compdef _set-model-setting-value_completion set-model-setting-value
