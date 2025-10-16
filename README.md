# Dotfiles

My personal dotfiles for various tools and applications.

## Applications

This repository contains configurations for the following applications:

- fsh
- ghostty
- helix
- k9s
- kitty
- neovim
- starship
- tmux
- vim
- wezterm
- yazi
- zed
- zsh

## Theme

The primary theme used across these configurations is [Catppuccin Frappé](https://github.com/catppuccin/catppuccin).

## Prerequisites

- `git` for cloning and keeping this repository up to date.
- [`GNU stow`](https://www.gnu.org/software/stow/) if you want to manage symlinks automatically.
- The applications you intend to configure from the list above.
- A Nerd Font (or any font that supports Catppuccin Frappé) for consistent visuals in terminal UIs.

### Installing dependencies

Install the tools with your preferred package manager. The commands below cover the setups I use most frequently; adjust them as needed for your platform.

#### macOS (Homebrew)

```bash
brew install git stow helix k9s neovim starship tmux vim yazi zsh
brew install --cask ghostty kitty wezterm zed
```

#### Ubuntu / Debian

```bash
sudo apt update
sudo apt install git stow helix k9s neovim tmux vim zsh
```

For applications that are not available in your distribution repositories (such as Ghostty, Kitty, WezTerm, Starship, Yazi, or Zed), follow their official install guides or community packages.

## Usage

1. Clone the repository into your home directory (or wherever you manage dotfiles):

   ```bash
   git clone git@github.com:<username>/.dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. Link the modules you need. `--target` ensures the links point back into your home directory:

   ```bash
   stow --target="$HOME" zsh_config zsh_custom starship neovim tmux
   ```

   Add or remove modules at any time. Use `stow -D <module>` to remove links and `stow -n <module>` for a dry run before applying changes.

3. Restart your shell or the applications you configured so they pick up the new settings.

If you prefer not to use `stow`, create symlinks manually, for example:

```bash
ln -s ~/.dotfiles/zsh_config/.zshrc ~/.zshrc
ln -s ~/.dotfiles/neovim/.config/nvim ~/.config/nvim
```
