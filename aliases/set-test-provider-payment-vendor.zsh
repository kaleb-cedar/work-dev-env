#!/usr/bin/env zsh

function set-test-provider-payment-vendor() {
    if [[ -z "$1" ]]; then
        echo "Error: Missing required argument."
        echo "Usage: $0 <payment-vendor>"
        return 1
    fi

    case "$1" in
    stripe)
        PAYMENT_VENDOR_ID=1
        ;;
    trustcommerce)
        PAYMENT_VENDOR_ID=3
        ;;
    *)
        echo "Unknown Payment Vendor: $1"
        exit 1
        ;;
    esac

    cmd_str="UPDATE provider SET payment_vendor_fk_id = '$PAYMENT_VENDOR_ID' WHERE id = 5;"

    docker compose exec web bash -c "echo \"$cmd_str\" | ./manage.py dbshell"
}

function _set-test-provider-payment-vendor_completion() {
    compadd stripe trustcommerce
}

compdef _set-test-provider-payment-vendor_completion set-test-provider-payment-vendor
