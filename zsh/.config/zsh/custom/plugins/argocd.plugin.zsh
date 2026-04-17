if (( ! $+commands[argocd] )); then
    return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_argocd" ]]; then
    typeset -g -A _comps
    autoload -Uz _argocd
    _comps[argocd]=_argocd
fi

argocd completion zsh >| "$ZSH_CACHE_DIR/completions/_argocd" &|
