# ~/.zshenv - Environment variables (always loaded)
# This file is sourced for all zsh instances (login, interactive, scripts)

# Colors and basics
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export EDITOR=vim

# History configuration
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# Homebrew paths - This helps your computer find programs installed by Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=/usr/local/bin:$PATH

# Go Lang
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# MacPorts
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

# pipx (from .bashrc)
export PATH="$PATH:$HOME/.local/bin"

# NVM
export NVM_DIR="$HOME/.nvm"

# MCP
export MCP_UI_VIEWER=none

