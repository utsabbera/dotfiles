#!/usr/bin/env bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo -e "${BLUE}  Dotfiles Installation${NC}"
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo ""

info() {
    echo -e "${BLUE}==>${NC} $1"
}

success() {
    echo -e "${GREEN}✓${NC} $1"
}

warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

error() {
    echo -e "${RED}✗${NC} $1"
}

backup_file() {
    local file=$1
    if [ -e "$file" ] && [ ! -L "$file" ]; then
        mkdir -p "$BACKUP_DIR"
        cp -r "$file" "$BACKUP_DIR/"
        success "Backed up: $file"
    fi
}

create_symlink() {
    local source=$1
    local target=$2

    mkdir -p "$(dirname "$target")"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
        backup_file "$target"
        rm -rf "$target"
    elif [ -L "$target" ]; then
    
        rm "$target"
    fi

    ln -s "$source" "$target"
    success "Linked: $target -> $source"
}

echo ""
info "Starting dotfiles installation..."
echo ""

info "Installing Zsh configurations..."
create_symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"

info "Installing Vim configuration..."
create_symlink "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"

info "Installing Git configurations..."
create_symlink "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
mkdir -p "$HOME/.config/git"
create_symlink "$DOTFILES_DIR/git/ignore" "$HOME/.config/git/ignore"

info "Installing SSH configuration..."
mkdir -p "$HOME/.ssh"
create_symlink "$DOTFILES_DIR/ssh/config" "$HOME/.ssh/config"
chmod 700 "$HOME/.ssh"
chmod 600 "$HOME/.ssh/config" 2>/dev/null || true

info "Installing GitHub CLI configurations..."
mkdir -p "$HOME/.config/gh"
create_symlink "$DOTFILES_DIR/gh/config.yml" "$HOME/.config/gh/config.yml"

info "Installing VSCode configurations..."
VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
mkdir -p "$VSCODE_USER_DIR"
create_symlink "$DOTFILES_DIR/vscode/settings.json" "$VSCODE_USER_DIR/settings.json"
create_symlink "$DOTFILES_DIR/vscode/keybindings.json" "$VSCODE_USER_DIR/keybindings.json"

info "Installing Claude Code configurations..."
mkdir -p "$HOME/.claude"
create_symlink "$DOTFILES_DIR/claude/settings.json" "$HOME/.claude/settings.json"
create_symlink "$DOTFILES_DIR/claude/CLAUDE.md" "$HOME/.claude/CLAUDE.md"

echo ""
warning "iTerm2 configuration requires manual import:"
warning "  1. Open iTerm2 -> Preferences -> General -> Preferences"
warning "  2. Check 'Load preferences from a custom folder or URL'"
warning "  3. Set to: $DOTFILES_DIR/iterm2"
warning "  4. Restart iTerm2"

echo ""
warning "Raycast configuration requires manual import:"
warning "  Open Raycast -> Settings -> Advanced -> Import/Export"
warning "  Import from: $DOTFILES_DIR/raycast/raycast.rayconfig"

echo ""
warning "Keychron keyboard configuration:"
warning "  Import $DOTFILES_DIR/keyboard/keychron_k3_pro_config_basic.json"
warning "  into Keychron Launcher software"

echo ""
echo -e "${BLUE}═══════════════════════════════════════${NC}"
info "Installation complete!"
echo -e "${BLUE}═══════════════════════════════════════${NC}"
echo ""

if [ -d "$BACKUP_DIR" ]; then
    info "Backups saved to: $BACKUP_DIR"
fi

echo ""
info "Next steps:"
echo "  1. Install Homebrew packages: brew bundle install --file=$DOTFILES_DIR/Brewfile"
echo "  2. Restart your terminal or run: source ~/.zshrc"
echo "  3. Import iTerm2, Raycast, and keyboard configs manually (see warnings above)"
echo ""
