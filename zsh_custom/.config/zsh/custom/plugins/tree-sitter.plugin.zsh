if (( ! $+commands[tree-sitter] )); then
    return
fi

if [[ ! -f "$ZSH_CACHE_DIR/completions/_tree-sitter" ]]; then
    typeset -g -A _comps
    autoload -Uz _tree-sitter
    _comps[tree-sitter]=_tree-sitter
fi

tree-sitter complete --shell zsh >| "$ZSH_CACHE_DIR/completions/_tree-sitter" &|
