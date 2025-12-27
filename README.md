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
- `starship/` — Starship cross-shell prompt configuration
- `tmux/` — Tmux terminal multiplexer configuration
- `vim/` — Legacy Vim configuration
- `wezterm/` — WezTerm terminal emulator configuration
- `yazi/` — Yazi terminal file manager configuration
- `zed/` — Zed editor settings
- `zsh_config/` — Core Zsh configuration (.zprofile, .zshrc, .zshenv)
- `zsh_custom/` — Custom Zsh plugins for Kubernetes tools (k8sgpt, kubectl, pulumi, etc.)

## Goals

- Keep your environment reproducible across machines
- Make it easy to add, test, and roll back configuration changes
- Separate concerns by tool so you can enable/disable modules easily
- Share configurations between multiple systems (macOS, Linux)

## Key features

- **Catppuccin theme** — Consistent dark theme across multiple tools (Neovim, Helix, Kitty, Ghostty, K9s)
- **Neovim setup** — Lua-based configuration with LSP, AI integration, formatting, and Treesitter
- **Zsh enhancements** — Custom plugins for Kubernetes tools (kubectl, argo-rollouts, k9s, popeye, kafkactl)
- **Terminal options** — Multiple terminal emulator configurations (Kitty, WezTerm, Ghostty)

## Prerequisites

Essential tools for installing and managing these dotfiles:

- `git` — Required to clone and update the repository
- `stow` — Recommended for managing symlinks (macOS: `brew install stow`, Linux: `sudo apt install stow`)
- `zsh` — Primary shell (default on macOS)
- Optional tools for full functionality:
  - `fish` — If using fish shell configuration
  - `neovim` — If using Neovim configuration
  - `tmux` — If using Tmux configuration
  - Terminal emulators: kitty, wezterm, ghostty (install as needed)

## Backup your existing configuration (recommended)

Before installing anything, back up your current dotfiles so you can restore them if needed:

- Manually move files to a safe location:
  - `mv ~/.zshrc ~/dotfiles-backup/`
  - `mv ~/.config/nvim ~/dotfiles-backup/`
- Or create an archive:
  - `tar -czf ~/dotfiles-backup-$(date +%F).tgz ~/.config/nvim ~/.zshrc ~/.tmux.conf`

## Installation methods

Choose one of the following installation approaches.

### 1) Bootstrap script (if provided)

If this repository includes an installation or bootstrap script (for example `scripts/bootstrap.sh`), you can run it to perform the automated setup steps:

- Inspect the script before running it.
- Run it from the repo root:

  1. Clone the repo:
     - `git clone <repo-url> ~/.dotfiles`
  2. Run the bootstrap script (if present):
     - `cd ~/.dotfiles`
     - `./scripts/bootstrap.sh`

The script — if present — typically installs required dependencies and creates the necessary symlinks.

### 2) GNU Stow (recommended)

GNU Stow is a simple tool that creates symlinks from package directories to your home directory.

1. Install stow:
    - macOS: `brew install stow`
    - Debian/Ubuntu: `sudo apt install stow`

2. Clone the repo:
    - `git clone <repo-url> ~/.dotfiles`

3. Stow the packages you want:
    ```bash
    cd ~/.dotfiles
    stow zsh_config    # Zsh configuration
    stow zsh_custom    # Custom Zsh plugins
    stow starship      # Starship prompt
    stow neovim        # Neovim configuration
    stow tmux          # Tmux configuration
    stow kitty         # Kitty terminal (or use wezterm/ghostty)
    ```

4. Choose one terminal emulator and stow only that one:
    - `stow kitty`
    - `stow wezterm`
    - `stow ghostty`

Each package directory contains files arranged as they appear in your home directory.

### 3) Manual symlinking

If you prefer not to use stow, create symlinks manually:

1. Clone the repo:
   - `git clone <repo-url> ~/.dotfiles`

2. Create symlinks for the files you want to enable:
   - `ln -s ~/.dotfiles/zsh_config/.zshrc ~/.zshrc`
   - `ln -s ~/.dotfiles/neovim ~/.config/nvim`
   - `ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf`

Adjust the source and target paths to match your repo structure.

## Updating

To update your local copy of the dotfiles to the latest in the remote repo:

- `cd ~/.dotfiles`
- `git pull --rebase`

If you used stow: re-run `stow <package>` if you added new files or changed package structure.

If you used a bootstrap script: re-run it if the script is idempotent and intended for updates.

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

- **Terminal emulators**:
  - Kitty: reload config: `Ctrl+Shift+F5` or restart
  - WezTerm: reload config: `Ctrl+Shift+R`
  - Ghostty: reload config from menu or restart

- **Tmux**:
  - Reload: `tmux source-file ~/.tmux.conf`
  - Or prefix key + `:source-file ~/.tmux.conf`

- **Starship**:
  - Test prompt: `starship module character`

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
cd ~/.dotfiles && git pull

# Restow a package (after changes)
cd ~/.dotfiles && stow -R <package>

# List what symlinks stow would create
stow -n -v <package>

# Delete a package's symlinks
stow -D <package>
```

## Getting help

- Open an issue with details about what you tried and what failed
- Include your OS, shell, and relevant error messages or logs
- Check existing issues for similar problems