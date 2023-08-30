DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

unlink ~/.gitconfig
ln -s "$DIR/gitconfig" ~/.gitconfig

unlink ~/.gitignore
ln -s "$DIR/gitignore" ~/.gitignore


unlink ~/.zshrc
ln -s "$DIR/zshrc" ~/.zshrc

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
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
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
  brew install --cask font-jetbrains-mono
  brew install mysql@5.7
  brew install openssl 
  brew install readline
  brew install gpg 
  brew install gawk
  brew install asdf

  brew install fzf
  xcode-select --install
  brew cleanup

  # To install useful key bindings and fuzzy completion:
  $(brew --prefix)/opt/fzf/install

  # asdf
  echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
  source ~/.zshrc
  
  asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
  RUBY_CFLAGS="-w" asdf install ruby 3.1.0

  asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  asdf install nodejs 16.16.0
  asdf global nodejs 16.16.0


  source ~/.zshrc
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
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


# https://github.com/zsh-users/zsh-completions/issues/433

