export HOMEBREW_PREFIX_CURL="$(brew --prefix curl)"

eval "$(zoxide init --cmd cd zsh)"

export PATH="$HOMEBREW_PREFIX_CURL/bin:$PATH"
export PATH="$(brew --prefix ruby)/bin:$PATH"
export PATH="$(brew --prefix python)/libexec/bin:$PATH"
export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"

export LDFLAGS="-L$HOMEBREW_PREFIX_CURL/lib"
export CPPFLAGS="-I$HOMEBREW_PREFIX_CURL/include"
export PKG_CONFIG_PATH="$HOMEBREW_PREFIX_CURL/lib/pkgconfig"

export GROOVY_HOME="$(brew --prefix groovy)/libexec"

export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#babbf1,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284 \
--color=selected-bg:#51576d \
--multi"
