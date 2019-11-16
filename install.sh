DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

unlink ~/.gitconfig
unlink ~/.vimrc
unlink ~/.zshrc
unlink ~/.fzf
unlink ~/.tmux.conf
unlink ~/.spacemancs
unlink ~/.config/Code/User/keybindings.json
unlink ~/.config/Code/User/settings.json


ln -s "$DIR/gitconfig" ~/.gitconfig
ln -s "$DIR/zshrc" ~/.zshrc
ln -s "$DIR/vimrc" ~/.vimrc
ln -s "$DIR/fzf" ~/.fzf
ln -s "$DIR/tmux.conf" ~/.tmux.conf
ln -s "$DIR/spacemacs" ~/.spacemacs
ln -s "$DIR/vscode/keybindings.json" ~/.config/Code/User/keybindings.json
ln -s "$DIR/vscode/settings.json" ~/.config/Code/User/settings.json



git submodule init
git submodule update

# Install dependencies

$DIR/fzf/install

APT=$(which apt-get)

if [[ ! -z $APT ]]; then
  sudo apt-get update && sudo apt-get install -y \
    zsh \
    git \
    synapse \
    gnome-tweak-tool \
    code \
    gnupg2 \
    tmux \
    curl \
    ttf-mscorefonts-installer
end

if [ -d "$HOME/.nvm" ]; then
  echo "nvm already installed, skipping installation..."
else
 curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
fi

if [ -d "$HOME/.rvm" ]; then
  echo "rvm already installed, skipping installation..."
else
 gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
 \curl -sSL https://get.rvm.io | bash -s stable
fi

if [ -d "$HOME/.rvm" ]; then
  echo "pyenv already installed, skipping installation..."
else
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
fi


# Install vscode extensions

code --install-extension patbenatar.advanced-new-file

code --install-extension rebornix.ruby
code --install-extension castwide.solargraph
code --install-extension noku.rails-run-spec-vscode
code --install-extension misogi.ruby-rubocop

code --install-extension chenxsan.vscode-standardjs
code --install-extension dbaeumer.vscode-eslint
code --install-extension streetsidesoftware.code-spell-checker

code --install-extension jolaleye.horizon-theme-vscode
code --install-extension wesbos.theme-cobalt2
code --install-extension coenraads.bracket-pair-colorizer

# Install spacemacs
# git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

zsh

echo "All dotfiles have been installed :)"

