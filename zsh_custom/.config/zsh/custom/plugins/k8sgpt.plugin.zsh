if (( ! $+commands[k8sgpt] )); then
  return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_k8sgpt" ]]; then
  typeset -g -A _comps
  autoload -Uz _k8sgpt
  _comps[k8sgpt]=_k8sgpt
fi

k8sgpt completion zsh >| "$ZSH_CACHE_DIR/completions/_k8sgpt" &|
