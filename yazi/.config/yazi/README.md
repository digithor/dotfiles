# Yazi Configuration

This directory contains yazi configuration including plugins and theme.

## Installation

### Prerequisites

Install yazi first:
```sh
# macOS (Homebrew)
brew install yazi

# Linux
cargo install yazi
```

### Symlink Config

Symlink this directory to your yazi config location:
```sh
ln -s ~/dotfiles/yazi/.config/yazi ~/.config/yazi
```

### Install Plugins

Use `ya` (yazi package manager) to install the plugins defined in `package.toml`:

```sh
# Install all plugins and flavors
ya pack install
```

Or install plugins individually:
```sh
# Git integration
ya pack add yazi-rs/plugins:git

# File mounting
ya pack add yazi-rs/plugins:mount

# Chmod support
ya pack add yazi-rs/plugins:chmod

# Lazygit integration
ya pack add Lil-Dank/lazygit

# Starship prompt
ya pack add Rolv-Apneseth/starship

# Full border
ya pack add yazi-rs/plugins:full-border
```

### Install Theme

The Catppuccin Frappe theme is already configured in `package.toml`. Install it with:
```sh
ya pack install
```

Or manually:
```sh
ya pack add yazi-rs/flavors:catppuccin-frappe
```

## Configuration

### Plugins

The following plugins are configured:

- **git** - Git status and diff support
- **mount** - Mount filesystems
- **chmod** - Change file permissions
- **lazygit** - Open lazygit from yazi
- **starship** - Starship prompt in status bar
- **full-border** - Full border around yazi

Plugins are initialized in `init.lua`.

### Theme

- Theme: Catppuccin Frappe
- Configured in `theme.toml`
- Flavor file: `flavors/catppuccin-frappe.yazi/`

### Key Customizations

- Show hidden files: `show_hidden = true`
- Sort by: `natural` order
- Linemode: `size_and_mtime` (shows file size and modification time)
- Preview wrapping enabled