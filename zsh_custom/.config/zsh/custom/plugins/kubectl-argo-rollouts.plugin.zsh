if (( ! $+commands[kubectl-argo-rollouts] )); then
  return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_kubectl-argo-rollouts" ]]; then
  typeset -g -A _comps
  autoload -Uz _kubectl-argo-rollouts
  _comps[kubectl-argo-rollouts]=_kubectl-argo-rollouts
fi

kubectl-argo-rollouts completion zsh >| "$ZSH_CACHE_DIR/completions/_kubectl-argo-rollouts" &|
