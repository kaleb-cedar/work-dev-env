source "$(dirname $(realpath "$0"))/set-model-setting-value.zsh"


function setup-checkout-v2() {
	set-model-setting-value enable_nextjs_pcw_checkout_flow true
	set-model-setting-value pre_visit__pre_visit_checkout_v2_ui_enabled true
}
