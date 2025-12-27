# Dotfiles

Personal configuration files for a consistent development environment across multiple machines.

This repository contains version-controlled dotfiles for shell configuration, text editors, terminal emulators, and development tools. All configurations use a consistent Catppuccin Frappe theme where supported.

## Repository layout

The repo is organized by tools and features. Each directory contains configuration files that can be symlinked to your home directory or `.config`.

- `fsh/` — Fish shell configuration (Catppuccin Frappe theme)
- `ghostty/` — Ghostty terminal emulator configuration
- `helix/` — Helix editor configuration and custom themes (Catppuccin Frappe)
- `k9s/` — Kubernetes cluster manager configuration with custom skins and aliases
- `kitty/` — Kitty terminal emulator configuration with multiple themes
- `neovim/` — Neovim configuration with Lua plugins (LSP, AI, formatting, treesitter)
- `opencode/` — OpenCode editor configuration with MCP server integration (Context7)
- `starship/` — Starship cross-shell prompt configuration
- `tmux/` — Tmux terminal multiplexer configuration
- `vim/` — Legacy Vim configuration
- `wezterm/` — WezTerm terminal emulator configuration
- `yazi/` — Yazi terminal file manager configuration
- `zed/` — Zed editor configuration with LSP settings, vim mode, and AI agent (Catppuccin Frappe theme)
- `zsh_config/` — Core Zsh configuration (.zprofile, .zshrc, .zshenv)
- `zsh_custom/` — Custom Zsh plugins for Kubernetes tools (k8sgpt, kubectl, pulumi, etc.)

## Goals

- Keep your environment reproducible across machines
- Make it easy to add, test, and roll back configuration changes
- Separate concerns by tool so you can enable/disable modules easily
- Share configurations between multiple systems (macOS, Linux)

## Key features

- **Catppuccin Frappe theme** — Consistent dark theme across multiple tools (Neovim, Helix, Kitty, Ghostty, K9s, Zed)
- **Modern editors** — Configurations for Neovim (Lua-based with LSP), Zed (with AI agent), Helix, and OpenCode
- **LSP and formatting** — Language server configurations for Python, Go, Ruby, Terraform, Lua, and more
- **AI integration** — MCP (Model Context Protocol) server support in OpenCode and Zed, AI agent in Zed with Ollama
- **Zsh enhancements** — Custom plugins for Kubernetes tools (kubectl, argo-rollouts, k9s, popeye, kafkactl)
- **Terminal options** — Multiple terminal emulator configurations (Kitty, WezTerm, Ghostty)
- **Vim mode** — Available in Zed and other editors for consistent keybindings

## Prerequisites

Essential tools for installing and managing these dotfiles:

- `git` — Required to clone and update the repository
- `stow` — Recommended for managing symlinks (macOS: `brew install stow`, Linux: `sudo apt install stow`)
- `zsh` — Primary shell (default on macOS)
- Optional tools for full functionality:
  - `fish` — If using fish shell configuration
  - `neovim` — If using Neovim configuration
  - `tmux` — If using Tmux configuration
  - Terminal emulators: `kitty`, `wezterm`, `ghostty` (install as needed)
  - Editors: `zed`, `opencode`, `helix` (install as needed)
  - File manager: `yazi` (terminal-based file manager)
  - Prompt: `starship` (cross-shell prompt)

## Backup your existing configuration (recommended)

Before installing anything, back up your current dotfiles so you can restore them if needed:

- Manually move files to a safe location:
  - `mv ~/.zshrc ~/dotfiles-backup/`
  - `mv ~/.config/nvim ~/dotfiles-backup/`
- Or create an archive:
  - `tar -czf ~/dotfiles-backup-$(date +%F).tgz ~/.config/nvim ~/.zshrc ~/.tmux.conf`

## Installation methods

Choose one of the following installation approaches.

### 1) GNU Stow (recommended)

GNU Stow is a simple tool that creates symlinks from package directories to your home directory.

1. Install stow:
    - macOS: `brew install stow`
    - Debian/Ubuntu: `sudo apt install stow`

2. Clone the repo:
    - `git clone <repo-url> ~/.dotfiles`

3. Stow the packages you want:
    ```bash
    cd ~/.dotfiles
    
    # Core shell configuration
    stow zsh_config    # Zsh configuration
    stow zsh_custom    # Custom Zsh plugins
    stow starship      # Starship prompt
    
    # Editors (choose one or more)
    stow neovim        # Neovim configuration
    stow zed           # Zed editor
    stow helix         # Helix editor
    stow opencode      # OpenCode editor
    stow vim           # Legacy Vim
    
    # Terminal multiplexer
    stow tmux          # Tmux configuration
    
    # Terminal emulators (choose one)
    stow kitty         # Kitty terminal
    stow wezterm       # WezTerm terminal
    stow ghostty       # Ghostty terminal
    
    # Additional tools
    stow yazi          # Yazi file manager
    stow k9s           # Kubernetes cluster manager
    stow fsh           # Fish shell (if using fish)
    ```

Each package directory contains files arranged as they appear in your home directory.

### 2) Manual symlinking

If you prefer not to use stow, create symlinks manually:

1. Clone the repo:
   - `git clone <repo-url> ~/.dotfiles`

