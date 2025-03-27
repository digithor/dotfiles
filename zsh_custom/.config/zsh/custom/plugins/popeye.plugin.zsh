if (( ! $+commands[popeye] )); then
    return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_popeye" ]]; then
    typeset -g -A _comps
    autoload -Uz _popeye
    _comps[popeye]=_popeye
fi

popeye completion zsh >| "$ZSH_CACHE_DIR/completions/_popeye" &|
