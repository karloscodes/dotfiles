DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

unlink ~/.gitconfig
ln -s "$DIR/gitconfig" ~/.gitconfig

unlink ~/.gitignore
ln -s "$DIR/gitignore" ~/.gitignore


unlink ~/.zshrc
ln -s "$DIR/zshrc" ~/.zshrc


unlink ~/.tmux.conf
ln -s "$DIR/tmux.conf" ~/.tmux.conf

unlink ~/.config/Code/User/keybindings.json
unlink ~/.config/Code/User/settings.json
ln -s "$DIR/vscode/keybindings.json" ~/.config/Code/User/keybindings.json
ln -s "$DIR/vscode/settings.json" ~/.config/Code/User/settings.json


# Install dependencies
if [ -d "$HOME/.fzf" ]; then
  echo "fzf already installed, skipping installation..."
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
fi

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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  brew install git-lfs
  brew install htop
  brew install telnet
  brew install git
  brew install coreutils
  brew install findutils
  brew install wget --with-iri
  brew install grep
  brew install p7zip
  brew install imagemagick --with-webp
  brew install tree
  brew install tmux
  brew install postgresql
  brew install yarn
  brew tap homebrew/cask-fonts
  brew cask install font-jetbrains-mono
  brew install mysql@5.7
  brew cleanup
fi



if [ -d "$HOME/.rvm" ]; then
  echo "rvm already installed, skipping installation..."
else
  gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  \curl -sSL https://get.rvm.io | bash -s stable
fi

if [ -d "$HOME/.nvm" ]; then
  echo "nvm already installed, skipping installation..."
else
 curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
fi

if [ -d "$HOME/.pyenv" ]; then
  echo "pyenv already installed, skipping installation..."
else
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
fi


# Install vscode extensions

code --install-extension patbenatar.advanced-new-file

code --install-extension rebornix.ruby
code --install-extension castwide.solargraph
code --install-extension noku.rails-run-spec-vscode
# code --install-extension misogi.ruby-rubocop

code --install-extension chenxsan.vscode-standardjs
code --install-extension dbaeumer.vscode-eslint
code --install-extension streetsidesoftware.code-spell-checker

code --install-extension jolaleye.horizon-theme-vscode
code --install-extension wesbos.theme-cobalt2
code --install-extension alexanderte.dainty-vscode
code --install-extension coenraads.bracket-pair-colorizer

code --install-extension bwildeman.tabulous
code --install-extension tusaeff.vscode-iterm2-theme-sync
code --install-extension vspacecode.vspacecode

# Install spacemacs
# git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

zsh

echo "Warning: Please install nerdfonts from: https://github.com/ryanoasis/nerd-fonts"
echo "All dotfiles have been installed :)"


# https://github.com/zsh-users/zsh-completions/issues/433

