export HOMEBREW_PREFIX_CURL="$(brew --prefix curl)"

export PATH="$HOMEBREW_PREFIX_CURL/bin:$PATH"
export PATH="$(brew --prefix ruby)/bin:$PATH"
export PATH="$(brew --prefix python)/libexec/bin:$PATH"
export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"

export PATH="$(brew --prefix gawk)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix gnu-sed)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix gnu-which)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix gnu-time)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix gnu-tar)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix gnu-units)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix grep)/libexec/gnubin:$PATH"
export PATH="$(brew --prefix inetutils)/libexec/gnubin:$PATH"

export PATH="$(brew --prefix uutils-coreutils)/libexec/uubin:$PATH"
export PATH="$(brew --prefix uutils-diffutils)/libexec/uubin:$PATH"
export PATH="$(brew --prefix uutils-findutils)/libexec/uubin:$PATH"

export LDFLAGS="-L$HOMEBREW_PREFIX_CURL/lib"
export CPPFLAGS="-I$HOMEBREW_PREFIX_CURL/include"
export PKG_CONFIG_PATH="$HOMEBREW_PREFIX_CURL/lib/pkgconfig"

export GROOVY_HOME="$(brew --prefix groovy)/libexec"