2. Create symlinks for the files you want to enable:
   ```bash
   # Shell configuration
   ln -s ~/.dotfiles/zsh_config/.zshrc ~/.zshrc
   ln -s ~/.dotfiles/zsh_config/.zshenv ~/.zshenv
   ln -s ~/.dotfiles/zsh_config/.zprofile ~/.zprofile
   
   # Editors
   ln -s ~/.dotfiles/neovim/.config/nvim ~/.config/nvim
   ln -s ~/.dotfiles/zed/.config/zed ~/.config/zed
   ln -s ~/.dotfiles/helix/.config/helix ~/.config/helix
   ln -s ~/.dotfiles/opencode/.config/opencode ~/.config/opencode
   
   # Terminal and tools
   ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
   ln -s ~/.dotfiles/kitty/.config/kitty ~/.config/kitty
   ln -s ~/.dotfiles/starship/.config/starship.toml ~/.config/starship.toml
   ln -s ~/.dotfiles/yazi/.config/yazi ~/.config/yazi
   ```

Adjust the source and target paths to match your repo structure.

## Updating

To update your local copy of the dotfiles to the latest in the remote repo:

```bash
cd ~/.dotfiles
git pull --rebase
```

If you used stow and new files were added or the package structure changed:
```bash
# Re-stow specific packages
stow -R <package>

# Or restow all packages at once
stow -R */
```

## Adding or modifying a dotfile

1. Add or edit files inside the appropriate package folder, e.g. `.dotfiles/neovim/init.lua` or `.dotfiles/zsh_config/.zshrc`.
2. Test locally by re-symlinking or reloading the config (e.g., restart your shell or source the file).
3. Commit and push:
   - `git add <files>`
   - `git commit -m "feat: update nvim config for xyz"`
   - `git push origin main`

Keep commits small and focused; include a useful commit message.

## Testing changes

- **Shell changes (Zsh)**:
  - Reload: `source ~/.zshrc`
  - Or open new terminal session

- **Neovim**:
  - Open nvim and run: `:checkhealth`
  - Check plugin status: `:Lazy`
  - Test LSP: open a file and run: `:LspInfo`

- **Zed**:
  - Settings update automatically on save
  - Check language server status: `Cmd+Shift+P` → "lsp: status"
  - Test AI agent: `Cmd+Shift+P` → "assistant: toggle focus"

- **Terminal emulators**:
  - Kitty: reload config: `Ctrl+Shift+F5` or restart
  - WezTerm: reload config: `Ctrl+Shift+R`
  - Ghostty: reload config from menu or restart

- **Tmux**:
  - Reload: `tmux source-file ~/.tmux.conf`
  - Or prefix key + `:source-file ~/.tmux.conf`

- **Starship**:
  - Test prompt: `starship module character`
  - Reload shell: `exec zsh` or open new terminal

- **Yazi**:
  - Test configuration: launch `yazi` and navigate

## Troubleshooting

- Configuration changes not visible:
  - Confirm symlinks exist: `ls -la ~/.zshrc ~/.config/nvim`
  - Reload shell: `source ~/.zshrc` or open new terminal
  - Check for conflicting config files in home directory

- Stow conflicts:
  - If stow fails, existing files may conflict: `stow -n <package>` to preview
  - Move or remove conflicting files first: `mv ~/.zshrc ~/.zshrc.bak`

- Neovim issues:
  - Run health check: `nvim --headless +checkhealth +q`
  - Ensure plugins are installed (if using lazy.nvim, plugins auto-install on first launch)
  - Clear cache if needed: `rm -rf ~/.local/share/nvim`

- Zed issues:
  - Check language server logs: `Cmd+Shift+P` → "zed: open log"
  - Verify MCP server: ensure Context7 API key is set in settings
  - Reset Zed settings: backup then remove `~/.config/zed`

- Terminal not applying theme:
  - Verify correct terminal emulator is active
  - Restart terminal after symlinking config
  - Check config path is correct in terminal settings

- Starship prompt not showing:
  - Ensure starship is installed: `which starship`
  - Verify it's initialized in your shell config

- Restore from backup if needed:
  - `git checkout -- <file>` to revert specific file
  - `git reset --hard HEAD` to revert all changes

## Security notes

- **Inspect scripts** before running them, especially any bootstrap or installation scripts
- **Never commit secrets**:
  - API keys, tokens, or passwords
  - SSH keys or certificates
  - Environment-specific configuration
- **Use alternatives for secrets**:
  - Environment variables
  - Secret management tools (1Password, Bitwarden, etc.)
  - `.env` files (add to `.gitignore`)
- **Review commits** before pushing to ensure no sensitive data is included

## Contributing

If you want to contribute:

1. Fork the repository.
2. Create a feature branch:
   - `git checkout -b feat/some-config`
3. Make your changes and add tests or notes.
4. Open a pull request describing what changed and why.

Follow any contribution guidelines or coding style in the repo.

## Contact / Support

If you need help with these dotfiles, add a clear issue or contact the repository owner/maintainer with a description of what you tried and what failed, including relevant logs or command output.

## License

Include your preferred license here (e.g., MIT, Apache-2.0). If this repo doesn't include a `LICENSE` file, consider adding one.

---

## Quick reference

Common tasks:

```bash
# Update dotfiles
cd ~/.dotfiles && git pull --rebase

# Stow a package
cd ~/.dotfiles && stow <package>

# Restow a package (after changes)
cd ~/.dotfiles && stow -R <package>

# Restow all packages at once
cd ~/.dotfiles && stow -R */

# List what symlinks stow would create (dry run)
cd ~/.dotfiles && stow -n -v <package>

# Delete a package's symlinks
cd ~/.dotfiles && stow -D <package>

# Verify symlinks
ls -la ~/.zshrc ~/.config/nvim ~/.config/zed

# Reload shell configuration
source ~/.zshrc
# or
exec zsh
```

## Getting help

- Open an issue with details about what you tried and what failed
- Include your OS, shell, and relevant error messages or logs
- Check existing issues for similar problems
