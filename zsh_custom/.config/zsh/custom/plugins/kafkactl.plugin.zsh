if (( ! $+commands[kafkactl] )); then
  return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_kafkactl" ]]; then
  typeset -g -A _comps
  autoload -Uz _kafkactl
  _comps[kafkactl]=_kafkactl
fi

kafkactl completion zsh >| "$ZSH_CACHE_DIR/completions/_kafkactl" &|
