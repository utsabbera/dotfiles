# Dotfiles

My personal macOS configuration files and setup scripts.

## What's Included

### Shell Configuration
- **zsh/** - Zsh shell configuration with Powerlevel10k theme
  - `.zshrc` - Main shell configuration
  - `.p10k.zsh` - Powerlevel10k theme settings

### Editor Configurations
- **vim/** - Vim editor configuration
- **vscode/** - Visual Studio Code settings and keybindings

### Development Tools
- **git/** - Git configuration and global ignore patterns
- **ssh/** - SSH client configuration
- **gh/** - GitHub CLI configuration
- **claude/** - Claude Code settings

### Applications
- **iterm2/** - iTerm2 terminal emulator settings
- **raycast/** - Raycast launcher configuration
- **keyboard/** - Keychron keyboard configuration
- **Brewfile** - Homebrew packages, casks, and VSCode extensions

## Installation

### Fresh macOS Setup

```bash
# 1. Clone this repository
git clone https://github.com/utsabbera/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# 2. Run the installation script
./install.sh

# 3. Install Homebrew packages (optional)
brew bundle install

# 4. Restart your terminal or source your shell config
source ~/.zshrc
```

### What the Install Script Does

The `install.sh` script:
- Creates symlinks from your home directory to config files in this repo
- Backs up existing configs to `~/.dotfiles-backup-TIMESTAMP/`
- Sets proper permissions for SSH configs
- Provides instructions for manual imports (iTerm2, Raycast, keyboard)

**Important:** Since symlinks are used, any changes you make to your configs will automatically be reflected in this repository.

## Manual Setup Steps

Some applications require manual configuration import:

### iTerm2
1. Open iTerm2 → Preferences → General → Preferences
2. Check "Load preferences from a custom folder or URL"
3. Set to: `~/.dotfiles/iterm2`
4. Restart iTerm2

### Raycast
1. Open Raycast → Settings → Advanced → Import/Export
2. Import from: `~/.dotfiles/raycast/raycast.rayconfig`

### Keychron Keyboard
1. Open Keychron Launcher software
2. Import `~/.dotfiles/keyboard/keychron_k3_pro_config_basic.json`

## Making Changes

Since configs are symlinked, you can edit them in place:

```bash
# Edit your zsh config
vim ~/.zshrc

# Commit changes
cd ~/.dotfiles
git add -A
git commit -m "Update zsh configuration"
git push
```

## Updating on Another Machine

```bash
cd ~/.dotfiles
git pull
```

Changes will be immediately reflected since files are symlinked.

## Uninstalling

To remove symlinks and restore backups:

```bash
# Manual removal
rm ~/.zshrc ~/.p10k.zsh ~/.vimrc ~/.gitconfig ~/.ssh/config
rm -rf ~/.config/gh ~/.config/git
rm ~/Library/Application\ Support/Code/User/settings.json
rm ~/Library/Application\ Support/Code/User/keybindings.json
rm ~/.claude/settings.json ~/.claude/CLAUDE.md

# Restore from backup
cp -r ~/.dotfiles-backup-TIMESTAMP/* ~/
```

## What's Not Included

- `.claude/config.json` - Contains ephemeral approval state
- Machine-specific secrets or API keys (use 1Password instead)
- Application data or caches

## Security Notes

- No API keys or passwords are stored in this repository
- Secrets are managed through 1Password (`op://...` references)
- SSH config only contains socket paths, no sensitive hostnames
- Git config includes public signing key only

## Requirements

- macOS (tested on Ventura/Sonoma)
- [Homebrew](https://brew.sh/)
- [1Password CLI](https://developer.1password.com/docs/cli/) (for secret management)

## Homebrew Packages

See `Brewfile` for the complete list. Key tools include:
- Development: git, gh, docker, colima, neovim
- Languages: go, node, nvm
- Utilities: fzf, ripgrep, bat, tmux
- Apps: Arc, VSCode, Raycast, Goland

## License

MIT
