if (( ! $+commands[awsctx] )); then
    return
fi

eval "$(awsctx shell-init zsh)"

if [[ ! -f "$ZSH_CACHE_DIR/completions/_awsctx" ]]; then
    typeset -g -A _comps
    autoload -Uz _awsctx
    _comps[awsctx]=_awsctx
fi

command awsctx completion zsh >| "$ZSH_CACHE_DIR/completions/_awsctx" &|
