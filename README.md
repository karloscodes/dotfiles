# dotfiles

My dotfiles configuration for macOS development environment.

## What's Included

### Development Tools
- **mise**: Runtime version manager for Node.js, Go, Ruby, Elixir
- **ripgrep**: Fast text search tool
- **lazygit**: Terminal UI for git commands
- **fzf**: Fuzzy finder for command line
- **bat, exa, fd, tldr**: Enhanced CLI tools
- **zellij**: Modern terminal multiplexer

### Terminal & Editor
- **Ghostty**: Modern terminal emulator with Catppuccin theme
- **MesloLGS Nerd Font**: Primary terminal font
- **JetBrains Mono, Meslo & Hack Nerd Fonts**: Additional font options
- **Visual Studio Code**: Primary code editor
- **LazyVim**: Modern Neovim configuration with sensible defaults

### Shell Configuration
- **Zsh** with Starship prompt
- **zsh-autosuggestions**: Fish-like autosuggestions for zsh
- **zsh-syntax-highlighting**: Fish-like syntax highlighting for zsh
- **zsh-completions**: Additional completion definitions for zsh
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
- Font family: MesloLGS Nerd Font
- Theme: Catppuccin Mocha (dark/light)

### Zellij Configuration
Terminal multiplexer configured with:
- Catppuccin Mocha theme
- Intuitive Alt+key bindings for navigation
- Mouse support and clipboard integration
- Compact layout with rounded corners

### Neovim Configuration
LazyVim is configured with:
- Modern Neovim setup with sensible defaults
- Built-in LSP support for multiple languages
- File explorer, fuzzy finder, and git integration
- Beautiful UI with proper syntax highlighting
- Multiple themes: Catppuccin Mocha, Tokyo Night, Darcula, Gruvbox

## File Structure
```
dotfiles/
├── install.sh          # Main installation script
├── update.sh           # Update script (created during install)
├── gitconfig           # Git configuration
├── gitignore           # Global gitignore
├── zshrc               # Zsh configuration
├── .mise.toml          # Mise tool versions
├── starship.toml       # Starship prompt configuration
├── ghostty/
│   └── config          # Ghostty terminal config
├── zellij/
│   └── config.kdl      # Zellij terminal multiplexer config
└── nvim/               # LazyVim configuration
    ├── init.lua        # Neovim entry point
    └── lua/
        ├── config/     # LazyVim configuration files
        └── plugins/    # Custom plugin configurations
```
