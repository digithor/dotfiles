# Dotfiles

This repository contains configuration files ("dotfiles") for your environment. It provides a centralized, version-controlled way to manage shell configuration, editor settings, terminal themes, and other personal environment customizations.

This README explains how to install, use, and extend the dotfiles in this repo.

## Repository layout (high level)

The repo is organized by tools and features. Example directories you may see in this repo:

- `.dotfiles/fsh` — fish shell configs (if present)
- `.dotfiles/ghostty` — terminal/daemon configs
- `.dotfiles/helix` — Helix editor configs
- `.dotfiles/k9s` — k9s configs
- `.dotfiles/kitty` — Kitty terminal configs
- `.dotfiles/neovim` — Neovim configs
- `.dotfiles/scripts` — helper scripts (installers, bootstrap helpers)
- `.dotfiles/starship` — starship prompt config
- `.dotfiles/tmux` — Tmux configs
- `.dotfiles/vim` — legacy Vim configs
- `.dotfiles/wezterm` — WezTerm terminal configs
- `.dotfiles/yazi` — (project-specific) config
- `.dotfiles/zed` — Zed editor configs
- `.dotfiles/zsh_config` and `.dotfiles/zsh_custom` — zsh configuration pieces

There may also be a `.gitignore` and other top-level files.

## Goals

- Keep your environment reproducible across machines.
- Make it easy to add, test, and roll back configuration changes.
- Separate concerns by tool so you can enable/disable modules easily.

## Prerequisites

Common tools that make installing and managing dotfiles easier:

- `git` (to clone and update the repo)
- `stow` or a small symlink manager (optional but recommended)
- `bash`, `zsh`, or your preferred shell
- Optional: `make` if the repo includes a `Makefile` for bootstrapping

You don't need all of these — the instructions below include alternative methods.

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

### 2) GNU Stow (recommended for modular symlinking)

GNU Stow is a simple tool that turns directories into sets of symlinks in your home directory.

1. Install stow:
   - macOS: `brew install stow`
   - Debian/Ubuntu: `sudo apt install stow`

2. Clone the repo:
   - `git clone <repo-url> ~/.dotfiles`

3. From the repo root, run stow for the packages you want:
   - `cd ~/.dotfiles`
   - `stow zsh_config` (creates symlinks for files inside `zsh_config` into your home)
   - `stow neovim`
   - `stow kitty`
   - Repeat for other modules as desired.

Each package directory should contain files arranged as they will appear in your home (or under `.config`).

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

- For shell changes:
  - `source ~/.zshrc` or open a new shell.
- For Neovim:
  - Open `nvim` and check `:checkhealth`.
- For terminal (kitty/wezterm):
  - Reload config per the terminal's instructions or restart the terminal.

## Troubleshooting

- Wrong file loaded / no changes visible:
  - Confirm the symlink exists and points to the expected file: `ls -l ~/.zshrc`
  - Ensure there are no conflicting dotfiles (e.g., `~/.zshrc` vs `~/.zprofile`).
- Permissions:
  - Ensure files are readable: `chmod 644 <file>`
- Scripts not executable:
  - `chmod +x scripts/bootstrap.sh`
- If something breaks, restore from your backup or revert commits:
  - `git checkout -- <file>`
  - Or restore from your backup archive.

## Security notes

- Inspect any scripts before running them.
- Do not commit secrets (API keys, private certs) to this repo. Use environment variables or a secure secrets manager.

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

Notes:
- This README is intentionally generic so it fits different environments. Adapt commands and paths to your platform and personal workflow.
- If you want, tell me which shell and OS you use and I can provide a tailored install snippet you can run locally.