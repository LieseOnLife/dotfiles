#!/bin/bash

# Dotfiles Setup Script
# This script will set up your development environment on a new machine
# Safe to run multiple times - will skip or update as needed

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting dotfiles setup...${NC}\n"

# Get the dotfiles directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Function to create symlink (idempotent)
create_symlink() {
    local source="$1"
    local target="$2"

    # If symlink already points to correct location, skip
    if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
        echo -e "${BLUE}→${NC} $target already linked correctly (skipping)"
        return 0
    fi

    # If target exists (file or incorrect symlink), back it up
    if [ -e "$target" ] || [ -L "$target" ]; then
        echo -e "${YELLOW}Warning: $target exists. Backing up to ${target}.backup${NC}"
        mv "$target" "${target}.backup"
    fi

    ln -s "$source" "$target"
    echo -e "${GREEN}✓${NC} Linked $source -> $target"
}

# Install Oh-My-Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${YELLOW}Installing Oh-My-Zsh...${NC}"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo -e "${BLUE}→${NC} Oh-My-Zsh already installed (skipping)"
fi

# Install Powerlevel10k theme
P10K_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
if [ ! -d "$P10K_DIR" ]; then
    echo -e "${YELLOW}Installing Powerlevel10k theme...${NC}"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
else
    echo -e "${BLUE}→${NC} Powerlevel10k already installed (skipping)"
fi

# Install zsh-autosuggestions plugin
AUTOSUGGESTIONS_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
if [ ! -d "$AUTOSUGGESTIONS_DIR" ]; then
    echo -e "${YELLOW}Installing zsh-autosuggestions...${NC}"
    git clone https://github.com/zsh-users/zsh-autosuggestions "$AUTOSUGGESTIONS_DIR"
else
    echo -e "${BLUE}→${NC} zsh-autosuggestions already installed (skipping)"
fi

# Install zsh-syntax-highlighting plugin
SYNTAX_HIGHLIGHTING_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
if [ ! -d "$SYNTAX_HIGHLIGHTING_DIR" ]; then
    echo -e "${YELLOW}Installing zsh-syntax-highlighting...${NC}"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$SYNTAX_HIGHLIGHTING_DIR"
else
    echo -e "${BLUE}→${NC} zsh-syntax-highlighting already installed (skipping)"
fi

# Create symlinks for dotfiles
echo -e "\n${YELLOW}Creating/checking symlinks...${NC}"

create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/.zsh_aliases" "$HOME/.zsh_aliases"
create_symlink "$DOTFILES_DIR/.zsh_functions" "$HOME/.zsh_functions"
create_symlink "$DOTFILES_DIR/.zsh_integrations" "$HOME/.zsh_integrations"
create_symlink "$DOTFILES_DIR/.vimrc" "$HOME/.vimrc"
create_symlink "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
create_symlink "$DOTFILES_DIR/.gitconfig-datadog" "$HOME/.gitconfig-datadog"
create_symlink "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"

# Create SSH directory if it doesn't exist
if [ ! -d "$HOME/.ssh" ]; then
    mkdir -p "$HOME/.ssh"
    chmod 700 "$HOME/.ssh"
    echo -e "${GREEN}✓${NC} Created ~/.ssh directory"
fi

create_symlink "$DOTFILES_DIR/ssh_config" "$HOME/.ssh/config"
chmod 600 "$HOME/.ssh/config"

# Install VS Code 'code' command
echo -e "\n${YELLOW}Configuring VS Code...${NC}"
VSCODE_BIN="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
if [ -f "$VSCODE_BIN" ]; then
    if command -v code &> /dev/null; then
        echo -e "${BLUE}→${NC} 'code' command already available (skipping)"
    else
        # Create /usr/local/bin if it doesn't exist
        if [ ! -d "/usr/local/bin" ]; then
            sudo mkdir -p /usr/local/bin
        fi
        sudo ln -sf "$VSCODE_BIN" /usr/local/bin/code
        echo -e "${GREEN}✓${NC} Installed 'code' command"
    fi
else
    echo -e "${BLUE}→${NC} VS Code not installed (skipping 'code' command)"
fi

# Configure iTerm2 to use dotfiles preferences
echo -e "\n${YELLOW}Configuring iTerm2...${NC}"
if [ -d "/Applications/iTerm.app" ]; then
    defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$DOTFILES_DIR/iterm2"
    defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
    defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile -bool true
    echo -e "${GREEN}✓${NC} iTerm2 configured to sync preferences"
else
    echo -e "${BLUE}→${NC} iTerm2 not installed (skipping)"
fi

# Configure cmux
echo -e "\n${YELLOW}Configuring cmux...${NC}"
mkdir -p "$HOME/.config/cmux"
create_symlink "$DOTFILES_DIR/cmux/settings.json" "$HOME/.config/cmux/settings.json"

# Configure Ghostty (used by cmux for terminal rendering)
echo -e "\n${YELLOW}Configuring Ghostty...${NC}"
mkdir -p "$HOME/.config/ghostty"
create_symlink "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"

echo -e "\n${GREEN}✓ Setup complete!${NC}"
echo -e "${YELLOW}Note: Run './install_apps.sh' to install/update all required applications.${NC}"
echo -e "${YELLOW}Restart your terminal or run 'source ~/.zshrc' to apply changes.${NC}"
echo -e "${YELLOW}If using iTerm2, restart it to sync your settings.${NC}"
