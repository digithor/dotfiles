if ((!$+commands[sem])); then
    return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_sem" ]]; then
    typeset -g -A _comps
    autoload -Uz _sem
    _comps[sem]=_sem
fi

sem completions zsh >|"$ZSH_CACHE_DIR/completions/_sem" &|
