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
mkdir -p ~/.config/alacritty

# Unlink and link the Alacritty configuration file
unlink ~/.config/alacritty/alacritty.yml
ln -s "$DIR/alacritty.yml" ~/.config/alacritty/alacritty.yml

# Uncomment the following lines if you want to manage tmux configuration as well
# unlink ~/.tmux.conf
# ln -s "$DIR/tmux.conf" ~/.tmux.conf

unlink ~/.config/Code/User/keybindings.json
unlink ~/.config/Code/User/settings.json
ln -s "$DIR/vscode/keybindings.json" ~/.config/Code/User/keybindings.json
ln -s "$DIR/vscode/settings.json" ~/.config/Code/User/settings.json

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

  sudo chown -R $USER /usr/local/share/zsh /usr/local/share/zsh/site-functions

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  
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
  brew install tmux
  brew install postgresql
  brew install yarn
  brew install vips
  brew tap homebrew/cask-fonts
  brew install --cask font-jetbrains-mono-nerd-font
  brew install mysql@5.7
  brew install openssl 
  brew install readline
  brew install gpg 
  brew install gawk
  brew install --cask alacritty

  brew install fzf

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

  xcode-select --install
  brew cleanup

  # To install useful key bindings and fuzzy completion:
  source <(fzf --zsh)
fi

# Install vscode extensions
code --install-extension patbenatar.advanced-new-file
code --install-extension rebornix.ruby
code --install-extension castwide.solargraph
code --install-extension noku.rails-run-spec-vscode
code --install-extension chenxsan.vscode-standardjs
code --install-extension dbaeumer.vscode-eslint
code --install-extension streetsidesoftware.code-spell-checker
code --install-extension jolaleye.horizon-theme-vscode
code --install-extension wesbos.theme-cobalt2
code --install-extension alexanderte.dainty-vscode
# code --install-extension bwildeman.tabulous
code --install-extension tusaeff.vscode-iterm2-theme-sync
# code --install-extension vspacecode.vspacecode

echo "All dotfiles have been installed :)"