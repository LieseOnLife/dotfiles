#!/bin/bash

# Application Installation Script
# Installs all required tools and applications via Homebrew
# Safe to run multiple times - Homebrew will skip already installed packages

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${GREEN}Installing applications and tools...${NC}\n"

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo -e "${YELLOW}Homebrew not found. Installing Homebrew...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo -e "${BLUE}→${NC} Homebrew already installed"
    echo -e "${YELLOW}Updating Homebrew...${NC}"
    brew update
fi

echo -e "\n${YELLOW}Installing CLI tools...${NC}"

# Modern CLI replacements
brew install bat              # Better cat
brew install zoxide           # Better cd (z command)
brew install rm-improved      # Better rm (rip command)
brew install lsd              # Better ls
brew install ripgrep          # Better grep (rg command)
brew install bottom           # Better top (btm command)

# Additional modern tools
brew install fzf              # Fuzzy finder
brew install thefuck          # Command correction
brew install diff-so-fancy    # Better git diff

# Development tools
brew install git
brew install vim
brew install neovim

# Version managers
brew install pyenv            # Python version management
brew install rbenv            # Ruby version management
brew install tfenv            # Terraform version management

# Cloud & Infrastructure tools
brew install kubectl          # Kubernetes CLI
brew install helm             # Kubernetes package manager
brew install terraform        # Infrastructure as code
brew install direnv           # Environment variable management

# Other utilities
brew install jq               # JSON processor
brew install wget
brew install pre-commit       # Git hooks framework

echo -e "\n${YELLOW}Installing cask applications...${NC}"

# Terminal emulator
brew install --cask iterm2

# Code editor
brew install --cask visual-studio-code

echo -e "\n${GREEN}✓ Installation complete!${NC}"
echo -e "${YELLOW}Note: Some tools may require additional configuration.${NC}"
echo -e "${YELLOW}Run 'p10k configure' to customize your Powerlevel10k prompt.${NC}"
