if (( ! $+commands[tenv] )); then
    return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_tenv" ]]; then
    typeset -g -A _comps
    autoload -Uz _tenv
    _comps[tenv]=_tenv
fi

tenv completion zsh >| "$ZSH_CACHE_DIR/completions/_tenv" &|
