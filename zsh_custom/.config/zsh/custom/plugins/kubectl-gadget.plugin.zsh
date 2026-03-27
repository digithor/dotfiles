if (( ! $+commands[kubectl-gadget] )); then
    return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_kubectl-gadget" ]]; then
    typeset -g -A _comps
    autoload -Uz _kubectl-gadget
    _comps[kubectl-gadget]=_kubectl-gadget
fi

kubectl-gadget completion zsh >| "$ZSH_CACHE_DIR/completions/_kubectl-gadget" &|
