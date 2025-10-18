if (( ! $+commands[codex] )); then
    return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_codex" ]]; then
    typeset -g -A _comps
    autoload -Uz _codex
    _comps[codex]=_codex
fi

codex completion zsh >| "$ZSH_CACHE_DIR/completions/_codex" &|
