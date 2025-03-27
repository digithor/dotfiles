if (( ! $+commands[pulumi] )); then
    return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_pulumi" ]]; then
    typeset -g -A _comps
    autoload -Uz _pulumi
    _comps[pulumi]=_pulumi
fi

pulumi gen-completion zsh >| "$ZSH_CACHE_DIR/completions/_pulumi" &|
