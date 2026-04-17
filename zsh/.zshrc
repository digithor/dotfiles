# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Load zinit completions
autoload -Uz _zinit
((${+_comps})) && _comps[zinit]=_zinit

# Load OMZ core library
zinit for \
    OMZL::git.zsh \
    OMZL::history.zsh \
    OMZL::key-bindings.zsh \
    OMZL::directories.zsh \
    OMZL::clipboard.zsh \
    OMZL::grep.zsh \
    OMZL::theme-and-appearance.zsh \
    OMZP::brew \
    OMZP::starship

# Load custom env
zinit ice wait lucid
zinit snippet "$CUSTOM_ZSH_CONFIG/env.zsh"

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
    OMZP::ssh \
    OMZP::docker \
    OMZP::minikube \
    OMZP::rust \
    OMZP::gem \
    OMZP::mise \
    OMZP::1password \
    OMZP::tailscale \
    OMZP::colored-man-pages

# Load completions
zinit wait lucid as"completion" for \
    OMZP::terraform/_terraform \
    OMZP::redis-cli/_redis-cli \
    OMZP::httpie/_httpie

# Load custom plugins
zinit ice wait lucid multisrc"(argocd|k8sgpt|kafkactl|kubectl-argo-rollouts|popeye|pulumi|goose|television|tenv|sem-cli).plugin.zsh"
zinit load "$CUSTOM_ZSH_CONFIG/plugins"

# Add completions to fpath
zinit add-fpath "$ZSH_CACHE_DIR/completions"

zinit wait lucid for \
    blockf atpull"zinit creinstall -q ." \
    zsh-users/zsh-completions \
    atinit"zicompinit; zicdreplay" \
    Aloxaf/fzf-tab \
    hlissner/zsh-autopair \
    MichaelAquilina/zsh-you-should-use \
    zdharma-continuum/fast-syntax-highlighting

# Word characters
WORDCHARS="${WORDCHARS/\//}"
WORDCHARS="${WORDCHARS/./}"

# Key Bindings
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# History settings
setopt appendhistory
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY

# Tab Completion
setopt complete_in_word
setopt always_to_end

if [[ "$CASE_SENSITIVE" = true ]]; then
    zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
else
    if [[ "$HYPHEN_INSENSITIVE" = true ]]; then
        zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'
    else
        zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
    fi
fi
unset CASE_SENSITIVE HYPHEN_INSENSITIVE

zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' menu no
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:*' show-group brief
zstyle ':fzf-tab:*' single-group color header
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':completion:*' special-dirs true

# Previews: directories
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# Previews: files (bat for text, eza fallback for directories)
zstyle ':fzf-tab:complete:(bat|cat|less|diff|nvim|vim|nano|head|tail|wc|cp|mv|rm|source|.):argument-rest' \
    fzf-preview 'bat --color=always --style=numbers $realpath 2>/dev/null || eza -1 --color=always $realpath'

# Previews: environment variables
zstyle ':fzf-tab:complete:(export|unset|printenv):argument-1' \
    fzf-preview 'printenv $word'

# Previews: kill — show process details
zstyle ':fzf-tab:complete:(kill|killall):argument-rest' \
    fzf-preview '[[ $group == "[process ID]" ]] && ps -p $word -o command,pid,ppid,%cpu,%mem | head -5'
zstyle ':fzf-tab:complete:(kill|killall):argument-rest' fzf-flags '--preview-window=down:4:wrap'

# Previews: git — branches, commits, and staged files
zstyle ':fzf-tab:complete:git-(add|diff|restore|checkout|reset|switch):*' \
    fzf-preview 'git diff --stat HEAD $word 2>/dev/null || git log --oneline --graph --color=always $word 2>/dev/null | head -20'
zstyle ':fzf-tab:complete:git-(log|show):*' \
    fzf-preview 'git show --stat --color=always $word 2>/dev/null | head -30'

# See hidden files
setopt glob_dots

# Yazi configuration
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd" || return
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
