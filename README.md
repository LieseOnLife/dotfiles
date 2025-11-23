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

### Smart Features
- **Auto-detecting Git workflows** - Automatically detects whether your repo uses `main` or `master`
- **Auto-branch push** - Push commands automatically detect your current branch
- **Quick config editing** - One-command access to edit any config file

### Organized Configuration
- `.zshrc` - Core Zsh configuration
- `.zsh_aliases` - All command aliases (Git, K8s, Terraform, GCP, etc.)
- `.zsh_functions` - Custom shell functions (including smart git helpers)
- `.zsh_integrations` - Tool integrations (pyenv, kubectl, aws, etc.)
- `.vimrc` - Vim configuration
- `.gitconfig` - Git configuration with signing
- `.p10k.zsh` - Powerlevel10k theme settings
- `ssh_config` - SSH configuration

## Installation

### Bootstrap from Scratch (Fresh Machine)

If you're setting up a brand new Mac, follow this order:

**Phase 1: Get Git**
```bash
# Install Xcode Command Line Tools (includes git)
xcode-select --install
```

**Phase 2: Clone Dotfiles**
```bash
# Clone the repo (authenticate with GitHub when prompted)
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/repos/dotfiles
cd ~/repos/dotfiles
```

**Phase 3: Setup Shell Environment**
```bash
# Installs Oh-My-Zsh, plugins, and creates symlinks
./setup.sh
```

**Phase 4: Install All Tools**
```bash
# Installs Homebrew (if needed) and all development tools
./install_apps.sh
```

**Phase 5: Activate**
```bash
# Restart terminal or source the new config
source ~/.zshrc

# Configure your Powerlevel10k prompt theme
p10k configure
```

**Phase 6: Personalize**
```bash
# Update git config with your email and signing key
zsg  # Opens .gitconfig for editing
```

### Quick Setup (If You Already Have Git)

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

## Notable Aliases

### Edit Config Files (Quick Access)
- `zs` - Edit main `.zshrc`
- `zsa` - Edit `.zsh_aliases`
- `zsf` - Edit `.zsh_functions`
- `zsi` - Edit `.zsh_integrations`
- `zsv` - Edit `.vimrc`
- `zsg` - Edit `.gitconfig`
- `zsp` - Edit `.p10k.zsh`
- `zssh` - Edit `.ssh/config`
- `zsd` - Edit `.zshrc_datadog`
- `szs` - Reload/source `.zshrc`

### Git Shortcuts (with Smart Auto-Detection)
- `g` - git
- `gs` - git switch
- `gss` - git status
- `gaa` - git add -A && git status
- `gc` - git commit
- `gp` - git pull
- `gpu` - git push
- `gsm` - **Smart:** Switch to default branch (main/master) and pull
- `gpom` - **Smart:** Pull from default branch (main/master) and fetch tags
- `grm` - **Smart:** Rebase on default branch (main/master)
- `gu` - **Smart:** Update workflow (switch to default, back, rebase)
- `gus` - **Smart:** Update with stash (stash, update, rebase, apply)
- `gpsuo [branch]` - **Smart:** Push with upstream (auto-detects current branch or use specified)
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

### Quick Edit Commands
Use the `zs*` aliases to quickly edit any config file:
```bash
zsa   # Edit aliases
zsf   # Edit functions
zs    # Edit main zshrc
szs   # Reload changes
```

### Adding New Aliases
Edit `~/.zsh_aliases` (which is symlinked to this repo):
```bash
zsa   # Opens aliases file
# Make your changes, save, then:
szs   # Reload config
```

### Adding New Functions
Edit `~/.zsh_functions` and reload your shell:
```bash
zsf   # Opens functions file
# Make your changes, save, then:
szs   # Reload config
```

### Modifying Git Config
Edit `.gitconfig` in this repo:
```bash
zsg   # Opens git config
```
Remember to update your email and signing key.

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

### Smart Git Features
- Git commands automatically detect whether your repo uses `main` or `master` as the default branch
- No more separate commands for main vs master workflows!
- `gpsuo` (git push set-upstream origin) automatically uses your current branch, or you can specify one: `gpsuo feature-branch`

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
