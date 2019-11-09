DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

unlink ~/.gitconfig
unlink ~/.vimrc
unlink ~/.zshrc
unlink ~/.fzf
unlink ~/.tmux.conf
unlink ~/.spacemancs

ln -s "$DIR/gitconfig" ~/.gitconfig
ln -s "$DIR/zshrc" ~/.zshrc
ln -s "$DIR/vimrc" ~/.vimrc
ln -s "$DIR/fzf" ~/.fzf
ln -s "$DIR/tmux.conf" ~/.tmux.conf
ln -s "$DIR/spacemacs" ~/.spacemacs

git submodule init
git submodule update

$DIR/fzf/install

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

zsh

echo "All dotfiles have been installed :)"

