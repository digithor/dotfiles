# dotfiles

Personal macOS dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

Each top-level directory mirrors the home directory structure so Stow can symlink configs directly.

```
dotfiles/
├── claude-code/   # Claude Code settings & skills
├── fsh/           # fast-syntax-highlighting theme
├── ghostty/       # Ghostty terminal
├── helix/         # Helix editor
├── k9s/           # k9s Kubernetes TUI
├── kitty/         # Kitty terminal
├── neovim/        # Neovim (lazy.nvim)
├── starship/      # Starship prompt
├── tmux/          # tmux
├── vim/           # Vim
├── wezterm/       # WezTerm terminal
├── yazi/          # Yazi file manager
├── zed/           # Zed editor
├── zsh_config/    # Zsh entrypoints (.zshrc, .zshenv, .zprofile)
└── zsh_custom/    # Custom Zsh plugins & env config
```

## Setup

### Prerequisites

```sh
brew install stow
```

### Install

Clone the repo and stow whichever configs you want:

```sh
git clone <repo-url> ~/.dotfiles
cd ~/.dotfiles

# Symlink individual configs
stow ghostty
stow neovim
stow zsh_config zsh_custom

# Or symlink everything at once
stow */
```

## What's Inside

### Shell — Zsh + zinit

- **Plugin manager**: [zinit](https://github.com/zdharma-continuum/zinit) with turbo mode for fast startup
- **OMZ libraries**: git, history, key-bindings, directories, clipboard, grep
- **Plugins**: git, eza, fzf, zoxide, aws, gcloud, docker, minikube, fluxcd, rust, asdf, 1password, tailscale, and more
- **Completion plugins**: fzf-tab, zsh-completions, fast-syntax-highlighting, zsh-autopair, zsh-you-should-use
- **Custom plugins**: k8sgpt, kafkactl, kubectl-argo-rollouts, popeye, pulumi, codex, goose

### Editors

| Editor | Config path |
|--------|-------------|
| Helix (default `$EDITOR`) | `helix/.config/helix/` |
| Neovim | `neovim/.config/nvim/` |
| Vim | `vim/.vimrc` |
| Zed | `zed/.config/zed/` |

### Terminals

| Terminal | Config path |
|----------|-------------|
| Ghostty | `ghostty/.config/ghostty/config` |
| Kitty | `kitty/.config/kitty/` |
| WezTerm | `wezterm/.config/wezterm/wezterm.lua` |

### Other Tools

| Tool | Config path |
|------|-------------|
| Starship prompt | `starship/.config/starship.toml` |
| tmux | `tmux/.tmux.conf` |
| Yazi file manager | `yazi/.config/yazi/` |
| k9s | `k9s/.config/k9s/` |
| fsh theme | `fsh/.config/fsh/` |
| Claude Code | `claude-code/.claude/` |

## Theme

[Catppuccin Frappe](https://github.com/catppuccin/catppuccin) is applied consistently across terminals, editors, and TUI tools.

**Font**: JetBrainsMono Nerd Font Mono
