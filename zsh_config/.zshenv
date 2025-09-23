export EDITOR="hx"
export VISUAL="$EDITOR"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#F2D5CF,hl:#E78284 \
--color=fg:#C6D0F5,header:#E78284,info:#CA9EE6,pointer:#F2D5CF \
--color=marker:#BABBF1,fg+:#C6D0F5,prompt:#CA9EE6,hl+:#E78284 \
--color=selected-bg:#51576D \
--color=border:#737994,label:#C6D0F5"

export K9S_CONFIG_DIR="$HOME/.config/k9s"

export CUSTOM_ZSH_CONFIG="$HOME/.config/zsh/custom"

if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi
