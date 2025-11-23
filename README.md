# Dotfiles

My personal development environment configuration for macOS. Easily transfer your terminal and vim setup to new computers.

## Features

### Terminal Setup
- **iTerm2** - Modern terminal emulator
- **Oh-My-Zsh** - Zsh configuration framework
- **Powerlevel10k** - Beautiful and fast prompt theme
- **Zsh Plugins**:
  - `zsh-autosuggestions` - Command suggestions based on history
  - `zsh-syntax-highlighting` - Syntax highlighting for commands

### Modern CLI Tools
Replacing standard Unix tools with modern alternatives:
- `bat` → Better `cat` with syntax highlighting
- `zoxide` → Better `cd` with smart directory jumping (aliased as `z`)
- `rip` → Better `rm` with safety features
- `lsd` → Better `ls` with icons and colors
- `ripgrep` → Better `grep` (aliased as `rg`)
- `bottom` → Better `top` for system monitoring (aliased as `btm`)
- `fzf` → Fuzzy finder for files and history
- `thefuck` → Corrects previous command mistakes
- `diff-so-fancy` → Better git diff output

### Development Tools
- **Vim/Neovim** - Text editor with Vundle plugin manager
- **Git** - Version control with custom configuration
- **Version Managers**: pyenv, rbenv, tfenv
- **Cloud/Infrastructure**: kubectl, helm, terraform, vault, gcloud
- **Utilities**: direnv, jq, pre-commit

### Organized Configuration
- `.zshrc` - Core Zsh configuration
- `.zsh_aliases` - All command aliases (Git, K8s, Terraform, GCP, etc.)
- `.zsh_functions` - Custom shell functions
- `.zsh_integrations` - Tool integrations (pyenv, kubectl, aws, etc.)
- `.vimrc` - Vim configuration
- `.gitconfig` - Git configuration with signing
- `.p10k.zsh` - Powerlevel10k theme settings
- `ssh_config` - SSH configuration

## Installation

### Quick Setup on New Machine

1. **Clone this repository:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/repos/dotfiles
   cd ~/repos/dotfiles
   ```

2. **Run the setup script:**
   ```bash
   ./setup.sh
   ```
   This will:
   - Install Oh-My-Zsh
   - Install Powerlevel10k theme
   - Install zsh plugins
   - Create symlinks for all config files
   - Safe to run multiple times (idempotent)

3. **Install applications:**
   ```bash
   ./install_apps.sh
   ```
   This will install all required tools via Homebrew.

4. **Restart your terminal** or run:
   ```bash
   source ~/.zshrc
   ```

5. **Configure Powerlevel10k** (if needed):
   ```bash
   p10k configure
   ```

### Manual Installation

If you prefer to install components individually:

```bash
# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Create symlinks manually
ln -s ~/repos/dotfiles/.zshrc ~/.zshrc
ln -s ~/repos/dotfiles/.zsh_aliases ~/.zsh_aliases
ln -s ~/repos/dotfiles/.zsh_functions ~/.zsh_functions
ln -s ~/repos/dotfiles/.zsh_integrations ~/.zsh_integrations
ln -s ~/repos/dotfiles/.vimrc ~/.vimrc
ln -s ~/repos/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/repos/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -s ~/repos/dotfiles/ssh_config ~/.ssh/config
```

## Notable Aliases

### Git Shortcuts
- `g` - git
- `gs` - git switch
- `gss` - git status
- `gaa` - git add -A && git status
- `gc` - git commit
- `gp` - git pull
- `gpu` - git push
- `gsm`/`gsmm` - Switch to master/main and pull
- `gr` - git rebase

### Kubernetes (K8s)
- `k` - kubectl
- `kg` - kubectl get
- `kgp` - kubectl get pods
- `kd` - kubectl delete
- `ke <pod>` - Execute bash in pod

### Terraform
- `tf` - terraform
- `tfi` - terraform init
- `tfp` - terraform plan
- `tfa` - terraform apply
- `tg` - terragrunt

### Navigation
- `..` - cd ..
- `...` - cd /
- `../()` - cd ../$1 (e.g., `../ dir`)

### GCP
- `c` - gcloud
- `cal` - gcloud auth login
- `caal` - gcloud auth application-default login

## Customization

### Adding New Aliases
Edit `~/.zsh_aliases` (which is symlinked to this repo) and run:
```bash
source ~/.zshrc
```

### Adding New Functions
Edit `~/.zsh_functions` and reload your shell.

### Modifying Git Config
Edit `.gitconfig` in this repo. Remember to update your email and signing key.

## File Structure

```
dotfiles/
├── .gitconfig              # Git configuration
├── .gitignore             # Git ignore for dotfiles repo
├── .p10k.zsh              # Powerlevel10k theme configuration
├── .vimrc                 # Vim configuration
├── .zsh_aliases           # All shell aliases
├── .zsh_functions         # Custom shell functions
├── .zsh_integrations      # Tool integrations (pyenv, kubectl, etc.)
├── .zshrc                 # Main Zsh configuration
├── install_apps.sh        # Homebrew application installer
├── README.md              # This file
├── setup.sh               # Automated setup script
└── ssh_config             # SSH configuration
```

## Requirements

- macOS (tested on macOS Sonoma+)
- Homebrew (will be installed by `install_apps.sh` if not present)
- Git
- A Nerd Font (for Powerlevel10k icons) - download from [nerdfonts.com](https://www.nerdfonts.com/)

## Notes

- The setup is safe to run multiple times - it will skip already installed components
- All config files are symlinked, so changes in your home directory will be reflected in the repo
- Remember to set your Git email and signing key in `.gitconfig`
- Datadog-specific configurations are loaded from `~/.zshrc_datadog` if present (not tracked in this repo)

## Updating

To update your dotfiles on the current machine:

```bash
cd ~/repos/dotfiles
git pull
source ~/.zshrc
```

To update on a new machine, just run `./setup.sh` again.

## License

Feel free to use and modify for your own setup!
