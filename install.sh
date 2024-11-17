#!/bin/bash

# Get the current logged-in user
USER=$(whoami)

# Set up the dotfiles directory
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

unlink ~/.gitconfig
ln -s "$DIR/gitconfig" ~/.gitconfig

unlink ~/.gitignore
ln -s "$DIR/gitignore" ~/.gitignore

unlink ~/.zshrc
ln -s "$DIR/zshrc" ~/.zshrc

# Create Alacritty config directory if it doesn't exist
# mkdir -p ~/.config/alacritty

# Unlink and link the Alacritty configuration file
# unlink ~/.config/alacritty/alacritty.toml
# ln -s "$DIR/alacritty.toml" ~/.config/alacritty/alacritty.toml


# Unlink and link the Alacritty configuration file
# unlink ~/.config/zellij/config.kdl
# ln -s "$DIR/zellij.kdl" ~/.config/zellij/config.kdl

unlink ~/.wezterm.lua
ln -s "$DIR/.wezterm.lua" ~/.wezterm.lua


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
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  # Determine Homebrew installation path
  if [ -d /opt/homebrew ]; then
    BREW_PREFIX="/opt/homebrew"
  else
    BREW_PREFIX="/usr/local"
  fi

  # Add Homebrew to the path and shell profile
  echo 'eval "$('"$BREW_PREFIX"'/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$("$BREW_PREFIX"/bin/brew shellenv)"

  # Fix permissions dynamically
  sudo chown -R $USER $BREW_PREFIX/var/homebrew
  sudo chown -R $USER $BREW_PREFIX/Homebrew
  sudo chown -R $USER $BREW_PREFIX/bin

  # Install and Activate mise
  curl https://mise.run | sh


  brew install --cask visual-studio-code
  brew install --cask raycast
  brew install docker
  brew install git
  brew install git-lfs
  brew install htop
  brew install telnet
  brew install coreutils
  brew install findutils
  brew install wget
  brew install grep
  brew install p7zip
  brew install imagemagick
  brew install tree
  brew install postgresql
  brew install vips
  brew tap homebrew/cask-fonts
  brew install --cask font-jetbrains-mono-nerd-font
  brew install mysql@5.7
  brew install openssl 
  brew install readline
  brew install gpg 
  brew install gawk
  brew install firefox
  brew install 1password
  brew install notion
  brew install fzf
  brew install wezterm
  brew install starship
  brew install go
  brew install bat        # Enhanced `cat` command with syntax highlighting
  brew install exa        # Modern replacement for `ls`
  brew install fd         # Simple, fast, user-friendly alternative to `find`
  brew install tldr       # Simplified and community-driven man pages
  brew install the_silver_searcher  # A code-searching tool similar to `ack`, but faster
  brew install httpie     # User-friendly HTTP client
  brew install jq         # Command-line JSON processor
  brew install ncdu       # Disk usage analyzer with an ncurses interface
  brew install glances    # System monitoring tool
  brew install btop       # Resource monitor that shows usage and stats
  brew install mas        # Mac App Store command-line interface
  brew install watch      # Executes a program periodically, showing output fullscreen
  brew install neovim     # Modern Vim-based text editor
  brew install zsh-completions

  # Add starship to the shell profile
  echo 'eval "$(starship init zsh)"' >> $HOME/.zshrc

  xcode-select --install

  # To install useful key bindings and fuzzy completion:
  # source <(fzf --zsh)
  $(brew --prefix)/opt/fzf/install --all

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

  # Disable press-and-hold for keys in favor of key repeat
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

  # Set a fast key repeat rate
  defaults write NSGlobalDomain KeyRepeat -int 2
  defaults write NSGlobalDomain InitialKeyRepeat -int 12

  # Show battery percentage
  defaults write com.apple.menuextra.battery ShowPercent -string "YES"

  # Expand save panel by default
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

  # Expand print panel by default
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
  defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

  # Save screenshots to the Downloads folder
  defaults write com.apple.screencapture location -string "${HOME}/Documents/Screenshots"
  
  # Restart Finder and Dock to apply changes
  killall Finder
  killall Dock

  brew cleanup
  brew doctor
fi

echo "All dotfiles have been installed :)"
