export EDITOR="hx"
export VISUAL="$EDITOR"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#F2D5CF,hl:#E78284 \
--color=fg:#C6D0F5,header:#E78284,info:#CA9EE6,pointer:#F2D5CF \
--color=marker:#BABBF1,fg+:#C6D0F5,prompt:#CA9EE6,hl+:#E78284 \
--color=selected-bg:#51576D \
--color=border:#737994,label:#C6D0F5"

export XDG_CONFIG_HOME="$HOME/.config"

export CUSTOM_ZSH_CONFIG="$HOME/.config/zsh/custom"

if [[ "$TERM" == "xterm-ghostty" ]] || [[ -z "$TERM" ]] || ! tput -V >/dev/null 2>&1; then
    export TERM='xterm-256color'
fi

if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi
