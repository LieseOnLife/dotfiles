# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###################
### Oh My Zsh Configuration
###################

# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Oh My Zsh settings
CASE_SENSITIVE="true"
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 13
HIST_STAMPS="mm/dd/yyyy"

# Plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

###################
### Editor Configuration
###################

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

###################
### Source Modular Configuration Files
###################

# Load aliases
[[ -f ~/.zsh_aliases ]] && source ~/.zsh_aliases

# Load custom functions
[[ -f ~/.zsh_functions ]] && source ~/.zsh_functions

# Load tool integrations
[[ -f ~/.zsh_integrations ]] && source ~/.zsh_integrations

# Load Datadog-specific configuration
[[ -s ~/.zshrc_datadog ]] && source ~/.zshrc_datadog

# Load Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
