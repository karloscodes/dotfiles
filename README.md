# dotfiles

My dotfiles configuration for macOS development environment.

## What's Included

### Development Tools
- **mise**: Runtime version manager for Node.js, Go, Ruby, Elixir
- **ripgrep**: Fast text search tool
- **lazygit**: Terminal UI for git commands
- **fzf**: Fuzzy finder for command line
- **bat, exa, fd, tldr**: Enhanced CLI tools

### Terminal & Editor
- **Ghostty**: Modern terminal emulator with Catppuccin theme
- **JetBrains Mono Nerd Font**: Primary coding font
- **Meslo & Hack Nerd Fonts**: Additional font options
- **Visual Studio Code**: Primary code editor

### Shell Configuration
- **Zsh** with Oh My Zsh
- Custom aliases for Homebrew maintenance
- Integrated fzf and mise activation

## Installation

### Initial Setup
```bash
git clone https://github.com/karloscodes/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
chmod +x install.sh
./install.sh
```

### Updates
```bash
# Run the update script to update all tools and packages
./update.sh
```

## Features

### Idempotent Installation
The install script can be run multiple times safely. It will:
- Check if tools are already installed before installing
- Backup existing files before creating symlinks
- Skip installation steps that are already completed

### Brew Aliases
- `brewup`: Update, upgrade, cleanup, and autoremove packages
- `brewclean`: Cleanup, autoremove, and run doctor

### Development Environment
- **Node.js LTS** via mise
- **Go latest** via mise  
- **Ruby latest** via mise
- **Elixir latest** via mise
- **Rails** gem automatically installed

### Terminal Configuration
Ghostty is configured with:
- Font size: 15
- Font family: JetBrains Mono Nerd Font
- Theme: Catppuccin Mocha (dark/light)

## File Structure
```
dotfiles/
├── install.sh          # Main installation script
├── update.sh           # Update script (created during install)
├── gitconfig           # Git configuration
├── gitignore           # Global gitignore
├── zshrc               # Zsh configuration
├── .mise.toml          # Mise tool versions
└── ghostty/
    └── config          # Ghostty terminal config
```
