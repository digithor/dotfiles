if (( ! $+commands[tv] )); then
    return
fi

local _tv_init_cache="${ZSH_CACHE_DIR}/television-init.zsh"

# Regenerate shell integration cache in background on every shell start
tv init zsh >| "$_tv_init_cache" &|

# Source from cache (fast path) or eval directly on first run
if [[ -f "$_tv_init_cache" ]]; then
    source "$_tv_init_cache"
else
    eval "$(tv init zsh)"
fi

# Register completion
typeset -g -A _comps
_comps[tv]=_tv
