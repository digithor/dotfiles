# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Load zinit completions
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

export EDITOR="nvim"
export VISUAL="$EDITOR"
alias vi=nvim

# Load OMZ core library
zinit for \
    OMZL::git.zsh \
    OMZL::history.zsh \
    OMZL::key-bindings.zsh \
    OMZL::completion.zsh \
    OMZL::directories.zsh \
    OMZL::clipboard.zsh \
    OMZL::async_prompt.zsh \
    OMZL::grep.zsh \
    OMZL::spectrum.zsh \
    OMZL::theme-and-appearance.zsh \
    OMZP::brew \
    OMZP::starship

export CUSTOM_ZSH_CONFIG="$HOME/.config/zsh/custom"

# Load custom env
zinit ice wait lucid
zinit snippet "$CUSTOM_ZSH_CONFIG/macos-env.zsh"

# Function to setup zinit completions directory
setup_zinit_completions() {
    local completions_dir="$ZSH_CACHE_DIR/completions"

    if [[ ! -d "$completions_dir" ]]; then
        echo "Creating zinit completions directory..."
        mkdir -p "$completions_dir" || {
            echo "Error: Failed to create $completions_dir"
            return 1
        }
    fi

    chmod 755 "$completions_dir" || {
        echo "Error: Failed to set permissions for $completions_dir"
        return 1
    }
}

# Run the setup
setup_zinit_completions

# Load core plugins with turbo mode
zinit wait lucid for \
    atinit"zicompinit; zicdreplay" \
        zdharma-continuum/fast-syntax-highlighting \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    atload'bindkey "^[[A" history-substring-search-up; \
           bindkey "^[[B" history-substring-search-down; \
           bindkey "$terminfo[kcuu1]" history-substring-search-up; \
           bindkey "$terminfo[kcud1]" history-substring-search-down' \
        zsh-users/zsh-history-substring-search \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions

# Load Zinit's completion system
zinit ice wait lucid as"completion"
zinit snippet "$ZINIT_HOME/_zinit"

# Load OMZ plugins in turbo mode
zinit wait lucid for \
    OMZP::git \
    OMZP::eza \
    OMZP::fzf \
    OMZP::zoxide \
    OMZP::aws \
    OMZP::gcloud \
    OMZP::terraform \
    OMZP::ssh \
    OMZP::podman \
    OMZP::docker \
    OMZP::kubectl \
    OMZP::argocd \
    OMZP::k9s \
    OMZP::helm \
    OMZP::kubectx \
    OMZP::fluxcd \
    OMZP::rust \
    OMZP::python \
    OMZP::uv \
    OMZP::gem \
    OMZP::deno \
    OMZP::bun \
    OMZP::1password \
    OMZP::web-search \
    OMZP::command-not-found \
    OMZP::colored-man-pages

# Load completions
zinit wait lucid as"completion" for \
    OMZP::terraform/_terraform \
    OMZP::redis-cli/_redis-cli \
    OMZP::httpie/_httpie

# Load custom plugins
zinit ice wait lucid multisrc"stern.plugin.zsh \
    kafkactl.plugin.zsh \
    kubectl-argo-rollouts.plugin.zsh \
    popeye.plugin.zsh \
    pulumi.plugin.zsh \
    k8sgpt.plugin.zsh"
zinit load "$CUSTOM_ZSH_CONFIG/plugins"

# Add clompletions to fpath
zinit add-fpath "$ZSH_CACHE_DIR/completions"

# Load plugins from git
zinit wait lucid for \
    hlissner/zsh-autopair \
    MichaelAquilina/zsh-you-should-use

# Configure completion styles
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# Enable approximate matching
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# History settings
setopt appendhistory
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY

# Yazi configuration
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# eval "$(zoxide init --cmd cd zsh)"

# Load system completions
# autoload -Uz compinit
# if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump 2>/dev/null) ]; then
#     compinit
# else
#     compinit -C
# fi
