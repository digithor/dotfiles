if (($ + command[zoxide])); then
    eval "$(zoxide init --cmd cd zsh)"
fi

if (($ + command[uv])); then
    export PATH="$(uv tool dir --bin):$PATH"
fi

if (($ + command[brew])); then
    HOMEBREW_COMMAND_NOT_FOUND_HANDLER="$(brew --repository)/Library/Homebrew/command-not-found/handler.sh"
    [[ -f $HOMEBREW_COMMAND_NOT_FOUND_HANDLER ]] && source "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER"
fi

if [ -f "$HOME/.local/bin/env" ]; then
    . "$HOME/.local/bin/env"
fi

case "$(uname)" in
Darwin)
    export PATH="$HOMEBREW_PREFIX/opt/curl/bin:$PATH"
    export PATH="$HOMEBREW_PREFIX/opt/ruby/bin:$PATH"
    export PATH="$HOMEBREW_PREFIX/opt/python/libexec/bin:$PATH"
    export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"

    export PATH="$HOMEBREW_PREFIX/opt/gawk/libexec/gnubin:$PATH"
    export PATH="$HOMEBREW_PREFIX/opt/gnu-sed/libexec/gnubin:$PATH"
    export PATH="$HOMEBREW_PREFIX/opt/gnu-which/libexec/gnubin:$PATH"
    export PATH="$HOMEBREW_PREFIX/opt/gnu-time/libexec/gnubin:$PATH"
    export PATH="$HOMEBREW_PREFIX/opt/gnu-tar/libexec/gnubin:$PATH"
    export PATH="$HOMEBREW_PREFIX/opt/gnu-units/libexec/gnubin:$PATH"
    export PATH="$HOMEBREW_PREFIX/opt/grep/libexec/gnubin:$PATH"
    export PATH="$HOMEBREW_PREFIX/opt/inetutils/libexec/gnubin:$PATH"

    export PATH="$HOMEBREW_PREFIX/opt/coreutils/libexec/gnubin:$PATH"
    export PATH="$HOMEBREW_PREFIX/opt/findutils/libexec/gnubin:$PATH"

    # export PATH="$HOMEBREW_PREFIX/opt/uutils-coreutils/libexec/uubin:$PATH"
    # export PATH="$HOMEBREW_PREFIX/opt/uutils-diffutils/libexec/uubin:$PATH"
    # export PATH="$HOMEBREW_PREFIX/opt/uutils-findutils/libexec/uubin:$PATH"

    export LDFLAGS="-L$HOMEBREW_PREFIX/opt/curl/lib"
    export CPPFLAGS="-I$HOMEBREW_PREFIX/opt/curl/include"
    export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/curl/lib/pkgconfig"

    export GROOVY_HOME="$HOMEBREW_PREFIX/opt/groovy/libexec"

    export PATH="$HOME/.cargo/bin:$HOMEBREW_PREFIX/opt/rustup/bin:$PATH"

    HOMEBREW_COMMAND_NOT_FOUND_HANDLER="$(brew --repository)/Library/Homebrew/command-not-found/handler.sh"
    if [ -f "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER" ]; then
        source "$HOMEBREW_COMMAND_NOT_FOUND_HANDLER"
    fi
    ;;
esac
