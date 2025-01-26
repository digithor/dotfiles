if (( ! $+commands[stern] )); then
  return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_stern" ]]; then
  typeset -g -A _comps
  autoload -Uz _stern
  _comps[stern]=_stern
fi

stern --completion zsh >| "$ZSH_CACHE_DIR/completions/_stern" &|
