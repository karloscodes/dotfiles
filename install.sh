#!/bin/bash

# Get the current logged-in user
USER=$(whoami)

# Set up the dotfiles directory
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Function to create symlink safely
create_symlink() {
  local target=$1
  local link=$2
  
  if [ -L "$link" ]; then
    echo "Removing existing symlink: $link"
    unlink "$link"
  elif [ -f "$link" ] || [ -d "$link" ]; then
    # Only create backup if it's not already a backup file
    if [[ ! "$link" =~ \.backup ]]; then
      echo "Backing up existing file/directory: $link to $link.backup"
      mv "$link" "$link.backup"
    else
      echo "Removing existing backup: $link"
      rm -rf "$link"
    fi
  fi
  
  echo "Creating symlink: $link -> $target"
  ln -s "$target" "$link"
}

# Create symlinks for dotfiles
create_symlink "$DIR/gitconfig" ~/.gitconfig
create_symlink "$DIR/gitignore" ~/.gitignore
create_symlink "$DIR/zshrc" ~/.zshrc
create_symlink "$DIR/.mise.toml" ~/.mise.toml
create_symlink "$DIR/starship.toml" ~/.config/starship.toml

# Create Ghostty config directory and symlink
mkdir -p ~/.config/ghostty
create_symlink "$DIR/ghostty/config" ~/.config/ghostty/config

# Create Neovim config directory and symlink
mkdir -p ~/.config
create_symlink "$DIR/nvim" ~/.config/nvim




# Uncomment the following lines if you want to manage tmux configuration as well
# unlink ~/.tmux.conf
# ln -s "$DIR/tmux.conf" ~/.tmux.conf

APT=$(which apt-get)

