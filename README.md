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
# Install core utilities
brew install git stow zsh

# Install terminal tools
brew install helix k9s neovim starship tmux vim yazi

# Install GUI applications
brew install --cask ghostty kitty wezterm zed
```

#### Ubuntu / Debian

```bash
# Update package index
sudo apt update

# Install core utilities
sudo apt install git stow zsh

# Install terminal tools
sudo apt install helix k9s neovim tmux vim

# Install starship (not in default repos)
curl -sS https://starship.rs/install.sh | sh

# Install yazi (not in default repos)
cargo install yazi

# Install GUI applications (not in default repos)
# Follow official guides for Ghostty, Kitty, WezTerm, and Zed
```

#### Arch Linux

```bash
# Update package database
sudo pacman -Syu

# Install core utilities and terminal tools
sudo pacman -S git stow zsh helix k9s neovim tmux vim

# Install starship and yazi from AUR
yay -S starship yazi

# Install GUI applications (not in default repos)
# Follow official guides for Ghostty, Kitty, WezTerm, and Zed
```

#### Windows (WSL)

```bash
# Update package list
sudo apt update

# Install core utilities and terminal tools
sudo apt install git stow zsh helix k9s neovim tmux vim

# Install starship
curl -sS https://starship.rs/install.sh | sh

# Install yazi
cargo install yazi

# Note: GUI applications need to be installed on Windows host system
```

For applications that are not available in your distribution repositories, follow their official install guides or community packages.

**Note**: After installing ZSH, you might need to change your default shell:

```bash
# Add ZSH to allowed shells
echo $(which zsh) | sudo tee -a /etc/shells

# Change default shell
chsh -s $(which zsh)
```

## Usage

### Getting Started

1. Clone the repository into your home directory (or wherever you manage dotfiles):

   ```bash
   git clone https://github.com/<username>/.dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. Link the modules you need. `--target` ensures the links point back into your home directory:

   ```bash
   # Core terminal configuration
   stow --target="$HOME" zsh_config zsh_custom starship
   
   # Editor configurations
   stow --target="$HOME" neovim helix
   
   # Terminal multiplexer and tools
   stow --target="$HOME" tmux k9s
   
   # Terminal emulators
   stow --target="$HOME" kitty wezterm
   ```

   Add or remove modules at any time. Use `stow -D <module>` to remove links and `stow -n <module>` for a dry run before applying changes.

3. Restart your shell or the applications you configured so they pick up the new settings.

### Advanced Usage

#### Managing Stow Packages

```bash
# List all available packages
ls -d */ | sed 's|/||g'

# Preview what will be stowed (dry run)
stow -n --target="$HOME" neovim

# Stow specific packages
stow --target="$HOME" starship helix

# Restow (update) existing symlinks
stow --restow --target="$HOME" neovim

# Unstow packages
stow -D --target="$HOME" helix

# Stow with verbose output
stow -v --target="$HOME" tmux
```

#### Managing Configurations Manually

If you prefer not to use `stow`, create symlinks manually:

```bash
# Zsh configuration
ln -s ~/.dotfiles/zsh_config/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh_custom ~/.oh-my-zsh/custom

# Editor configurations
ln -s ~/.dotfiles/neovim/.config/nvim ~/.config/nvim
ln -s ~/.dotfiles/helix/.config/helix ~/.config/helix

# Terminal emulator configurations
ln -s ~/.dotfiles/kitty/.config/kitty ~/.config/kitty
ln -s ~/.dotfiles/wezterm/.config/wezterm ~/.config/wezterm

# Tools configuration
ln -s ~/.dotfiles/starship/.config/starship.toml ~/.config/starship.toml
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
```

#### Updating Dotfiles

```bash
# Update the dotfiles repository
cd ~/.dotfiles
git pull origin main

# After pulling changes, restow updated packages
stow --restow --target="$HOME" neovim zsh_config tmux
```

#### Troubleshooting Common Issues

1. **Stow conflicts**: If stow reports conflicts, check what files already exist:

   ```bash
   # Check for conflicts before stowing
   stow --simulate --target="$HOME" neovim
   
   # List conflicting files
   stow --no --target="$HOME" neovim 2>&1 | grep "existing"
   ```

2. **Broken symlinks**: Find and remove broken symlinks:

   ```bash
   # Find broken symlinks in home directory
   find ~ -type l -exec test ! -e {} \; -print
   
   # Remove broken symlinks (be careful!)
   find ~ -type l -exec test ! -e {} \; -delete
   ```

3. **Configuration not loading**: Check that your shell is using the correct configuration:

   ```bash
   # Check which .zshrc is being used
   echo $ZDOTDIR/.zshrc
   
   # Check which configuration nvim is using
   nvim --cmd "echo stdpath('config')" | head -n1 | tail -n1
   ```

#### Platform-Specific Configurations

For configurations that need to differ between platforms, you can use conditionals in your config files or create platform-specific variants:

```bash
# Example platform-specific directory structure
~/.dotfiles/
├── neovim/
│   ├── .config/
│   │   └── nvim/
│   │       └── init.lua
│   └── macos/
│       └── nvim/
│           └── init.lua
```

Then link the appropriate configuration based on your platform:

```bash
# Stow platform-specific configuration
if [[ "$(uname)" == "Darwin" ]]; then
  stow --target="$HOME" neovim/macos
else
  stow --target="$HOME" neovim/.config
fi
```

#### Selective Configuration Loading

If you want to load different configurations in different environments:

```bash
# Create separate directories for different environments
~/.dotfiles/
├── work/
│   ├── starship.toml
│   └── zsh/
└── personal/
    ├── starship.toml
    └── zsh/
```

Then stow the appropriate configuration based on your environment variable:

```bash
if [[ "$DOTFILES_ENV" == "work" ]]; then
  stow --target="$HOME" work/starship work/zsh
else
  stow --target="$HOME" personal/starship personal/zsh
fi
```