if [ ! -z $APT ]; then
  sudo apt-get update && sudo apt-get install -y \
    zsh \
    git \
    synapse \
    gnome-tweak-tool \
    code \
    gnupg2 \
    tmux \
    curl \
    ttf-mscorefonts-installer \
    ripgrep \
    ctgs \
    neovim
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Install Homebrew if not installed
  if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "Homebrew already installed"
  fi

  # Determine Homebrew installation path
  if [ -d /opt/homebrew ]; then
    BREW_PREFIX="/opt/homebrew"
  else
    BREW_PREFIX="/usr/local"
  fi

  # Add Homebrew to the path and shell profile
  if ! grep -q "eval.*brew shellenv" ~/.zprofile 2>/dev/null; then
    echo 'eval "$('"$BREW_PREFIX"'/bin/brew shellenv)"' >> ~/.zprofile
  fi
  eval "$("$BREW_PREFIX"/bin/brew shellenv)"

  # Fix permissions dynamically (only if needed)
  if [ ! -w "$BREW_PREFIX/var/homebrew" ] || [ ! -w "$BREW_PREFIX/Homebrew" ] || [ ! -w "$BREW_PREFIX/bin" ]; then
    echo "Fixing Homebrew permissions..."
    sudo chown -R $USER "$BREW_PREFIX/var/homebrew" 2>/dev/null || true
    sudo chown -R $USER "$BREW_PREFIX/Homebrew" 2>/dev/null || true
    sudo chown -R $USER "$BREW_PREFIX/bin" 2>/dev/null || true
  fi

  # Install mise if not installed
  if ! command -v mise &> /dev/null; then
    echo "Installing mise..."
    curl https://mise.run | sh
  else
    echo "mise already installed"
  fi

  # Function to install brew package if not already installed
  install_brew_package() {
    if ! brew list "$1" &> /dev/null; then
      echo "Installing $1..."
      brew install "$1"
    else
      echo "$1 already installed"
    fi
  }

  # Function to install cask if not already installed
  install_brew_cask() {
    if ! brew list --cask "$1" &> /dev/null; then
      echo "Installing cask $1..."
      brew install --cask "$1"
    else
      echo "Cask $1 already installed"
    fi
  }

  # Core development tools
  install_brew_cask visual-studio-code
  install_brew_cask raycast
  install_brew_package docker
  install_brew_package git
  install_brew_package git-lfs
  install_brew_package htop
  install_brew_package telnet
  install_brew_package coreutils
  install_brew_package findutils
  install_brew_package wget
  install_brew_package grep
  install_brew_package p7zip
  install_brew_package imagemagick
  install_brew_package tree
  install_brew_package postgresql
  install_brew_package vips
  
  # Nerd Fonts - Updated installation method
  install_brew_cask font-jetbrains-mono-nerd-font
  install_brew_cask font-meslo-lg-nerd-font
  install_brew_cask font-hack-nerd-font
  
  install_brew_package mysql@5.7
  install_brew_package openssl 
  install_brew_package readline
  install_brew_package gpg 
  install_brew_package gawk
  install_brew_package firefox
  install_brew_package 1password
  install_brew_package notion
  
  # Essential CLI tools requested
  install_brew_package ripgrep
  install_brew_package lazygit
  install_brew_package fzf
  install_brew_package go
  install_brew_package bat        # Enhanced `cat` command with syntax highlighting
  install_brew_package exa        # Modern replacement for `ls`
  install_brew_package fd         # Simple, fast, user-friendly alternative to `find`
  install_brew_package tldr       # Simplified and community-driven man pages
  install_brew_package the_silver_searcher  # A code-searching tool similar to `ack`, but faster
  install_brew_package httpie     # User-friendly HTTP client
  install_brew_package jq         # Command-line JSON processor
  install_brew_package ncdu       # Disk usage analyzer with an ncurses interface
  install_brew_package glances    # System monitoring tool
  install_brew_package btop       # Resource monitor that shows usage and stats
  install_brew_package mas        # Mac App Store command-line interface
  install_brew_package watch      # Executes a program periodically, showing output fullscreen
  install_brew_package neovim     # Modern Vim-based text editor
  install_brew_package starship   # Cross-shell prompt
  install_brew_package zsh-autosuggestions    # Fish-like autosuggestions for zsh
  install_brew_package zsh-syntax-highlighting # Fish-like syntax highlighting for zsh
  install_brew_package zsh-completions # Additional completion definitions for zsh
  
  # Terminal emulator
  install_brew_cask ghostty

  # Install Xcode command line tools if not present
  if ! xcode-select -p &> /dev/null; then
    echo "Installing Xcode command line tools..."
    xcode-select --install
  else
    echo "Xcode command line tools already installed"
  fi

  # Setup fzf key bindings and fuzzy completion
  if [ -f "$(brew --prefix)/opt/fzf/install" ]; then
    echo "Setting up fzf key bindings and completion..."
    "$(brew --prefix)/opt/fzf/install" --all --no-update-rc
  fi

  # Setup starship with Catppuccin Powerline preset
  if command -v starship &> /dev/null; then
    echo "Setting up Starship with Catppuccin Powerline preset..."
    starship preset catppuccin-powerline -o ~/.config/starship.toml
    # Copy the preset to dotfiles for version control
    cp ~/.config/starship.toml "$DIR/starship.toml"
  fi

  # Setup mise with development tools
  echo "Setting up mise with development environments..."
  eval "$(~/.local/bin/mise activate zsh)" 2>/dev/null || true
  
  # Trust the mise configuration file
  if command -v mise &> /dev/null && [ -f ~/.mise.toml ]; then
    echo "Trusting mise configuration..."
    mise trust ~/.mise.toml || true
  fi
  
  # Install development environments through mise
  if command -v mise &> /dev/null; then
    echo "Installing Node.js via mise..."
    mise use --global node@lts || true
    
    echo "Installing Go via mise..."
    mise use --global go@latest || true
    
    echo "Installing Elixir via mise..."
    mise use --global elixir@latest || true
    
    # Note: Rails is a Ruby gem, so we need Ruby first
    echo "Installing Ruby via mise..."
    mise use --global ruby@latest || true
    
    # Install Rails after Ruby is available
    echo "Installing Rails gem..."
    ~/.local/share/mise/installs/ruby/*/bin/gem install rails || true
  fi

  # macOS configurations
  # Finder: show all filename extensions
  # defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  # Finder: show hidden files by default
  defaults write com.apple.finder AppleShowAllFiles -bool false

  # Finder: show status bar
  defaults write com.apple.finder ShowStatusBar -bool false

  # Finder: show path bar
  defaults write com.apple.finder ShowPathbar -bool true

  # Finder: allow text selection in Quick Look
  defaults write com.apple.finder QLEnableTextSelection -bool true

  # Finder: use list view in all Finder windows by default
  defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

  # Save screenshots to the Downloads folder
  defaults write com.apple.screencapture location -string "${HOME}/Documents/Screenshots"
  
  # Restart Finder and Dock to apply changes
  killall Finder 2>/dev/null || true
  killall Dock 2>/dev/null || true

  # Clean up and check brew health
  echo "Cleaning up Homebrew..."
  brew cleanup
  brew doctor || true
fi

echo "All dotfiles have been installed :)"

# Create update script for easy maintenance
cat > "$DIR/update.sh" << 'EOF'
#!/bin/bash
echo "Updating dotfiles and system packages..."

# Update Homebrew and packages
if command -v brew &> /dev/null; then
  echo "Updating Homebrew..."
  brew update
  brew upgrade
  brew cleanup
  brew autoremove
fi

# Update mise and managed runtimes
if command -v mise &> /dev/null; then
  echo "Updating mise and runtimes..."
  mise self-update
  mise upgrade
fi

echo "Update complete!"
EOF

chmod +x "$DIR/update.sh"
echo "Created update.sh script for easy maintenance"
